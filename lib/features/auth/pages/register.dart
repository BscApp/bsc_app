import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            Image.asset(
              'assets/icons/auth.png',
              height: 73,
              width: 183,
            ),
            SizedBox(height: 16),
            Text(
              'Create An Account',
              style: TextStyle(
                  color: Color(0xFF140C47),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Name',
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
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Email Address',
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
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Password',
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
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('confirm Password',
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
              child: RichText(
                text: TextSpan(
                  text: 'Have an account already? ',
                  style: TextStyle(color: Color(0xFF140C47), fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log in',
                      style: TextStyle(
                        color: Color(0xFF140C47),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
