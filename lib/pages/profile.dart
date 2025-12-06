import 'dart:io';

import 'package:apple/services/prefservice.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  String name = "John";
  String email = "example@gmail.com";
  String phone = "+998";
  String? imagePath;
  
  Future<void> get() async {
    PrefService service = PrefService();
    List data = await service.getData();
    
    name = data[0];
    phone = data[1];
    email = data[2];
    imagePath = await service.getImage();
    
    setState(() {});
  }
  
  
  Future<void> chooseImage(ImageSource source) async {
    PrefService service = PrefService();
    
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source);
    
    // agar rasm tanlasa
    if(picked != null){
      await service.saveImage(picked.path);
      setState(() {
        imagePath = picked.path;
      });
    }
  }

  void edit(){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20)
        )
      ),
      builder: (context){
        TextEditingController _nameController = TextEditingController(text: name);
        TextEditingController _phoneController = TextEditingController(text: phone);
        TextEditingController _emailController = TextEditingController(text: email);


        return Padding(
          padding: EdgeInsets.only(
            bottom: 342,
            left: 18,
            right: 18,
            top: 42
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
              ),
              SizedBox(height: 20,),

              ElevatedButton(
                  onPressed: (){
                    if(_nameController.text.isEmpty || _emailController.text.isEmpty || _phoneController.text.isEmpty){
                      // ekran yopiladi
                      Navigator.pop(context);
                    } else{
                      PrefService service = PrefService();
                      service.saveData(_nameController.text, _phoneController.text, "", _emailController.text);

                      // ekran yopiladi
                      Navigator.pop(context);

                      // ma'lumotlar qayta yuklanadi
                      get();
                    }

                  },
                  child: Text(
                    "Saqlash",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: imagePath != null
                      // agar oldin rasm yuklagan bo'lsa
                          ? FileImage(File(imagePath!))
                      // agar rasm yo'q bo'lsa
                          : null,
                      child: imagePath == null
                          ? Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.white,
                      )
                          : null,
                      backgroundColor: Colors.grey.shade300,
                    ),
                    
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: (){
                          showModalBottomSheet(
                            context: context, 
                            builder: (context) => Container(
                              padding: EdgeInsets.all(18),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera_alt),
                                    title: Text("Rasmga olish"),
                                    onTap: (){
                                      Navigator.pop(context);
                                      chooseImage(ImageSource.camera);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo),
                                    title: Text("Gallareyadan tanlash"),
                                    onTap: (){
                                      Navigator.pop(context);
                                      chooseImage(ImageSource.gallery);
                                    },
                                  )
                                ],
                              ),
                            )
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          child: Icon(Icons.edit, color: Colors.white,),
                        ),
                      )
                    )
                  ],
                )
              ),
              SizedBox(height: 40,),

              Container(
                margin: EdgeInsets.only(bottom: 25),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Name:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          ),
                        ),
                        SizedBox(width: 30,),
                        Expanded(
                          child: Text(
                            name,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            ),
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          "Email:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        SizedBox(width: 30,),
                        Expanded(
                            child: Text(
                              email,
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          "Phone:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        SizedBox(width: 30,),
                        Expanded(
                            child: Text(
                              phone,
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                              ),
                            )
                        )
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30,),

              ElevatedButton(
                  onPressed: edit,
                  child: Text(
                    "Profilni O'zgartirish",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
