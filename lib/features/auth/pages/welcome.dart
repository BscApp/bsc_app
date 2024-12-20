import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 119, bottom: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/auth.png', height: 100),
            SizedBox(height: 16),
            Text(
              'WELCOME TO BSC',
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF140C47),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Smart Tourism for a Smarter Wilaya Connecting\nPeople, Places, and Experiences',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color(0xFF140C47),
                    minimumSize: Size(double.infinity, 50)),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'LOG IN',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color(0xFF140C47),
                    minimumSize: Size(double.infinity, 50)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



