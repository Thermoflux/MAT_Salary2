classdef Compensation
    %Compensation Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Date            % Class -> Datatime
        afterTax        % Double
        beforeTax       % Double
        TaxVal          % Total Tax 
        TaxPct          % Tax %
        actPayrate      % [BeforeTaxPerHr, AfterTaxPerHr] both assuming 160 hr/ month
        
    end
    
    methods
        
        function obj = Compensation(varargin)
            %Compensation Makes a obj of class Compensation
            obj.Date      = varargin{1};
            obj.beforeTax = varargin{2};
            obj.afterTax  = varargin{3};
            obj.TaxVal    = obj.beforeTax - obj.afterTax;
            obj.TaxPct    = (obj.beforeTax - obj.afterTax)/obj.beforeTax *100 ;
            obj.actPayrate   = [obj.beforeTax/160.0, obj.afterTax/160.0];
        end
        
        function Tax = getTax(objin)
            %getTax Gets the Tax for given payments
            Tax = [0,0];
            tempTotal = 0;
            
            tempTotal = sum([objin.beforeTax]);
            Tax(1)    = sum([objin.TaxVal]);
            Tax(2)    = Tax(1)/tempTotal;
%             
%             for i = 1:numel(objin)
%                 Tax(1) = objin(i).Tax(1) + Tax(1);
%                 tempTotal = tempTotal + objin(i).beforeTax;
%                 Tax(2) = Tax(1)/tempTotal;
%             end
        end
        
        
        function Total = getSummary(objin)
            %getSummary Get Total earnings in the given range
            Total = [0,0];
            
           Total = [sum([objin.beforeTax]) ,...
                        sum([objin.afterTax])];
        end
               
         
        
    end
    
end

