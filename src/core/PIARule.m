classdef PIARule
    %PIARule represents a fuzzy rule

    properties (SetAccess = private)
        ID string
    end
    
    properties
        Antecedent double
        Consequent double
        Weight double = 1
        Operator double = 1
        Relationships
        InputWeights double
    end
    
    methods
        function obj = PIARule(id, antecedent, consequent)
            obj.ID = id;
            obj.Antecedent = antecedent;
            obj.Consequent = consequent;
        end
    end
end

