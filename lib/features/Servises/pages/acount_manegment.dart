import 'package:flutter/material.dart';

class AccManegment extends StatefulWidget {
  String username;
  AccManegment({super.key, required this.username});

  @override
  State<AccManegment> createState() => _AccManegmentState();
}

class _AccManegmentState extends State<AccManegment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
              child: Text(
                'Your account',
                style: TextStyle(color: Colors.grey,fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 27),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text(widget.username),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
              child: Text(
                'Info and support',
                style: TextStyle(color: Colors.grey,fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 27),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('Help'),
                    onTap: () {
                      Navigator.pushNamed(context, '/help');
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('Contact'),
                    onTap: () {
                      Navigator.pushNamed(context, '/contact');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'login',
                style: TextStyle(color: Colors.grey[500],fontSize:20),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 27),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('Logout'),
                    onTap: () {
                      Navigator.pushNamed(context, '/Logout');
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('delete account',
                        style: TextStyle(color: Colors.red)),
                    onTap: () {
                      Navigator.pushNamed(context, '/delete');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
