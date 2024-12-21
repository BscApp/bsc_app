import 'package:flutter/material.dart';

class WriteInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              'Write Your Information',
              style: TextStyle(
                  color: Color(0xFF140C47),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 51),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Phone Number',
                  style: TextStyle(fontSize: 16, color: Color(0xFF140C47))),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 36),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Date of Birth',
                  style: TextStyle(fontSize: 16, color: Color(0xFF140C47))),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'DD/MM/YYYY',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 36),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('ID Card Number',
                  style: TextStyle(fontSize: 16, color: Color(0xFF140C47))),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color(0xFF140C47),
                    minimumSize: Size(double.infinity, 50))),
          ],
        ),
      ),
    );
  }
}
