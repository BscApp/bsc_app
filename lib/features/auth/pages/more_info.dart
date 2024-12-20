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
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 36),
            TextField(
              decoration: InputDecoration(
                labelText: 'Date of birth (DD/MM/YY)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 36),
            TextField(
              decoration: InputDecoration(
                labelText: 'ID card number',
                border: OutlineInputBorder(),
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
