%%%%%%%%%%%% PIA TOOLBOX - TESTE COM PIASystem E runPIA %%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% Vitalidade das Violetas %%%%%%%%%%%%%%%%%%%%%%

clc
clear
close all

%%%%%%%%%%%%%%%%%%%% Criação do Sistema %%%%%%%%%%%%%%%%%%%%%%%%%

pia = PIASystem("Vitalidade");

%%%%%%%%%%%%%%%%%%%% Definição das Entradas %%%%%%%%%%%%%%%%%%%%%

pia = addInput(pia, "Água", [0 66]);
pia = addInput(pia, "Sol", [0 95]);

%%%%%%%%%%%%%%%%%%%% Definição da Saída %%%%%%%%%%%%%%%%%%%%%%%%%

pia = addOutput(pia, "Vitalidade", [0 1]);

%%%%%%%%%%%%%%%%%%%% Funções de Pertinência das Entradas %%%%%%%%

% Água
% Obs.: Adicionamos uma MF adicional para testar um caso em que a
% quantidade de MFs dos inputs é direfente.

pia = addMF(pia, "input", 1, "trimf", [0 15 30], "muito pequena");
pia = addMF(pia, "input", 1, "trimf", [15 30 45], "pequena");
pia = addMF(pia, "input", 1, "trimf", [30 45 60], "média");
pia = addMF(pia, "input", 1, "trimf", [45 66 66], "grande");

% Sol

pia = addMF(pia, "input", 2, "trimf", [0 30 60], "pequeno");
pia = addMF(pia, "input", 2, "trimf", [30 60 90], "médio");
pia = addMF(pia, "input", 2, "trimf", [60 95 95], "grande");

%%%%%%%%%%%%%%%%%%%% Funções de Pertinência da Saída %%%%%%%%%%%

pia = addMF(pia, "output", 1, "trimf", [0 0 0.2], "baixa");
pia = addMF(pia, "output", 1, "trimf", [0.1 0.5 0.9], "média");
pia = addMF(pia, "output", 1, "trimf", [0.8 1 1], "alta");

%%%%%%%%%%%%%%%%%%%% Base de Regras %%%%%%%%%%%%%%%%%%%%%%%%%%%%

pia = addRule(pia, [1 1], 1);
pia = addRule(pia, [1 2], 1);
pia = addRule(pia, [1 3], 1);

pia = addRule(pia, [2 1], 2);
pia = addRule(pia, [2 2], 2);
pia = addRule(pia, [2 3], 1);

pia = addRule(pia, [3 1], 2);
pia = addRule(pia, [3 2], 3);
pia = addRule(pia, [3 3], 2);

pia = addRule(pia, [4 1], 3);
pia = addRule(pia, [4 2], 3);
pia = addRule(pia, [4 3], 2);

%%%%%%%%%%%%%%%%%%%% Execução %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

saida = runPIA(pia, [50 70]);