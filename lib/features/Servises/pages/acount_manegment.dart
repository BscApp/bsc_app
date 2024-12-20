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

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0), // set the height here
        child: AppBar(
          title: Text('Your Account'),
        ),
      ),
      body: Column(
        children: [
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
          SizedBox(height: 41),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
            child: Text(
              'Info and support',
              style: TextStyle(color: Colors.grey),
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
          SizedBox(height: 31),
          Container(
            padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              'login',
              style: TextStyle(color: Colors.grey[500]),
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
                  title: Text('Logout',),
                  onTap: () {
                    Navigator.pushNamed(context, '/Logout');
                  },
                ),
                //another useless comment
                ListTile(
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.red,
                  ),
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
    );
  }
}
