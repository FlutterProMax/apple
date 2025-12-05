import 'package:apple/pages/contact.dart';
import 'package:apple/pages/profile.dart';
import 'package:apple/pages/savat.dart';
import 'package:apple/pages/search.dart';
import 'package:apple/pages/smoothpageview/first_cart.dart';
import 'package:apple/pages/smoothpageview/fourth_cart.dart';
import 'package:apple/pages/smoothpageview/second_cart.dart';
import 'package:apple/pages/smoothpageview/third_cart.dart';
import 'package:apple/widget/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Map<String, String>> stories = [
    {
      "image" : "https://flutter-3.vercel.app/Elshodbek.jpg",
      "name" : "Elshodbek"
    },
    {
      "image" : "https://flutter-3.vercel.app/Ziyodulloh.jpg",
      "name" : "Ziyodullo"
    },
    {
      "image" : "https://flutter-3.vercel.app/Sanjarbek.jpg",
      "name" : "Sanjarbek"
    },
    {
      "image" : "https://flutter-3.vercel.app/Ibrohimjon.jpg",
      "name" : "Ibrohimjon"
    },
    {
      "image" : "https://flutter-3.vercel.app/Abduvali.jpg",
      "name" : "Abduvali"
    },
    {
      "image" : "https://flutter-3.vercel.app/Yahyobek.jpg",
      "name" : "Yahyobek"
    },
    {
      "image" : "https://flutter-3.vercel.app/Behruzbek.jpg",
      "name" : "Beckie"
    }
  ];

  final _pageController = PageController();

  int tanlangan_index = 0;

  void _direction(int index){
    tanlangan_index = index;

    if(tanlangan_index == 1){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Contact()
        )
      );
    } else if(tanlangan_index == 2){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Savat()
        )
      );
    } else if(tanlangan_index == 3){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile()
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          toolbarHeight: 105,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 5,
          title: Padding(
            padding: const EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 50),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (_, i){
                  final story = stories[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: SizedBox(
                      width: 60,
                      child: SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.pink, Colors.orange, Colors.red],
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.pinkAccent,
                                backgroundImage: NetworkImage(story["image"]!),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              child: Text(
                                story["name"]!,
                                style: const TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  )
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(12, 10, 12, 6),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(1, 1)
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey, size: 30,),
                        SizedBox(width: 17,),
                        Text(
                          "Search...",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                            fontSize: 20
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey.shade600,
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 20,),

            SizedBox(
              height: 450,
              child: PageView(
                controller: _pageController,
                children: [
                  FirstCart(),
                  SecondCart(),
                  ThirdCart(),
                  FourthCart()
                ],
              ),
            ),

            SizedBox(height: 15,),

            SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: JumpingDotEffect(
                activeDotColor: Colors.black,
                dotColor: Colors.brown,
                spacing: 18
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tanlangan_index,
        onTap: _direction,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded),
              label: 'Contact'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Savat'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile'
          )
        ]
      ),
    );
  }
}
