import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  List<Map<String, dynamic>> news = [
    {
      "sarlavha": "Yangi iPhone 17 Pro Max keldi!",
      "text": "Chegaralangan chegirma narxlarda sotib oling, bugun kechki 12:00gacha! Shoshiling!!!",
      "vaqt": "2 soat oldin",
      "image": "assets/p1.jpg"
    },
    {
      "sarlavha": "Yangi iPhone 17 Pro Max keldi!",
      "text": "Chegaralangan chegirma narxlarda sotib oling, bugun kechki 12:00gacha! Shoshiling!!!",
      "vaqt": "2 soat oldin",
      "image": "assets/p1.jpg"
    },
    {
      "sarlavha": "Yangi iPhone 17 Pro Max keldi!",
      "text": "Chegaralangan chegirma narxlarda sotib oling, bugun kechki 12:00gacha! Shoshiling!!!",
      "vaqt": "2 soat oldin",
      "image": "assets/p1.jpg"
    },
    {
      "sarlavha": "Yangi iPhone 17 Pro Max keldi!",
      "text": "Chegaralangan chegirma narxlarda sotib oling, bugun kechki 12:00gacha! Shoshiling!!!",
      "vaqt": "2 soat oldin",
      "image": "assets/p1.jpg"
    },
    {
      "sarlavha": "Yangi iPhone 17 Pro Max keldi!",
      "text": "Chegaralangan chegirma narxlarda sotib oling, bugun kechki 12:00gacha! Shoshiling!!!",
      "vaqt": "2 soat oldin",
      "image": "assets/p1.jpg"
    },
    {
      "sarlavha": "Yangi iPhone 17 Pro Max keldi!",
      "text": "Chegaralangan chegirma narxlarda sotib oling, bugun kechki 12:00gacha! Shoshiling!!!",
      "vaqt": "2 soat oldin",
      "image": "assets/p1.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yangiliklar"),
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView.separated(
          separatorBuilder: (_, _) => SizedBox(height: 20,),
          itemCount: news.length,
          itemBuilder: (context, index){
            final n = news[index];

            return Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2)
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // ClipRRect(
                      //   borderRadius: BorderRadius.vertical(
                      //     top: Radius.circular(15)
                      //   ),
                      //   child: Image.asset(
                      //     n["image"],
                      //     height: 180,
                      //     width: double.infinity, // moslashuvchan
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),

                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              n["sarlavha"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              n["text"],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade700,
                                height: 1.5
                              ),
                            ),
                            SizedBox(height: 15,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.access_time, size: 20, color: Colors.grey.shade500,),
                                    SizedBox(width: 5,),

                                    Text(
                                      n["vaqt"],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500
                                      ),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.done_all,
                                  color: Colors.grey.shade500,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
