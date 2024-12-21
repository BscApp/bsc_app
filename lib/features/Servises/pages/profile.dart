import 'package:bsc_app/features/auth/pages/bloc/auth_bloc.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_state.dart';
import 'package:bsc_app/features/auth/pages/login.dart';
import 'package:bsc_app/features/credentials/birth_day.dart';
import 'package:bsc_app/features/credentials/email.dart';
import 'package:bsc_app/features/credentials/id.dart';
import 'package:bsc_app/features/credentials/name.dart';
import 'package:bsc_app/features/credentials/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> infoRoutes = {
    'Name': NamePage(),
    'Email': EmailPage(),
    'Phone Number': phonePage(),
    'Date of birth': BirthDayPage(),
  };

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserInitial) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()));
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 71, bottom: 51),
                child: Column(
                  children: [
                    Text(
                      (state as UserLoaded).user.firstName,
                      style: TextStyle(fontSize: 24, color: Colors.grey),
                    ),
                    Text(
                      (state as UserLoaded).user.cardId,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 27),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: infoRoutes.length,
                  itemBuilder: (context, index) {
                    String key = infoRoutes.keys.elementAt(index);
                    return ListTile(
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text(key),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => infoRoutes[key],
                        ));
                      },
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
