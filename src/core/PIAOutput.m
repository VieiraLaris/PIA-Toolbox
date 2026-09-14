classdef PIAOutput
    % PIAOutput represents an output variable

    properties (SetAccess = private)
        ID string
        MFCounter = 0
    end

    properties
        Name string
        Range double
        MembershipFunctions PIAMembershipFunction = PIAMembershipFunction.empty
    end
    
    methods
        % Construtor
        function obj = PIAOutput(id, name, range)
            obj.ID = id;
            obj.Name = name;
            obj.Range = range;
        end
        
        % Adiciona uma Membership Function ao output
        function obj = addMF(obj, name, type, parameters)
            obj.MFCounter = obj.MFCounter + 1;
            id = "mf_" + string(obj.MFCounter);
            mf = PIAMembershipFunction( ...
                id, name, type, parameters);
            obj.MembershipFunctions(end + 1) = mf;
        end

        % Atualiza uma Membership Function existente
        function obj = updateMF(obj, index, name, type, parameters)
            obj.MembershipFunctions(index).Name = name;
            obj.MembershipFunctions(index).Type = type;
            obj.MembershipFunctions(index).Parameters = parameters;
        end

        % Remove uma Membership Function
        function obj = deleteMF(obj, index)
            obj.MembershipFunctions(index) = [];
            obj = obj.updateMFIDs();
        end

        % Atualiza o ID do Output
        function obj = updateID(obj, id)
            obj.ID = id;
        end
    end

    methods (Access = private)
        % Atualiza os IDs das Membership Functions
        function obj = updateMFIDs(obj)
            for i = 1:length(obj.MembershipFunctions)
                obj.MembershipFunctions(i) = ...
                    obj.MembershipFunctions(i).updateID( ...
                    "mf_" + string(i));
            end

            obj.MFCounter = length(obj.MembershipFunctions);
        end
    end
end