import 'package:flutter/material.dart';

class FirstCart extends StatelessWidget {
  const FirstCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueAccent,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(25),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SizedBox(
        height: 450,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
              ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), 
                  topRight: Radius.circular(20)
                ),
                child: Image.asset(
                  fit: BoxFit.cover,
                  "assets/first_cart_photo.jpg",
                  height: 220,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "Tezkor Yetkazib Berish",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "Biz O'zbekiston bo'ylab Toshkent va 12ta viloyatga 1-3kun ichida yetkazib beramiz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade700
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}