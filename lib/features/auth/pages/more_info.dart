import 'package:bsc_app/features/Servises/pages/navigation.dart';
import 'package:bsc_app/features/auth/model/user.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_bloc.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_event.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WriteInformationPage extends StatelessWidget {
  final User user;
  final PhoneNumberContoller = TextEditingController();
  final DateOfBirthController = TextEditingController();
  final IDCardNumberController = TextEditingController();

  WriteInformationPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<UserBloc, UserState>(
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
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'Write Your Information',
                style: TextStyle(
                    color: Color(0xFF140C47),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 51),
              TextField(
                controller: PhoneNumberContoller,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 36),
              TextField(
                controller: DateOfBirthController,
                decoration: const InputDecoration(
                  labelText: 'Date of birth (DD/MM/YY)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 36),
              TextField(
                controller: IDCardNumberController,
                decoration: const InputDecoration(
                  labelText: 'ID card number',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  final format = DateFormat('dd/MM/yyyy');
                  final Newuser = User(
                    firstName: user.firstName,
                    lastName: user.lastName,
                    email: user.email,
                    password: user.password,
                    phone: PhoneNumberContoller.text,
                    dateOfBirth: format.parse(DateOfBirthController.text),
                    cardId: IDCardNumberController.text,
                    sex: 'MALE',
                    placeOfBirth: 'BOUMERDES',
                  );
                  print(Newuser.toJson());
                  //BlocProvider.of<UserBloc>(context).add(RegisterEvent(user: user));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color(0xFF140C47),
                    minimumSize: const Size(double.infinity, 50)),
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
