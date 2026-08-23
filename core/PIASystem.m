classdef PIASystem
    % PIASystem represents a PIA fuzzy system
    
    % As 'properties' da classe representam seus atributos
    properties
        Name
        Inputs
        Outputs
        Rules
        Parameters
    end

    methods
        % O construtor
        function obj = PIASystem(name)
            obj.Name = name;
            obj.Inputs = struct([]); % struct([]) -> seria uma lista de structs (no caso uma lista de structs do tipo Input)
            obj.Outputs = struct([]);
            obj.Rules = struct([]);
            obj.Parameters = struct(); % struct() -> apenas uma struct do tipo Parameters
        end
    end
end

