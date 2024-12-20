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
            Image.asset('assets/icons/auth.png', height: 100),
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
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
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
              child: Text('Don’t have an account? Sign up now'),
            ),
          ],
        ),
      ),
    );
  }
}
