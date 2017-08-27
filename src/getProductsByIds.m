function [ ProductsByIds ] = getProductsByIds( session, ids )
%% Product by id
%ids = ["13519974", "13585545"];
load globalConstants;

URL = matlab.net.URI(BASE_TRADER_URL);
URL.Path = '/product_search/secure/v5/products/info'; 
URL.Query = struct(...
    'intAccount',int2str(session.account),...
    'sessionId',session.id);

options = weboptions(...
     'HeaderFields',{
     'Connection' 'keep-alive';
     'Origin' 'https://trader.degiro.nl';
     'Content-Type' 'application/json;charset=UTF-8';
     'referrer' 'https://trader.degiro.nl/trader';
     'Cookie' strcat('JSESSIONID=',session.id)},...
     'RequestMethod','POST','ArrayFormat','csv');

options.MediaType = 'application/json';

ProductsByIds = webwrite(char(URL), ids, options);

end