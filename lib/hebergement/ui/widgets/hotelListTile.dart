
import 'package:bsc_app/hebergement/logic/models/heberge.dart';
import 'package:flutter/material.dart';

class HebergeCard extends StatelessWidget {
  final Heberge heberge;

  const HebergeCard({Key? key, required this.heberge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                heberge.image.isNotEmpty ? heberge.image[0] : 'https://via.placeholder.com/150',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heberge.nom,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          heberge.adresse,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                      ),
                      Text(
                        heberge.type,
                        style: TextStyle(color: Colors.black.withOpacity(0.3)),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                              heberge.rating,
                              (index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                            ),
                          ),
                           Row(
                            children: List.generate(
                              5-heberge.rating,
                              (index) => Icon(
                                Icons.star,
                                color: Colors.black.withOpacity(0.5),
                                size: 16,
                              ),
                            ),
                          ),
      
                        ],
                      ),
                      
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:Color(0xff140C47),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(
                          '${heberge.cost} ',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffD9D9D9),
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
      ),
    );
  }
}

