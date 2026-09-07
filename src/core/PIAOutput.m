classdef PIAOutput
    % PIAOutput represents an output variable
    properties (SetAccess = private)
        ID string
        MFCounter = 0
    end

    properties
        Name string
        Range (1,2) double
        MembershipFunctions PIAMembershipFunction = PIAMembershipFunction.empty
    end
    
    methods
        function obj = PIAOutput(id, name, range)
            obj.ID = id;
            obj.Name = name;
            obj.Range = range;
        end
        
        % Função para adicionar uma MF ao output
        function obj = addMF(obj, name, type, parameters)
            obj.MFCounter = obj.MFCounter + 1;
            id = "mf_" + string(obj.MFCounter);
            mf = PIAMembershipFunction(id, name, type, parameters);
            obj.MembershipFunctions(end + 1) = mf; % Adiciona uma nova mf na próxima posição disponível
        end
    end
end

