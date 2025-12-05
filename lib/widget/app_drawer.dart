import 'dart:io';

import 'package:apple/services/prefservice.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }


  String name = "John";
  String phone = "+998";
  String gmail = "example@gmail.com";

  String? profilePhoto;

  Future<void> get() async {
    PrefService service = PrefService();
    List data = await service.getData();
    String image = await service.getImage();

    setState(() {
      name = data[0];
      phone = data[1];
      gmail = data[2];

      profilePhoto = image;
    });
  }


  final List<Map<String, dynamic>> menues = [
    {"icon": Icons.notifications, "title": "Bildirishnomalar"},
    {"icon": Icons.question_answer_outlined, "title": "Savol-Javoblar"},
    {"icon": Icons.category_outlined, "title": "Katagoriyalar"},
    {"icon": Icons.edit, "title": "Profilni o'zgartirish"},
    {"icon": Icons.share, "title": "Ulashish"},
    {"icon": Icons.settings, "title": "Sozlamar"},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            // decoration: BoxDecoration(
            //   // rangini o'zgartirish
            //   // color: Colors.yellow
            // ),
            accountName: Text(name),
            accountEmail: Text(gmail),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent,
              backgroundImage: profilePhoto == null
                  ? AssetImage("assets/profile.jpg")
              as ImageProvider
                  : FileImage(File(profilePhoto!)),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: menues.length,
                itemBuilder: (context, index){
                final menu = menues[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: (){
                        Navigator.pop(context);
                        // davomi bor
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                              offset: Offset(0, 2)
                            ),
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          child: Row(
                            children: [
                              Icon(menu["icon"], color: Colors.deepPurple,),
                              SizedBox(width: 16,),
                              Text(
                                menu["title"],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            )
          ),

          Divider(
            thickness: 1,
            height: 1,
            color: Colors.grey,
          ),

          // Footer
          Padding(
            padding: EdgeInsets.fromLTRB(12, 22, 12, 40),
            child: Text(
              "© 2025 Apple Store Uzbekistan",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}
