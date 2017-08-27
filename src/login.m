function [session] = login(session)

%% Login to DeGiro
[username,password] = GetAuthentication('default');

global BASE_TRADER_URL;
options = weboptions('Username',username,'Password',password,...
     'HeaderFields',{'Content-Type' 'application/json'},...
     'RequestMethod','POST','ArrayFormat','json');
options.MediaType = 'application/json';
data = struct(...
    'username',username,...
    'password',password,...
    'isRedirectToMobile', false,...
    'loginButtonUniversal', '',...
    'queryParams', struct('reason', 'session_expired'));

URL = matlab.net.URI(BASE_TRADER_URL);
URL.Path = '/login/secure/login';

response = webwrite(char(URL), data, options);
session.id = response.sessionId;

end

