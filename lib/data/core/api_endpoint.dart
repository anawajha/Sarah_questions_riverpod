library api_endpoint;

import '../../app/config/app_config.dart';


String baseUrlEndpoint = AppConfig().getApiBaseUrl();

String loginEndpoint = 'auth/login';
String registerEndpoint = 'auth/register';
String logoutEndpoint = 'auth/logout';
String getColorsEndpoint = 'auth/get-car-colors';
String getModelsEndpoint = 'auth/get-car-models';
String getTypesEndpoint = 'auth/get-car-types';

String getOrdersEndpoint = 'order/get-orders-available';
String acceptOrderEndPoint = 'order/accepted-order';
String getCurrentOrderEndPoint = 'order/get-order-now';

String updateTripStatusEndPoint = 'trip/update-status-trip';
String updateProfileEndPoint = 'profile/update';

