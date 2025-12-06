import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {

  int? openIndex;

  List<Map<String, dynamic>> faqs = [
    {
      "q": "Qanaqa qilib buyurtma qilish mumkin?",
      "a": "Qattan biley",
    },
    {
      "q": "Dastavka tekinmi?",
      "a": "Tirikchilik...",
    },
    {
      "q": "Nech kunda buyurtma yetib keladi?",
      "a": "Sharoitga qarab",
    },
    {
      "q": "Apple Marketga qanaqa qilib ishga kirish mumkin?",
      "a": "Kalla ishlatish kerak",
    },
    {
      "q": "Macbook qancha turadi?",
      "a": "Qidiring, turiptyu",
    },
  ];

  void open(){
    setState(() {

    });
  }

  Future<void> callAdmin(BuildContext context, String number) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: number);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Telefon ilovasi ochilmadi")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Savol-javoblar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23
          ),
        ),
        elevation: 2,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(15),
        separatorBuilder: (_, _) => SizedBox(height: 15,),
        itemCount: faqs.length,
        itemBuilder: (context, index){
          final savol = faqs[index];
          bool isOpen = openIndex == index;

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2)
                ),
              ]
            ),
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: (){
                    setState(() {
                      isOpen ? openIndex = null : openIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            savol["q"],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        AnimatedRotation(
                          turns: isOpen ? 0.5 : 0,
                          duration: Duration(microseconds: 200),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if(isOpen == true)
                  Container(
                    width: 370,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(15)
                      )
                    ),
                    child: Text(
                      savol["a"],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Colors.grey.shade700
                      ),
                    ),
                  )
              ],
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () => callAdmin(context, "+998944534787"),
          icon: Icon(
            Icons.phone,
            size: 27,
          ),
          label: Text(
              "Call Admin",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
          )
      )
    );
  }
}
