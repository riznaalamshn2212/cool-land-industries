import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        "name": "Air Cooler",
        "price": "Contact for Price",
        "description": "High quality Air Cooler",
        "image": "assets/images/air_cooler.jpg",
      },
      {
        "name": "LED TV",
        "price": "Contact for Price",
        "description": "Smart LED TV",
        "image": "assets/images/led_tv.jpg",
      },
      {
        "name": "Washing Machine",
        "price": "Contact for Price",
        "description": "Automatic Washing Machine",
        "image": "assets/images/washing_machine.jpg",
      },
      {
        "name": "Refrigerator",
        "price": "Contact for Price",
        "description": "Double Door Refrigerator",
        "image": "assets/images/refrigerator.jpg",
      },
      {
        "name": "Bed",
        "price": "Contact for Price",
        "description": "Wooden Bed",
        "image": "assets/images/bed.jpg",
      },
      {
        "name": "Almirah",
        "price": "Contact for Price",
        "description": "Steel Almirah",
        "image": "assets/images/almirah.jpg",
      },
      {
        "name": "Chair",
        "price": "Contact for Price",
        "description": "Comfortable Chair",
        "image": "assets/images/chair.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text(
          "Our Products",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: products.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.75,
        ),

        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(
                    name: products[index]["name"]!,
                    price: products[index]["price"]!,
                    description: products[index]["description"]!,
                    image: products[index]["image"]!,
                  ),
                ),
              );
            },

            child: Card(
              color: Colors.grey.shade900,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),

                    child: Image.asset(
                      products[index]["image"]!,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    child: Text(
                      products[index]["name"]!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    child: Text(
                      products[index]["price"]!,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}