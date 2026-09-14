%%%%%%%%%%%% PIA TOOLBOX - TESTE DOS MÉTODOS DE UPDATE E DELETE %%%%%%%%%%%%

clc
clear
close all

% =========================================================
% CRIAÇÃO DO SISTEMA
% =========================================================

pia = PIASystem("Teste");

% =========================================================
% TESTE DOS INPUTS
% =========================================================

disp("========== TESTE DOS INPUTS ==========")

pia = addInput(pia, "Água", [0 66]);
pia = addInput(pia, "Sol", [0 95]);
pia = addInput(pia, "Temperatura", [0 100]);

% Teste deleteInput

pia = deleteInput(pia, 1);

disp("* Inputs após deleteInput:")

for i = 1:length(pia.Inputs)
    disp(pia.Inputs(i).ID + " -> " + pia.Inputs(i).Name)
end

% Teste updateInput

pia = updateInput(pia, 1, "Novo Sol", [0 50]);

disp("* Input após updateInput:")
disp("Nome: " + pia.Inputs(1).Name)
disp("Range:")
disp(pia.Inputs(1).Range)

% =========================================================
% TESTE DOS OUTPUTS
% =========================================================

disp("========== TESTE DOS OUTPUTS ==========")

pia = addOutput(pia, "Vitalidade", [0 1]);
pia = addOutput(pia, "Qualidade", [0 100]);
pia = addOutput(pia, "Resultado", [0 10]);

% Teste deleteOutput

pia = deleteOutput(pia, 1);

disp("* Outputs após deleteOutput:")

for i = 1:length(pia.Outputs)
    disp(pia.Outputs(i).ID + " -> " + pia.Outputs(i).Name)
end

% Teste updateOutput

pia = updateOutput(pia, 1, "Nova Qualidade", [0 50]);

disp("* Output após updateOutput:")
disp("Nome: " + pia.Outputs(1).Name)
disp("Range:")
disp(pia.Outputs(1).Range)

% =========================================================
% TESTE DAS MEMBERSHIP FUNCTIONS DE INPUT
% =========================================================

disp("========== TESTE DAS MFs DE INPUT ==========")

pia = addMF(pia, "input", 1, "trimf", [0 20 40], "pequena");
pia = addMF(pia, "input", 1, "trimf", [20 40 60], "média");
pia = addMF(pia, "input", 1, "trimf", [40 60 80], "grande");

% Teste deleteMF

pia = deleteMF(pia, "input", 1, 1);

disp("* MFs do input após deleteMF:")

for i = 1:length(pia.Inputs(1).MembershipFunctions)
    disp(pia.Inputs(1).MembershipFunctions(i).ID + " -> " + pia.Inputs(1).MembershipFunctions(i).Name)
end

% Teste updateMF

pia = updateMF(pia, "input", 1, 1, "nova média", "trimf", [10 30 50]);

disp("* MF do input após updateMF:")
disp("Nome: " + pia.Inputs(1).MembershipFunctions(1).Name)
disp("Tipo: " + pia.Inputs(1).MembershipFunctions(1).Type)
disp("Parâmetros:")
disp(pia.Inputs(1).MembershipFunctions(1).Parameters)

% =========================================================
% TESTE DAS MEMBERSHIP FUNCTIONS DE OUTPUT
% =========================================================

disp("========== TESTE DAS MFs DE OUTPUT ==========")

pia = addMF(pia, "output", 1, "trimf", [0 0 20], "baixa");
pia = addMF(pia, "output", 1, "trimf", [10 50 90], "média");
pia = addMF(pia, "output", 1, "trimf", [80 100 100], "alta");

% Teste deleteMF

pia = deleteMF(pia, "output", 1, 1);

disp("* MFs do output após deleteMF:")

for i = 1:length(pia.Outputs(1).MembershipFunctions)
    disp(pia.Outputs(1).MembershipFunctions(i).ID + " -> " + pia.Outputs(1).MembershipFunctions(i).Name)
end

% Teste updateMF

pia = updateMF(pia, "output", 1, 1, "nova média", "trimf", [20 50 80]);

disp("* MF do output após updateMF:")
disp("Nome: " + pia.Outputs(1).MembershipFunctions(1).Name)
disp("Tipo: " + pia.Outputs(1).MembershipFunctions(1).Type)
disp("Parâmetros:")
disp(pia.Outputs(1).MembershipFunctions(1).Parameters)

% =========================================================
% TESTE DAS RULES
% =========================================================

disp("========== TESTE DAS RULES ==========")

pia = addRule(pia, [1 1], 2);
pia = addRule(pia, [1 2], 2);
pia = addRule(pia, [2 1], 3);

% Teste deleteRule

pia = deleteRule(pia, 2);

disp("* Rules após deleteRule:")

for i = 1:length(pia.Rules)
    disp(pia.Rules(i).ID + " -> Antecedent: " + mat2str(pia.Rules(i).Antecedent) + " | Consequent: " + num2str(pia.Rules(i).Consequent))
end

% Teste updateRule

pia = updateRule(pia, 1, [2 1], 3);

disp("* Rule após updateRule:")
disp("Antecedent:")
disp(pia.Rules(1).Antecedent)
disp("Consequent:")
disp(pia.Rules(1).Consequent)