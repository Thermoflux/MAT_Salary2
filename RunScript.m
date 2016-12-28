% RunScript


%% Get data
run('getSalData.m');

%% Make class objects

for i = 1: numel(AfterTax)
    
    SalRec(i) = Compensation(PayDate(i),BeforeTax(i),AfterTax(i));
end



%% Stats

TotalTax = getTax(SalRec);
