import 'package:flutter/material.dart';

class FourthCart extends StatelessWidget {
  const FourthCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.green,
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
                  fit: BoxFit.fill,
                  "assets/fourth_cart_photo.jpeg",
                  height: 220,
                  width: 330,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "Online Oson To'lov",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "     Uydan chiqmasdan mobil ilovamiz         orqali xavfsiz va osongina to'lov qiling",
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
