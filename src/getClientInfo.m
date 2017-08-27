function [ session ] = getClientInfo( session )
%% Get Client Info
global BASE_TRADER_URL;

clientInfo = webread([BASE_TRADER_URL,'/pa/secure/client?sessionId=',session.id]);
session.account = clientInfo.intAccount;
session.userToken = clientInfo.id;
session.clientInfo = clientInfo;

end

