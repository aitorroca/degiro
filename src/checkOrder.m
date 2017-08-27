function [ output ] = checkOrder( session, newOrder )
%% checkOrder

load globalConstants;

options = weboptions(...
     'HeaderFields',{'Content-Type' 'application/json;charset=UTF-8'},...
     'RequestMethod','POST', 'ArrayFormat','json');
options.MediaType = 'application/json';

URL = matlab.net.URI(BASE_TRADER_URL);
URL.Path = ['/trading/secure/v5/checkOrder;jsessionid=',session.id]; 
URL.Query = struct(...
    'intAccount',int2str(session.account),...
    'sessionId',session.id);
output = webwrite(char(URL), newOrder, options);


%f = fieldnames(newOrder);
%newOrder = rmfield(newOrder,f(structfun(@isempty, newOrder)));

% r = matlab.net.http.RequestMessage;
% r.Method = 'POST';
% r.Header = matlab.net.http.HeaderField('Content-Type','application/json;charset=UTF-8');% 'application/json;charset=UTF-8'};
% r.Body = jsonencode(newOrder);
% setCookieFields = struct('Name','JSESSIONID','Value',session.id);
% %cookieInfos = setCookieFields.convert;
% r = r.addFields(matlab.net.http.field.CookieField([setCookieFields]));
% resp = send(r,char(URL));

end

