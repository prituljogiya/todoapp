// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';
// const String id = "id";
// const String name = "name";
// const String email = "email";
// const String userTokenPref = "userToken";
// const String isLoggedInPref = "isLoggedIn";
// class UserPreferences {
//   static Future<String> getUserToken() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(userTokenPref) ?? "";
//   }
//   static Future<String> getUserId() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(id) ?? "";
//   }
//   static Future<String> getUserEmail() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(email) ?? "";
//   }
//   static Future<bool> isUserLoggedIn() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(isLoggedInPref) ?? false;
//   }
//   static Future<void> setUserLoggedIn({required bool hasLoggedIn}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool(isLoggedInPref, hasLoggedIn);
//   }
//   static Future<void> setUserToken({required String userToken}) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(userTokenPref, userToken);
//   }
//   static Future<void> setUserId({required String userId}) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(id, userId);
//   }
//   static Future<void> saveLoginUserInfo(ModelCustomer customer) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(id, customer.id!);
//     await prefs.setString(name, customer.name!);
//     await prefs.setString(email, customer.email!);
//   }
//   static Future<ModelCustomer> getLoginUserInfo(ModelCustomer customer) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? uId = await prefs.getString(id);
//     String? uName = await prefs.getString(name);
//     String? uEmail = await prefs.getString(email);
//     ModelCustomer customer = ModelCustomer();
//     customer.id = uId;
//     customer.name = uName;
//     customer.email = uEmail;
//     return customer;
//   }
//   static Future<void> clearDetailsOnSignOut() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(userTokenPref, "");
//     await prefs.setString(id, "");
//     await prefs.setString(name, "");
//     await prefs.setString(email, "");
//     await prefs.setString(userTokenPref, "");
//   }
// }
