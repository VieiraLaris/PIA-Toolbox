classdef PIAMembershipFunction
    % PIAMembershipFunction represents a membership function

    properties (SetAccess = private)
        ID string
    end
    
    properties
        Name string
        Type string
        Parameters double
    end
    
    methods
        function obj = PIAMembershipFunction(id, name, type, parameters)
            obj.ID = id;
            obj.Name = name;
            obj.Type = type;
            obj.Parameters = parameters;
        end
    end
end

