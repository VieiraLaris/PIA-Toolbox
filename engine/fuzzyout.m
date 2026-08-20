function [output]=fuzzyout(input,nvar,nse,param_in,defe,nss,param_out,defs,rb,nat) % a,s (nessa ordem)

% Graus de pertinência e cálculo dos contribuintes 
gp=zeros(1,length(defe)); %% grau de pertinencia
signal=zeros(1,length(defe)); %% Se ta a esquerda ou direita (-1 e 1)
outcontr=zeros(length(defe),nss,3); % calculo dos contribuintes da saída

cont=0;
j=1;
for i=1:length(defe)
    cont=cont+1;
    if cont>nse(j)
        cont=1;
        j=j+1;
    end
    gp(i)= degmem(input(j),param_in(i,:),defe(i));
    for k=1:nss
        %%%%%%%%%%%% o correto %%%%%%%%%%%%%
        status=1;
        outcontr(i,k,status)= contr_var(gp(i),status,param_out(k,:),defs(k));
        status=status+1;
        outcontr(i,k,status)= contr_var(gp(i),status,param_out(k,:),defs(k));
        status=status+1;
        outcontr(i,k,status)= contr_var(gp(i),status,param_out(k,:),defs(k));
    end
    
    signal(i)=location(input(j),param_in(i,:),defe(i));
    
end

%%%%%%%%%% Cálculo dos Consequentes %%%%%%%%%%%
w=ones(1,length(rb)); %%% peso de cada regra
W=zeros(1,nss); %%% peso de consequente
Wsum=zeros(1,nss); %%% peso de consequente
resp=zeros(1,length(rb)); %%% resposta para cada regra
RESP=zeros(1,nss); %%% resposta para cada consequente
cont=ones(1,nvar);
cont(1)=0;
for i=1:length(rb)
    cont(1)=cont(1)+1;
    for j=1:nvar
        if cont(j)>nse(j)
            cont(j+1)=cont(j+1)+1;
            cont(j)=1;
        end
    end
    outint=zeros(1,nvar);
    for j=1:nvar
        aux=0;
        if j>1
            for k=1:j-1
                aux=aux+nse(k);
            end
        end
        aux=aux+cont(j);
        if (nat(i,j)==1 && signal(aux)==-1) || (nat(i,j)==-1 && signal(aux)==1)
            outint(j) = outcontr(aux,rb(i),1);
        elseif (nat(i,j)==1 && signal(aux)==1) || (nat(i,j)==-1 && signal(aux)==-1)
            outint(j) = outcontr(aux,rb(i),3);
        else
            outint(j) = outcontr(aux,rb(i),2);
        end
        w(i)=w(i)*gp(aux);
    end
    resp(i)=w(i)*sum(outint)/nvar;
end
for j=1:nss
    for i=1:length(rb)
        if j==rb(i)
            W(j)=max(W(j),w(i));
            Wsum(j)=Wsum(j)+w(i);
            RESP(j)=RESP(j)+resp(i);
        end
    end
    if (RESP(j)==0)
        RESP(j)=0;
    else
        RESP(j)=RESP(j)/Wsum(j);
    end
end
if sum(W)==0
    output=0;
else
    output= sum(W.*RESP)/sum(W);
end

end