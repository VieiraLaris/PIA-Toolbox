function saida = runPIA(pia, input)

%%%%%%%%%%%%%%%%%%%% Preparação dos Dados %%%%%%%%%%%%%%%%%%%%%%%

% Número de variáveis de entrada
nvar = length(pia.Inputs);

% Número de funções de pertinência de cada entrada
nse = zeros(1, nvar);

for i = 1:nvar
    nse(i) = length(pia.Inputs(i).MembershipFunctions);
end

% Parâmetros e tipos das MFs das entradas
param_in = [];
defe = [];

for i = 1:nvar
    for j = 1:nse(i)

        mf = pia.Inputs(i).MembershipFunctions(j);

        param_in = [param_in; mf.Parameters];

        if mf.Type == "trimf"
            defe = [defe 1];
        elseif mf.Type == "trapmf"
            defe = [defe 2];
        elseif mf.Type == "gaussmf"
            defe = [defe 3];
        end

    end
end

% Número de funções de pertinência da saída
nss = length(pia.Outputs(1).MembershipFunctions);

% Parâmetros e tipos das MFs da saída
param_out = [];
defs = [];

for i = 1:nss

    mf = pia.Outputs(1).MembershipFunctions(i);

    param_out = [param_out; mf.Parameters];

    if mf.Type == "trimf"
        defs = [defs 1];
    elseif mf.Type == "trapmf"
        defs = [defs 2];
    elseif mf.Type == "gaussmf"
        defs = [defs 3];
    end

end

% Base de regras
rb = zeros(1, length(pia.Rules));

for i = 1:length(pia.Rules)
    rb(i) = pia.Rules(i).Consequent;
end

%%%%%%%%%%%%%%%%%%%% Configuração do PIA %%%%%%%%%%%%%%%%%%%%%%%%

nat = fuzzyconfig(nvar, nse, rb);

%%%%%%%%%%%%%%%%%%%% Cálculo da Saída %%%%%%%%%%%%%%%%%%%%%%%%%%

saida = lim_out( ...
    fuzzyout(input, nvar, nse, param_in, defe, ...
    nss, param_out, defs, rb, nat), ...
    pia.Outputs(1).Range);

end