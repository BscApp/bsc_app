import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 101),
            Image.asset('assets/icons/auth.png', height: 73, width: 138),
            SizedBox(height: 16),
            Text(
              'Welcome to Back',
              style: TextStyle(
                  color: Color(0xFF140C47),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Login to continue.',
              style: TextStyle(
                color: Color(0xFF140C47),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 187),
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
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('password',
                  style: TextStyle(fontSize: 16, color: Color(0xFF140C47))),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 50,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  'LOG IN',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color(0xFF140C47),
                    minimumSize: Size(double.infinity, 50))),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {},
                child: RichText(
                text: TextSpan(
                  text: 'Don’t have an account? ',
                  style: TextStyle(color: Color(0xFF140C47), fontSize: 16),
                  children: <TextSpan>[
                  TextSpan(
                    text: 'Sign up now',
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
