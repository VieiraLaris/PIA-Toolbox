classdef PIAInput
    % PIAInput represents an input variable of a PIA fuzzy system
    
    properties
        Name string
        Range (1,2) double
        MembershipFunctions PIAMembershipFunction = PIAMembershipFunction.empty
    end
    
    methods
        function obj = PIAInput(name, range)
            obj.Name = name;
            obj.Range = range;
        end
        
        % Função para adicionar uma MF ao input
        function obj = addMF(obj, name, type, parameters)
            mf = PIAMembershipFunction(name, type, parameters);
            obj.MembershipFunctions(end + 1) = mf; % Adiciona uma nova mf na posição seguinte
        end
    end
end

