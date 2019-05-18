import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:nedbuddy3/util/functions.dart';

class DataAPI {
  static const URL =
      'https://api.nedbank.co.za/apimarket/sandbox/nboauth/oauth20/token';
  static const Map<String, String> headers = {
    'Content-type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
  };
  static http.Client client = http.Client();
  static Dio dio = new Dio();
  static const Map parms = {
    "client_id": "bb0e5e40-3160-45ef-9219-c406ef0b4f61",
    "client_secret": "I3bO7aM4sY1vF1tR4jV5yY0iC7dA4bV6hS6eV2bD2dH4dS7tV2",
    "grant_type": "client_credentials	",
    "scope": "tpp_client_credential"
  };
  static const clientId = 'bb0e5e40-3160-45ef-9219-c406ef0b4f61';
  static const clientSecret =
      'I3bO7aM4sY1vF1tR4jV5yY0iC7dA4bV6hS6eV2bD2dH4dS7tV2';
  static const grantType = 'client_credentials';
  static const scope = 'tpp_client_credential';
  static ContentType contentType =
      new ContentType("application", "x-www-form-urlencoded", charset: "utf-8");

  static Future authenticate() {}

  static Future nedbankAuth() async {
    var results = await _sendRequest(parms, URL);
    print(results);
  }

  static Future<Map> _sendRequest(Map bag, String url) async {
    print(
        '\n\n🔵 🔵 🔵 🔵 🔵 🔵 🌼 🌼 🌼   DataAPI._sendRequest; sending:  \n🔵 🔵 🔵 🔵 🔵 🔵 🌼 🌼 🌼 '
        '${json.encode(bag)} \n🔵 🔵 🔵 🔵 🔵 🔵 $url');
    try {
      var body =
          'grant_type=$grantType&client_id=$clientId&client_secret=$clientSecret&scope=$scope';
      var mResponse = await client.post(url, headers: headers, body: parms);
//      var mResponse = await dio.post(url,
//          data: body, options: Options(method: 'POST', headers: headers));

//      response.
//      HttpClientRequest mRequest = await httpClient.postUrl(Uri.parse(url));
//      mRequest.headers.contentType = contentType;
//      mRequest.write(body);
//      HttpClientResponse mResponse = await mRequest.close();
      print(
          '\n\n🔵 🔵 DataAPI._sendRequest  ☘☘☘ response status code:  ${mResponse.statusCode} ☘☘☘');
      print(mResponse.body);
      if (mResponse.statusCode == 200) {
        Map map = json.decode(mResponse.body);
        prettyPrint(map,
            '🌷 🌷 🌷 RESPONSE from Network Call - 🌷 🌷 🌷 REPLY MAP  🌷 🌷 🌷');
        // transforms and prints the response
//        var reply = await mResponse.data;
//        print(
//            '🔵 🔵 🔵 🌼  🔵 🔵 🔵 🌼  🔵 🔵 🔵 🌼  🔵 🔵 🔵 🌼  reply  ..............\n $reply');
//        Map map = JsonDecoder().convert(reply);
//        prettyPrint(map, ' 🌷 🌷 🌷 REPLY MAP  🌷 🌷 🌷');
//        print(
//            '\n🔵 🔵 🔵  🔵 🔵 🔵  end of result object, is a Map? : ${map['result'] is Map}  🔵 🔵 🔵  🔵 🔵 🔵 \n');
//        if (map['statusCode'] == 200) {
//          return map;
//        } else {
//          throw Exception(map['message']);
//        }
      } else {
        print('\n\n😡 😡 😡 😡  DataAPI._sendRequest ERROR  ${mResponse}');
        throw Exception(mResponse);
      }
    } catch (e) {
      print(
          '\n\n👿 👿 👿  👿 👿 👿 DataAPI._sendRequest ERROR : \n$e \n👿 👿 👿 👿 👿 👿 ');
      throw e;
    }
  }
}
