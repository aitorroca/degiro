function [ productSearchResult ] = searchProduct( session, searchText )
%% search Product
%searchText = 'LU1598757687';
load globalConstants;

searchProductVars = struct(...
    'intAccount',int2str(session.account),...
    'sessionId',session.id,...
    'searchText',searchText,...
    'productTypeId', ProductTypes.shares,...
    'sortColumns', '',...
    'sortTypes', '',...
    'limit', 7,...
    'offset',  0);

f = fieldnames(searchProductVars);
searchProductVars = rmfield(searchProductVars,f(structfun(@isempty, searchProductVars)));

URL = matlab.net.URI(BASE_TRADER_URL);
URL.Path = '/product_search/secure/v5/products/lookup'; 
URL.Query = searchProductVars;
productSearchResult = webread(char(URL));

end

