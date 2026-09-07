classdef PIASystem
    % PIASystem represents a PIA fuzzy system
    
    % As 'properties' da classe representam seus atributos
    properties
        Name
        Inputs PIAInput = PIAInput.empty
        Outputs PIAOutput = PIAOutput.empty
        Rules
        Parameters
    end

    % Contador interno para gerar IDs dos inputs
    properties (Access = private)
        InputCounter = 0
        OutputCounter = 0
    end

    methods
        % O construtor
        function obj = PIASystem(name)
            obj.Name = name;
        end

        % Método responsável por criar e adicionar um Input ao sistema
        function obj = addInput(obj, name, range)
            obj.InputCounter = obj.InputCounter + 1;
            id = "input_" + string(obj.InputCounter);
            input = PIAInput(id, name, range);
            obj.Inputs(end + 1) = input;
        end

        % Método responsável por criar e adicionar um Output ao sistema
        function obj = addOutput(obj, name, range)
            obj.OutputCounter = obj.OutputCounter + 1;
            id = "output_" + string(obj.OutputCounter);
            output = PIAOutput(id, name, range);
            obj.Outputs(end + 1) = output;
        end

        % Adiciona uma Membership Function a um Input/Output existente
        function obj = addMF(obj, variableType, variableIndex, type, parameters, name)
            if variableType == "input"
                obj.Inputs(variableIndex) = ...
                    obj.Inputs(variableIndex).addMF(name, type, parameters);
            elseif variableType == "output"
                obj.Outputs(variableIndex) = ...
                    obj.Outputs(variableIndex).addMF(name, type, parameters);
            end
        end
    end
end

