function [ output ] = deleteOrder( session, orderId)
%% Delete existing order
load globalConstants;

URL = matlab.net.URI(BASE_TRADER_URL);
URL.Path = ['/trading/secure/v5/order/',orderId,';jsessionid=',session.id]; 
URL.Query = struct(...
    'intAccount',int2str(session.account),...
    'sessionId',session.id);

options = weboptions(...
     'HeaderFields',{
     'Connection' 'keep-alive';
     'Origin' 'https://trader.degiro.nl';
     'Content-Type' 'application/json;charset=UTF-8';
     'referrer' 'https://trader.degiro.nl';
     'Cookie' strcat('JSESSIONID=',session.id)},...
     'RequestMethod','DELETE','ArrayFormat','json');

output = webwrite(char(URL), options);

end

