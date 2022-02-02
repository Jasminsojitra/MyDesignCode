

import 'ServicesApi.dart';

abstract class BaseServices {
  Future<String> addExistingUser(Map map);
}


class Services implements BaseServices {

 late ServicesApi serviceApi;

  void setAppConfig() {
    ServicesApi().appConfig();
    serviceApi = ServicesApi();
  }

  @override
  Future<String> addExistingUser(Map map) {
    return serviceApi.existingUser(map);
  }

}