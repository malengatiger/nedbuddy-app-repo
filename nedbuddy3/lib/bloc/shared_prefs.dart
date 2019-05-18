import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
//  static Future saveAccount(Account account) async {
//    print('SharedPrefs.saveAccount  saving data ........');
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//
//    Map jsonx = account.toJson();
//    var jx = json.encode(jsonx);
//    print(jx);
//    prefs.setString('account', jx);
//    //prefs.commit();
//    print("SharedPrefs.saveAccount =========  data SAVED.........");
//  }
//
//  static Future<Account> getAccount() async {
//    print("SharedPrefs.getAccount =========  getting cached data.........");
//    var prefs = await SharedPreferences.getInstance();
//    var string = prefs.getString('account');
//    if (string == null) {
//      return null;
//    }
//    var jx = json.decode(string);
//    prettyPrint(jx, 'Account from cache: ');
//    var account = new Account.fromJson(jx);
//    return account;
//  }

  static Future saveFCMToken(String token) async {
    print("SharedPrefs saving token ..........");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fcm", token);
    //prefs.commit();

    print("FCM token saved in cache prefs: $token");
  }

  static Future<String> getFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("fcm");
    print("SharedPrefs - FCM token from prefs: $token");
    return token;
  }

  static Future saveMinutes(int minutes) async {
    print("SharedPrefs saving minutes ..........");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("minutes", minutes);

    print("FCM minutes saved in cache prefs: $minutes");
  }

  static Future<int> getMinutes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var minutes = prefs.getInt("minutes");
    print("SharedPrefs - FCM minutes from prefs: $minutes");
    return minutes;
  }

  static void saveThemeIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("themeIndex", index);
    print("🚹 🚹 🚹 === SharedPrefs theme index; SAVED: 🔆 $index");
  }

  static Future<int> getThemeIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt("themeIndex");
    print("💊 💊 💊 === SharedPrefs theme index retrieved: 🔆 $index");
    return index;
  }
}
