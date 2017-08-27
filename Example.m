%% DEGIRO Matlab (unnoficial) API example

%% Init values and login
clear
load globalConstants
load constants

% A window asks username and password
session = login(session);
session = getClientInfo(session);

%% How to search a product

productSearchResult = searchProduct( session, 'bankia' );

%% How to buy a product

newOrder = [];
newOrder.buysell = Actions.buy;
newOrder.orderType = OrderTypes.limited;
newOrder.productId = productSearchResult.products{1, 1}.id;%'13585545'Bankia id
newOrder.timeType = TimeTypes.permanent;
newOrder.size = 100;
newOrder.price = 3.5;

output = checkOrder( session, newOrder );
output = confirmOrder( session, newOrder, output.confirmationId );
