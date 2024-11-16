import 'package:flutter/material.dart';
import '../models/clothing_item.dart';

class ClothingCard extends StatelessWidget {
  // const ({super.key});

  ClothingItem item;
  VoidCallback onTap;

  ClothingCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
            elevation: 5.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 290.0,
                  width: double.infinity,
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times New Roman",
                          fontSize: 22.0,
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Divider(
                        color: Colors.black,
                        thickness: 1.2,
                        indent: 8.0,
                        endIndent: 24.0, // Space after the line ends
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontFamily: "Courier New",
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Center(
                        child: Text(
                          'Available sizes: \n ${item.sizes}',
                          style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
