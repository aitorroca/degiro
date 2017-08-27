function [ ProductsByIds ] = getProductsByIds( session, ids )
%% Product by id
%ids = ["13519974", "13585545"];
load globalConstants;

options = weboptions(...
     'HeaderFields',{'Content-Type' 'application/json'},...
     'RequestMethod','POST','ArrayFormat','json');
options.MediaType = 'application/json';
data = struct(...
    'ids', ids);

URL = matlab.net.URI(BASE_TRADER_URL);
URL.Path = '/product_search/secure/v5/products/info'; 
URL.Query = struct(...
    'intAccount',int2str(session.account),...
    'sessionId',session.id);
%jsonencode(data)
ProductsByIds = webwrite(char(URL), data, options);

end

