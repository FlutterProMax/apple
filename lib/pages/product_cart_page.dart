import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.deepPurple,
                    size: 38,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      blurRadius: 5,
                      offset: Offset(0, 2)
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              automaticallyImplyLeading: false,

              expandedHeight: 350,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.product["name"],
                  child: Image.network(
                    widget.product["image"],
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Icon(Icons.image),
                  )
                ),
              ),
            ),

            // body
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product["name"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    ),

                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 25,
                        ),

                        SizedBox(width: 7,),
                        Text(
                          widget.product["rating"].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),

                    Text(
                      "\$${widget.product["price"]}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple
                      ),
                    ),

                    SizedBox(height: 20,),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100
                          )
                        ]
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '''
Ever wished a product description would just write itself? With Shopify Magic—Shopify’s artificial intelligence tools designed for commerce—it will. Create product descriptions in seconds and get your products in front of shoppers faster than ever.
Reference: https://www.shopify.com/blog/8211159-9-simple-ways-to-write-product-descriptions-that-sell?term=&adid=732950216807&campaignid=19685772937&utm_medium=cpc&utm_source=google&gad_source=1&gad_campaignid=19685772937&gbraid=0AAAAAC3NCDpzOmeKcByIJaodAGV78YUfL&gclid=Cj0KCQiAosrJBhD0ARIsAHebCNrrpakFQj2j8_17ZW50nB4XIBjwufZnUlptzyes5_3mJP9-wohVCpwaAqpcEALw_wcB
                      ''',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Colors.grey.shade700
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: 35,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
