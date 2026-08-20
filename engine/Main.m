 %%%%%%%%%%%% Controle do Ângulo de Arfagem Através do Profundor %%%%%%
 
 clc
 clear all
 close all
 
 
%%%%%%%%%%%% Definição das Entradas %%%%%%%%%%%%%%%%%%%%%%%%%
nvar=2; % Duas váriaveis: Água e Sol
nse=[3 3]; % Três funções para cada uma: pequeno, médio e grande
membfcn_in=[1 1 1 1 1 1]; % 1: triang  2: trap  3: norm
lim_search_in=[0 66 0 95];
param_in = [0 20 38 inf; 20 38 56 inf; 38 66 66 inf; 0 30 60 inf; 30 60 90 inf; 60 95 95 inf];

%%%%%%%%%%%%%%%%%%%% Definição da Saída %%%%%%%%%%%%%%%%%%%%%%%%%
nss=3; % Três funções para a saída: ruim, média e boa
membfcn_out=[1 1 1]; % 1: triang  2: trap  3: norm
lim_search_out=[0 1];
%param_out=[-1 0 1 inf; 0.5 0.75 1.25 1.5; 1 2 3 inf]; % media e desvio padrão, ou pontos, da esquerda para a direita
param_out = [0 0 0.2 inf; 0.1 0.5 0.9 inf; 0.8 1 1 inf];

%%%%%%%%%%%%%%%%%%%% Definição da Base de Regras %%%%%%%%%%%%%%%%%%%%%%%%%
rb = [2 3 1 2 3 1 1 2 1];  % var 1,var 2 ... (relação obtida da mesma forma que tabela verdade: MSB var n ... var 1 LSB )
                           % 0 0
                           % 0 1
                           % 1 0
                           % 1 1  ...
               
%%%%%%%%%%%%%%%%%%%% RELAÇÃO CRESCENTE/DECRESCENTE %%%%%%%%%%%%%%%%%%%%%%%%%
nat=fuzzyconfig(nvar,nse,rb);
 
%%%%%%%%%%%%%%%%%%%%%% PLOT DAS FUNÇÕES DE PERTINÊNCIA %%%%%%%%%%%%%%%%
vet=0:0.01:1;

%%%%%%%%%%%%%%%%%%%%%%%%%% ENTRADAS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 aux_lim=-1;
 X=zeros(nvar,length(vet));
 aux_mf=0;
 for i=1:nvar
     aux_lim=aux_lim+2;
     limite=lim_search_in(aux_lim:aux_lim+1);
     X(i,:)=(limite(2)-limite(1)).*vet+limite(1);
     GP_in=zeros(nse(i),length(vet));
     for j=1:nse(i)
         aux_mf=aux_mf+1;
         param=param_in(aux_mf,:);
         type=membfcn_in(aux_mf);
         for k=1:length(vet)
             GP_in(j,k)=degmem(X(i,k),param,type);
         end
         figure(i)
         plot(X(i,:),GP_in(j,:))
         xlabel ('INPUT')
         ylabel ('Degre of Membership')
         hold on
         pause(0.01)
     end
 end
 
 %%%%%%%%%%%%%%%%%%%%%%%%%% SAÍDA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 Y=zeros(1,length(vet));
 aux_mf=0;
 limite=lim_search_out;
 Y=(limite(2)-limite(1)).*vet+limite(1);
 GP_out=zeros(nss,length(vet));
 for j=1:nss
     aux_mf=aux_mf+1;
     param=param_out(aux_mf,:);
     type=membfcn_out(aux_mf);
     for k=1:length(vet)
         GP_out(j,k)=degmem(Y(k),param,type);
     end
     figure(nvar+1)
     plot(Y,GP_out(j,:))
     xlabel ('OUTPUT')
     ylabel ('Degre of Membership')
     hold on
     pause(0.01)
 end
  
%%%%%%%%%%%%%%%%%%%%%%%%% CALCULO DA SAÍDA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nvar==1
    Y=zeros(1,length(X));
    for i=1:length(X)
        input=X(i);
        Y(i)=lim_out(fuzzyout(input,nvar,nse,param_in,membfcn_in,nss,param_out,membfcn_out,rb,nat),lim_search_out);
    end
    figure(nvar+2)
    plot(X,Y)
    title ('PIA Fuzzy Inference System')
    xlabel ('INPUT')
    ylabel ('OUTPUT')
    
elseif nvar==2
    [X_surf_1 X_surf_2]=meshgrid(X(1,:),X(2,:));
    Y=zeros(length(X(1,:)),length(X(2,:)));
    for i=1:length(X(1,:))
        for j=1:length(X(2,:))
            input=[X(1,i) X(2,j)];
            Y(j,i)=lim_out(fuzzyout(input,nvar,nse,param_in,membfcn_in,nss,param_out,membfcn_out,rb,nat),lim_search_out);
        end
    end
    figure(nvar+2)
    surf(X_surf_1,X_surf_2,Y)
    title ('PIA Fuzzy Inference System')
    xlabel ('INPUT 1')
    ylabel ('INPUT 2')
    zlabel ('OUTPUT')
end

%%%%%%%%%%%%%%%%%%%%%%%%% EXEMPLO DE SAÍDA %%%%%%%%%%%%%%%%%%%%%%

% Entrada de teste
agua = 50;
sol = 70;

input = [agua sol];

% Cálculo da saída
saida = lim_out(fuzzyout(input,nvar,nse,param_in,membfcn_in,nss,param_out,membfcn_out,rb,nat),lim_search_out);

fprintf('Água: %.1f ml\n', agua);
fprintf('Sol: %.1f min\n', sol);
fprintf('Vitalidade: %.3f\n', saida);

 