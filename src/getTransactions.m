function [ output ] = getTransactions( session, Date1, Date2 )
%% Get transactions
% Example:
% output = getTransactions(session, '27/07/2017', '27/08/2017');
%
load globalConstants;

URL = matlab.net.URI(BASE_TRADER_URL);
URL.Path = '/reporting/secure/v4/transactions'; 
URL.Query = struct(...
    'orderId','',...
    'product','',...
    'fromDate',Date1,...
    'toDate',Date2,...
    'groupTransactionsByOrder',false,...
    'intAccount',int2str(session.account),...
    'sessionId',session.id);

options = weboptions(...
     'HeaderFields',{
     'Connection' 'keep-alive';
     'Origin' 'https://trader.degiro.nl';
     'Content-Type' 'application/json;charset=UTF-8';
     'referrer' 'https://trader.degiro.nl/trader';
     'Cookie' strcat('JSESSIONID=',session.id)},...
     'RequestMethod','GET','ArrayFormat','json');

output = webread(char(URL), options);
output = output.data;
end