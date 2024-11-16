import 'package:flutter/material.dart';
import '../models/clothing_item.dart';


class DetailsScreen extends StatelessWidget {
  // const DetailsScreen({super.key});
  ClothingItem item;

  DetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Times New Roman",
          ),
        ),
        backgroundColor: Colors.brown[400],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(item.image),
          // Divider(
          //   color: Colors.black,
          //   thickness: 1.2,
          //   indent: 0,
          //   endIndent: 0,
          // ),
          SizedBox(height: 10),
          Text(item.name, style: TextStyle(fontSize: 26, fontFamily: "Times New Roman")),
          Divider(
            color: Colors.black,
            thickness: 1.2,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox(height: 2),
          Text("\$${item.price}", style: TextStyle(fontSize: 22, fontFamily: "Courier New",fontWeight: FontWeight.bold,)),
          SizedBox(height: 25),
          Text(item.description,
          style: TextStyle(fontSize: 15, fontFamily: "Times New Roman"),),
        ],
      ),
      ),
    );
  }
}
