import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestApi {
  String url;

  RequestApi(this.url);

  _getOAuthURL(String requestMethod, String endpoint) {
    return url  + endpoint;
  }



  Future<String> postAsync(String endPoint, {Map? body}) async {
    var fullUrl =  _getOAuthURL("Post",endPoint);

    print("Post: $fullUrl");

    try{

      String username = 'sample';
      String password = '90b01884-04e4-4654-950a-aabedf51bcc2';
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      print(basicAuth);
      var headers = {
        'Content-Type': 'application/json',
        'authorization': basicAuth
      };


      var request = http.Request('POST', Uri.parse(fullUrl));
      request.body = json.encode(body);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return await response.stream.bytesToString();
      }
      else {
        return response.stream.bytesToString();
      }

    } catch(_) {
      print(_);
      return "";
    }


  }

  Future<String> postDynamicAsync(String endPoint, {dynamic body}) async {
    var fullUrl =  _getOAuthURL("Post",endPoint);


    print("Post: $fullUrl");

    var headers = Map<String,String>();

    var request = http.Request('POST', Uri.parse(fullUrl));
    request.body = body;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    }
    else {
      return "";
    }

  }


  Future<String> get(String endPoint) async {

    var fullUrl =  _getOAuthURL("GET",endPoint);
    print("GET: $fullUrl");
    var headerMap = Map<String,String>();
    headerMap['accept']='text/plain';
    print(headerMap);
    try{
      return http.get(Uri.parse(fullUrl),headers: headerMap).then((http.Response response) {
        print(response.statusCode);
        if(response.statusCode==401){
          return 'logout';
        }
        return response.body;
      });
    } catch(_) {
      print(_);
      return "";
    }
  }




}