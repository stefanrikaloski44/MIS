import 'package:flutter/material.dart';
import '../models/clothing_item.dart';
import '../widgets/clothing_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  final List<ClothingItem> items = [
    ClothingItem(
        name: "Black Plain T-Shirt",
        price: 9.99,
        description: "A versatile stylish plain black t-shirt, "
            "perfect for any occasion. Made from soft, breathable cotton for all-day comfort. "
            "Features a classic crew neckline, short sleeves, "
            "and a relaxed fit that pairs well with jeans, shorts, or under a jacket. "
            "A must-have staple in any wardrobe",
        sizes: "XS S M L XL XXL",
        image: "https://i.ibb.co/TP1pTZn/oversized-front-plain-510x556.jpg"),
    ClothingItem(
        name: "Blue Denim Jacket",
        price: 49.99,
        description:
            "A timeless blue denim jacket with a slightly faded wash for a vintage look. Designed with a button-up front, two chest pockets, and adjustable cuffs. The stretchy material ensures comfort and flexibility, making it perfect for layering in all seasons.",
        sizes: "S M L XL",
        image: "https://i.ibb.co/LC7HvtB/denim-jacket-cropped.jpg"),
    ClothingItem(
        name: "Slim Fit Chinos (Khaki)",
        price: 24.99,
        description:
            "Classic khaki chinos with a slim-fit design for a modern look. These trousers are perfect for both casual and semi-formal settings. Features include a zip fly, belt loops, and two side and back pockets. Durable and comfortable for everyday wear.",
        sizes: "30 32 34 36 38",
        image: "https://i.ibb.co/mh4RMGn/khaki-cropped.jpg"),
    ClothingItem(
        name: "Oversized Hoodie (Grey)",
        price: 19.99,
        description:
            "Cozy and stylish, this oversized grey hoodie is made for lounging or running errands. Designed with a drawstring hood, spacious kangaroo pocket, and ribbed cuffs. Soft on the inside and durable on the outside, making it a wardrobe favorite for cooler days.",
        sizes: "S XL XXL",
        image: "https://i.ibb.co/1mht1pF/oversized-hoodie-cropped.jpg"),
    ClothingItem(
        name: "Classic Half-Zip Sweatshirt",
        price: 39.99,
        description:
            "A stylish and versatile half-zip sweatshirt in a rich navy blue shade. Features a stand-up collar with a sturdy zipper, ribbed cuffs, and hem for a snug fit. The soft fleece lining ensures warmth and comfort, making it ideal for layering or wearing on its own during chilly days.",
        sizes: "S M L XL",
        image: "https://i.ibb.co/FBDyV1k/halfzip-cropped.jpg"),
    ClothingItem(
        name: "Denim Baggy Jeans",
        price: 24.99,
        description:
            "These baggy jeans are a perfect blend of comfort and style. Features include a flattering fit, stretch fabric, and a classic 5-pocket design. Versatile enough to pair with casual tops or dressy blouses for any occasion.",
        sizes: "36 38 40 42",
        image: "https://i.ibb.co/kyJg1yk/jeans-cropped.jpg)",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[200],
        appBar: AppBar(
          title: Text(
            "LAB 1\n211295",
            style: TextStyle(
              fontFamily: "Georgia",
              fontSize: 20.0, // Optional: Adjust the font size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.brown[400],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 18.0,left: 5.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 90.0,
              childAspectRatio: 0.38,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ClothingCard(
                item: items[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(item: items[index]),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
