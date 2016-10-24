classdef Compensation
    %Compensation Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Date
        afterTax
        beforeTax
        Tax
        actPayrate
        
    end
    
    methods
        
        function obj = Compensation(varargin)
            obj.Date      = varargin{1};
            obj.beforeTax = varargin{2};
            obj.afterTax  = varargin{3};
            obj.Tax       = [obj.beforeTax - obj.afterTax, ...
                       (obj.beforeTax - obj.afterTax)/obj.beforeTax *100] ;
            obj.actPayrate   = [obj.beforeTax/160.0, obj.afterTax/160.0];
        end
        
        function Tax = getTax(objin)
            Tax = [0,0];
            tempTotal = 0;
            for i = 1:numel(objin)
                Tax(1) = objin(i).Tax(1) + Tax(1);
                tempTotal = tempTotal + objin(i).beforeTax;
                Tax(2) = Tax(1)/tempTotal;
            end
        end
        
        
        function Total = getSummary(objin)
            Total = [0,0];
            
           Total = [sum([objin.beforeTax]) ,...
                        sum([objin.afterTax])];
        end
               
         
        
    end
    
end

