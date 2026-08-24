classdef PIAMembershipFunction
    % PIAMembershipFunction represents a membership function
    
    properties
        Name string
        Type string
        Parameters double
    end
    
    methods
        function obj = PIAMembershipFunction(name, type, parameters)
            obj.Name = name;
            obj.Type = type;
            obj.Parameters = parameters;
        end
    end
end

