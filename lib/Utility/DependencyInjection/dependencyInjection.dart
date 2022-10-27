import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../Data/data_firebase_authentication_service.dart';

GetIt locator = GetIt.instance;
void setupLocator() async 
{
  locator.registerSingleton(FirebaseAuth.instance);
  locator.registerFactory<FireBaseAuthentication>(
     () =>FireBaseAuthentication());
}