function [ requestVwdSession ] = requestVwdSession( session )
%% requestVwdSession
options = weboptions(...
     'HeaderFields',{'Origin' 'https://trader.degiro.nl'},...
     'RequestMethod','POST','ArrayFormat','json');
options.MediaType = 'application/json';
data = struct(...
    'referrer','https://trader.degiro.nl');

URL = ['https://degiro.quotecast.vwdservices.com/CORS/',...
    'request_session?version=1.0.20170315&userToken=',int2str(session.userToken)];

requestVwdSession = webwrite(char(URL), data, options);

end

