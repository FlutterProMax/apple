import 'package:shared_preferences/shared_preferences.dart';

class PrefService{

  Future<void> saveImage(String address) async {
    final miya = await SharedPreferences.getInstance();
    await miya.setString('profilePhoto', address);
  }

  Future<String> getImage() async {
    final miya = await SharedPreferences.getInstance();
    return miya.getString('profilePhoto') ?? 'assets/logo.png' ;
  }

  Future<void> saveData(String name, String phone, String pass, String gmail) async {
    final miya = await SharedPreferences.getInstance();

    await miya.setString('name', name);
    await miya.setString('phone', phone);
    await miya.setString('pass', pass);
    await miya.setString('gmail', gmail);
    await miya.setBool('isRegistered', true);


  }

  Future<List<String>> getData() async {
    final miya = await SharedPreferences.getInstance();
    String name = await miya.getString('name') ?? 'John';
    String phone = await miya.getString('phone') ?? '+998';
    String gmail = await miya.getString('gmail') ?? 'example@gmail.com';
    String pass = await miya.getString('pass') ?? '1111';

    List<String> data = [name, phone, gmail];
    return data;
  }

  Future<String> getPass() async {
    final miya = await SharedPreferences.getInstance();

    String pass = await miya.getString('pass') ?? '1111';

    return pass;
  }

  Future<bool> checkRegistration() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isRegistered') ?? false;
  }

}