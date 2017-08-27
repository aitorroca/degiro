function [ orders ] = getOrders( session )
%% Get orders info

orders = getData(struct('orders', '0', 'historicalOrders', '0', 'transactions', '0'), session);

end

