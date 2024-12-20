import 'package:flutter/material.dart';
class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/icons/auth.png', height: 100),
            SizedBox(height: 16),
            Text(
              'Create An Account',
              style: TextStyle(
                  color: Color(0xFF140C47),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 51),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'NEXT',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color(0xFF140C47),
                  minimumSize: Size(double.infinity, 50)),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: Text('Have an account already? Log in'),
            ),
          ],
        ),
      ),
    );
  }
}