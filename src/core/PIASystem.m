classdef PIASystem
    % PIASystem represents a PIA fuzzy system
    
    properties
        Name
        Inputs PIAInput = PIAInput.empty
        Outputs PIAOutput = PIAOutput.empty
        Rules PIARule = PIARule.empty
    end

    % Contadores internos para gerar IDs
    properties (Access = private)
        InputCounter = 0
        OutputCounter = 0
        RuleCounter = 0
    end

    methods
        % Construtor
        function obj = PIASystem(name)
            obj.Name = name;
        end

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % INPUTS
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        % Adiciona um Input
        function obj = addInput(obj, name, range)
            obj.InputCounter = obj.InputCounter + 1;
            id = "input_" + string(obj.InputCounter);
            input = PIAInput(id, name, range);
            obj.Inputs(end + 1) = input;
        end

        % Atualiza um Input
        function obj = updateInput(obj, index, name, range)
            obj.Inputs(index).Name = name;
            obj.Inputs(index).Range = range;
        end

        % Remove um Input
        function obj = deleteInput(obj, index)
            obj.Inputs(index) = [];
            obj = obj.updateInputIDs();
        end


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % OUTPUTS
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        % Adiciona um Output
        function obj = addOutput(obj, name, range)
            obj.OutputCounter = obj.OutputCounter + 1;
            id = "output_" + string(obj.OutputCounter);
            output = PIAOutput(id, name, range);
            obj.Outputs(end + 1) = output;
        end

        % Atualiza um Output
        function obj = updateOutput(obj, index, name, range)
            obj.Outputs(index).Name = name;
            obj.Outputs(index).Range = range;
        end

        % Remove um Output
        function obj = deleteOutput(obj, index)
            obj.Outputs(index) = [];
            obj = obj.updateOutputIDs();
        end


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % MEMBERSHIP FUNCTIONS
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        % Adiciona uma Membership Function
        function obj = addMF(obj, variableType, variableIndex, type, parameters, name)
            if variableType == "input"
                obj.Inputs(variableIndex) = ...
                    obj.Inputs(variableIndex).addMF( ...
                    name, type, parameters);

            elseif variableType == "output"
                obj.Outputs(variableIndex) = ...
                    obj.Outputs(variableIndex).addMF( ...
                    name, type, parameters);
            end
        end

        % Atualiza uma Membership Function
        function obj = updateMF(obj, variableType, variableIndex, mfIndex, name, type, parameters)
            if variableType == "input"
                obj.Inputs(variableIndex) = ...
                    obj.Inputs(variableIndex).updateMF( ...
                    mfIndex, name, type, parameters);

            elseif variableType == "output"
                obj.Outputs(variableIndex) = ...
                    obj.Outputs(variableIndex).updateMF( ...
                    mfIndex, name, type, parameters);
            end
        end

        % Remove uma Membership Function
        function obj = deleteMF(obj, variableType, variableIndex, mfIndex)
            if variableType == "input"
                obj.Inputs(variableIndex) = ...
                    obj.Inputs(variableIndex).deleteMF(mfIndex);

            elseif variableType == "output"
                obj.Outputs(variableIndex) = ...
                    obj.Outputs(variableIndex).deleteMF(mfIndex);
            end
        end


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % RULES
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        % Adiciona uma regra
        function obj = addRule(obj, antecedent, consequent)
            obj.RuleCounter = obj.RuleCounter + 1;
            id = "rule_" + string(obj.RuleCounter);
            rule = PIARule(id, antecedent, consequent);
            obj.Rules(end + 1) = rule;
        end

        % Atualiza uma regra
        function obj = updateRule(obj, index, antecedent, consequent)
            obj.Rules(index).Antecedent = antecedent;
            obj.Rules(index).Consequent = consequent;
        end

        % Remove uma regra
        function obj = deleteRule(obj, index)
            obj.Rules(index) = [];
            obj = obj.updateRuleIDs();
        end
    end

    methods (Access = private)
        % Atualiza os IDs dos Inputs
        function obj = updateInputIDs(obj)
            for i = 1:length(obj.Inputs)
                obj.Inputs(i) = ...
                    obj.Inputs(i).updateID( ...
                    "input_" + string(i));
            end

            obj.InputCounter = length(obj.Inputs);
        end

        % Atualiza os IDs dos Outputs
        function obj = updateOutputIDs(obj)
            for i = 1:length(obj.Outputs)
                obj.Outputs(i) = ...
                    obj.Outputs(i).updateID( ...
                    "output_" + string(i));
            end

            obj.OutputCounter = length(obj.Outputs);
        end

        % Atualiza os IDs das Rules
        function obj = updateRuleIDs(obj)
            for i = 1:length(obj.Rules)
                obj.Rules(i) = ...
                    obj.Rules(i).updateID( ...
                    "rule_" + string(i));
            end

            obj.RuleCounter = length(obj.Rules);
        end
    end
end