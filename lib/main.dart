import 'package:apple/pages/home.dart';
import 'package:apple/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    )
  );
}


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  Future<void> check() async {
    final miya = await SharedPreferences.getInstance();
    bool already_registered = await miya.getBool('isRegistered') ?? false;

    // ro'yhatdan o'tmagan bo'lsa
    if(already_registered == false){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Register()
        ),
      );
    }
    // ro'yhatdan o'tgan bo'lsa
    else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Home()
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}
