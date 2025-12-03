import 'package:apple/pages/home.dart';
import 'package:apple/services/prefservice.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _gmailController = TextEditingController();
  final _passController = TextEditingController();

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/apple3.jpg",
              fit: BoxFit.cover,
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.zero,
                  bottomLeft: Radius.zero
                ),
              ),
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Ro'yhatdan o'tish",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_2_outlined),
                            hintText: "Ismingizni kiriting",
                            labelText: "Ism",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                            )
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_android_outlined),
                            hintText: "Telefon raqamingizni kiriting",
                            labelText: "Telefon",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: _gmailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: "Gmail manzilingizni kiriting",
                            labelText: "Gmail",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          obscureText: isObscure,
                          controller: _passController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            suffix: IconButton(
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.all(0)
                              ),
                              padding: EdgeInsets.all(0),
                                onPressed: (){
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
                            ),
                            hintText: "Parol yarating",
                            labelText: "Parol",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                          ),
                        ),
                        SizedBox(height: 17,),
                        ElevatedButton.icon(
                          onPressed: (){
                            if(_nameController.text.isEmpty || _phoneController.text.isEmpty || _gmailController.text.isEmpty || _passController.text.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("               Siz ma'lumotlarni to'liq kiritmadingiz"),
                                  duration: Duration(seconds: 5),
                                ),
                              );
                            } else{
                              PrefService service = PrefService();
                              service.saveData(_nameController.text, _phoneController.text, _passController.text, _gmailController.text);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home()
                                )
                              );
                            }
                          },
                          icon: Icon(Icons.ads_click, size: 22,),
                          label: Text(
                            "Jo'natish",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
