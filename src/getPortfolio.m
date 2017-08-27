function [ portfolio ] = getPortfolio( session )
%% Get portfolio info in table format
params = struct('portfolio', 0);

data = getData( params, session );

portfolio = cell(length(data.portfolio.value),3);

for indice = 1 : (length(data.portfolio.value))

    portfolio{indice,1} = data.portfolio.value(indice).value{2, 1}.value;
    portfolio{indice,2} = data.portfolio.value(indice).value{3, 1}.value;
    portfolio{indice,3} = data.portfolio.value(indice).value{4, 1}.value;
    portfolio{indice,4} = portfolio{indice,2}*portfolio{indice,3};
    
end

portfolio = cell2table(portfolio,'VariableNames',{'Product' 'Size' 'Price' 'Value'});
portfolio.Properties.VariableUnits =  {''  'Shares' '€'  '€'};
portfolio = portfolio(portfolio.Size>0,:);

end

