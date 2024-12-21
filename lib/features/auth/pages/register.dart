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
            Image.asset('assets/icons/auth.png', height: 100),
            const SizedBox(height: 16),
            const Text(
              'Create An Account',
              style: const TextStyle(
                  color: Color(0xFF140C47),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 51),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final userDto=User(firstName:nameController.text, lastName: nameController.text, email:emailController.text, password: passwordController.text, phone: "", dateOfBirth:DateTime.now(), placeOfBirth: "", cardId: "", sex: "Male");

   if (userDto.firstName.isNotEmpty && userDto.lastName.isNotEmpty && userDto.email.isNotEmpty && userDto.password.isNotEmpty) {
   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>WriteInformationPage(user:userDto)));
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
              onPressed: () {
              
              },
              child: const Text('Have an account already? Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
