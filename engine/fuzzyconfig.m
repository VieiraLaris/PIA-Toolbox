function [nat]=fuzzyconfig(nvar,nse,rb) % a,s (nessa ordem)

%%%% -1: decrescente
%%%%  0: não sei
%%%%  1: crescente
nat=zeros(length(rb),nvar);
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
    for j=1:nvar
        aux=1;
        if j~=1
            for k=1:j-1
                aux=aux*nse(k); 
            end
        end
        if (cont(j)==1 || cont(j)==nse(j))
            if cont(j)==1
                if rb(i)<rb(i+aux)
                    nat(i,j)=1;
                end
                if rb(i)>rb(i+aux)
                    nat(i,j)=-1;
                end
            end
            if cont(j)==nse(j)
                if rb(i)<rb(i-aux)
                    nat(i,j)=-1;
                end
                if rb(i)>rb(i-aux)
                    nat(i,j)=1;
                end
            end
        else
            if rb(i-aux)<rb(i) && rb(i+aux)>rb(i)
                nat(i,j)=1;
            end
            if rb(i-aux)>rb(i) && rb(i+aux)<rb(i)
                nat(i,j)=-1;
            end
        end
    end
end
end