function [ data ] = getData( params, session )
%% Get Data
global BASE_TRADER_URL;

%params = struct('portfolio', 0);
%params = struct('cashFunds', 0);

URL = matlab.net.URI(BASE_TRADER_URL);
URL.Path = ['/trading/secure/v5/update/',int2str(session.account),';jsessionid=',session.id];
URL.Query = params;
data = webread(char(URL));

end

