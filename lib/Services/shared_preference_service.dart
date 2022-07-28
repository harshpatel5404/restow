import 'package:shared_preferences/shared_preferences.dart';

 

Future setlogin(bool login) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('Islogin', login);
}

Future<bool?> getlogin() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('Islogin');
}

Future<bool> removelogin() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.remove('Islogin');
}

//token
Future<void> setToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('Token', token);
  // print("add mobile to local");
}

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs.getString("Token"));
  return prefs.getString("Token");
}

Future<void> removeToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('Token');
}

//userid

Future setuserid(String userid) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('userid', userid);
}

Future<String?> getuserid() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('userid');
}

Future removeuserid() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('userid');
}

Future<void> setUserinfo({name, email, phone}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', name ?? "");
  await prefs.setString('email', email ?? "");
  await prefs.setString('phone', phone ?? "");
}