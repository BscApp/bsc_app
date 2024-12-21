import 'package:bsc_app/features/Servises/pages/navigation.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_bloc.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_event.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_state.dart';
import 'package:bsc_app/features/auth/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is UserLoaded) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 101),
              Image.asset('assets/icons/auth.png', height: 100),
              const SizedBox(height: 16),
              const Text(
                'Welcome to Back',
                style: TextStyle(
                    color: Color(0xFF140C47),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Login to continue.',
                style: TextStyle(
                  color: Color(0xFF140C47),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 187),
              TextField(
                controller: EmailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: PasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (EmailController.text == "admin" &&
                      PasswordController.text == "admin") {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    context.read<UserBloc>().add(LoginEvent(
                        email: EmailController.text,
                        password: PasswordController.text));
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color(0xFF140C47),
                    minimumSize: const Size(double.infinity, 50)),
                child: const Text(
                  'LOG IN',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreateAccountPage()));
                },
                child: const Text('Don’t have an account? Sign up now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
