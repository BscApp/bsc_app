import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  final String username;
  final String id;
  final Map<String, String> infoRoutes={
          'Name': '/name',
          'Email': '/email',
          'ID card Number': '/id_card_number',
          'Phone Number': '/phone_number',
          'Date of birth': '/date_of_birth',
        };


  ProfilePage({
    required this.username,
    required this.id,

    
  });

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 71, bottom: 51),
              child: Column(
                children: [
                  Text(

                    username,
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                  Text(
                    id,

                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 27),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: infoRoutes.length,
                itemBuilder: (context, index) {
                  String key = infoRoutes.keys.elementAt(index);
                  return ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(key),
                    onTap: () {
                      Navigator.pushNamed(context, infoRoutes[key]!);
                    },
                  );
                },
              ),
            ),
          ],
        ),

      ),
    );
  }
}
