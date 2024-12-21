import 'package:bsc_app/features/auth/model/user.dart';
import 'package:bsc_app/features/auth/pages/more_info.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
              style: const TextStyle(
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
                controller: nameController,
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
                controller: emailController,
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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Confirm Password',
                  style: TextStyle(fontSize: 16, color: Color(0xFF140C47))),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 50,
              child: TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final userDto = User(
                  firstName: nameController.text,
                  lastName: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  phone: "",
                  dateOfBirth: DateTime.now(),
                  placeOfBirth: "",
                  cardId: "",
                  sex: "Male",
                );

                if (userDto.firstName.isNotEmpty &&
                    userDto.lastName.isNotEmpty &&
                    userDto.email.isNotEmpty &&
                    userDto.password.isNotEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WriteInformationPage(user: userDto),
                    ),
                  );
                }
              },
              child: const Text(
                'NEXT',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: const Color(0xFF140C47),
                  minimumSize: const Size(double.infinity, 50)),
            ),
            const SizedBox(height: 8),
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
