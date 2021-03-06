function [ output ] = checkOrder( session, newOrder )
%% checkOrder
load globalConstants;

URL = matlab.net.URI(BASE_TRADER_URL);
URL.Path = ['/trading/secure/v5/checkOrder;jsessionid=',session.id]; 
URL.Query = struct(...
    'intAccount',int2str(session.account),...
    'sessionId',session.id);

%newOrder = jsondecode('{"buysell":0,"orderType":0,"productId":"13585545","timeType":1,"price":3.5,"size":100}');
options = weboptions(...
     'HeaderFields',{
     'Connection' 'keep-alive';
     'Origin' 'https://trader.degiro.nl';
     'Content-Type' 'application/json;charset=UTF-8';
     'referrer' 'https://trader.degiro.nl';
     'Cookie' strcat('JSESSIONID=',session.id)},...
     'RequestMethod','POST','ArrayFormat','json');

options.MediaType = 'application/json';

output = webwrite(char(URL), newOrder, options);

end

