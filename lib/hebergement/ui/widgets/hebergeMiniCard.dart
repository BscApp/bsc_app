
import 'package:bsc_app/hebergement/logic/models/heberge.dart';
import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  final Heberge hotelData;

  HotelCard({required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.network(
              hotelData.image[0], // Replace with actual image URL
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Content Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hotel Name and Type
                Text(
                  hotelData.nom, // Hotel Name
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Type: ${hotelData.type}", // Hotel Type
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                // Icon Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.grey[600],
                          size: 18,
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.star_border,
                          color: Colors.grey[600],
                          size: 18,
                        ),
                      ],
                    ),
                    // Price
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        "${hotelData.cost}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

