import 'dart:io';
import 'package:apple/pages/faq.dart';
import 'package:apple/pages/notification.dart';
import 'package:apple/pages/profile.dart';
import 'package:apple/pages/search.dart';
import 'package:apple/pages/settings.dart';
import 'package:apple/services/prefservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';


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


  Future<void> shareApk() async {
    try {
      final byteData = await rootBundle.load('assets/app-release.apk');

      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/app-release.apk');
      await tempFile.writeAsBytes(byteData.buffer.asUint8List(), flush: true);

      final xfile = XFile(tempFile.path);
      await Share.share(
        "Yangi ilovamizni yuklab oling!\n\nILOVA TEZ ORADA PLAY MARKETDA CHIQADI",
      );

      if (await tempFile.exists()) {
        await tempFile.delete();
      }
    } catch (e) {
      print('Share error: $e');
    }
  }


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
                        if(index == 0){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Notifications()
                            )
                          );
                        }
                        else if(index == 1){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FAQ()
                            )
                          );
                        }
                        else if(index == 2){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage()
                            )
                          );
                        }
                        else if(index == 3){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile()
                            )
                          );
                        }
                        else if(index == 4){
                          shareApk();
                        }
                        else if(index == 5){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Settings()
                            )
                          );
                        }
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
