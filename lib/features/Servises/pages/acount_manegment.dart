import 'package:flutter/material.dart';

class AccManegment extends StatefulWidget {
  String username;
  
  AccManegment({super.key, required this.username ,});

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
          title: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Your Account',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
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
                
              },
            ),
          ),
          SizedBox(height: 25),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
            child: Text(
              'Info and support',
              style: TextStyle(color: Colors.grey, fontSize: 20),
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
                  
                  },
                ),
                ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text('Contact'),
                  onTap: () {
                    
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              'login',
              style: TextStyle(color: Colors.grey[500], fontSize: 20),
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
                  title: Text(
                    'Logout',
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/Logout');
                  },
                ),
               
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
