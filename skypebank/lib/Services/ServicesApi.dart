import 'RequestApi.dart';

class ServicesApi {
   static final ServicesApi _instance = ServicesApi._internal();

  factory ServicesApi() => _instance;

  ServicesApi._internal();

   late RequestApi bankApi;

  void appConfig() {
    bankApi = RequestApi("https://ebank.skyebanksl.net:8600/accounts/");
  }

   @override
   Future<String> existingUser(Map map) {
     return bankApi.postAsync("OpenAccount",body: map);
   }
}