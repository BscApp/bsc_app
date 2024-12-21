import 'package:bsc_app/hebergement/logic/models/heberge.dart';
import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  final Heberge heberge;

  const MiniCard({Key? key, required this.heberge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffD9D9D9),
        ) ,
       child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
    Padding(
      padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Image.network(
                  
                heberge.image.isNotEmpty ? heberge.image[0] : 'https://via.placeholder.com/150',
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
      ),
    ),
          Text(
            heberge.nom,
            style: TextStyle(
                color:Colors.black.withOpacity(0.5),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
            Text('Type: ${heberge.type}'),

            Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.location_on)),
              Icon(Icons.star,color: Colors.yellow,),
              Text('${heberge.rating}'),
                SizedBox(width: 10,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
   color: Color(0xff140C47)),
                child: Text(heberge.cost,style: TextStyle(color: Colors.white),)
              )
                
              
            ],)

    ]
              )
      ),
    );
  }
}
