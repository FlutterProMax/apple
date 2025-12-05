import 'package:apple/pages/contact.dart';
import 'package:apple/pages/home.dart';
import 'package:apple/pages/product_cart_page.dart';
import 'package:apple/pages/profile.dart';
import 'package:apple/pages/savat.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filtered = products;
  }

  final _searchController = TextEditingController();

  List<Map<String, dynamic>> products = [
    {
      "name": "iPhone 17 Pro",
      "price": 1299,
      "image": "https://cdn.auchan.fr/media/A0220250828000443221PRIMARY_2048x2048/B2CD/?format=rw&amp;quality=75&amp;width=200&amp;height=200",
      "rating": 4.9
    },
    {
      "name": "Macbook Pro",
      "price": 2999,
      "image": "https://i.pinimg.com/736x/34/88/4d/34884d4de9f6ec3e1e66f81274cf94aa.jpg",
      "rating": 5.0,
    },
    {
      "name": "Samsung S26 Ultra",
      "price": 1999,
      "image": "https://avatars.mds.yandex.net/get-mpic/16454321/2a00000197472dc40e03a27deac36b373533/orig",
      "rating": 4.3,
    },
    {
      "name": "Apple Watch",
      "price": 5999,
      "image": "https://i.pinimg.com/736x/18/ab/03/18ab03a8971eeb66c5f149b306c9d3a7.jpg",
      "rating": 5.0
    },
    {
      "name": "Iphone 17 IPad",
      "price": 999,
      "image": "https://i.pinimg.com/736x/78/c0/75/78c075305f27d16bd14e2074346eb2c2.jpg",
      "rating": 2.5
    },
    {
      "name": "iMac Pro",
      "price": 9999,
      "image": "https://i.pinimg.com/736x/ae/26/3e/ae263ec84dfc6b33576500fa63685609.jpg",
      "rating": 4.7
    },
  ];

  List<Map<String, dynamic>> filtered = [];

  void _search(String qidiruv){
    setState(() {
      filtered = products
        .where((p) =>
          p["name"].toLowerCase().contains(qidiruv.toLowerCase().trim()))
        .toList();
    });
  }

  int tanlangan_index = 0;

  void _direction(int index){
    tanlangan_index = index;

    if(tanlangan_index == 0){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home()
        )
      );
    } else if(tanlangan_index == 1){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Contact()
          )
      );
    } else if(tanlangan_index == 2){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Savat()
          )
      );
    } else if(tanlangan_index == 3){
      Navigator.pushReplacement(
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _search,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mahsulot qidiring...",
                      prefixIcon: Icon(Icons.search_outlined),
                      contentPadding: EdgeInsets.only(top: 10)
                    ),
                  ),
                ),
              ),
            )
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemCount: filtered.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.66
          ),
          itemBuilder: (context, index){
            final product = filtered[index];

            return InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetails(product: product)
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black12,
                      offset: Offset(0, 3)
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          product["image"],
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => Icon(Icons.image),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    Text(
                      product["name"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      "\$${product["price"]}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size:   17,
                        ),
                        SizedBox(width: 5,),
                        Text(
                          product["rating"].toString(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
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
