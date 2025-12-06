import 'package:flutter/material.dart';

class ThirdCart extends StatelessWidget {
  const ThirdCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.pink,
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
                  "assets/third_cart_photo.jpg",
                  height: 220,
                  width: 330,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "Eng Arzon Narxlar",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "    Apple mahsulotlarini eng yaxshi       narxlarda va chegirmalarda sotib oling",
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
