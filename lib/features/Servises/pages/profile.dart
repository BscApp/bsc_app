import 'package:bsc_app/features/auth/pages/bloc/auth_bloc.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_state.dart';
import 'package:bsc_app/features/auth/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfilePage extends StatelessWidget {
  final Map<String, String> infoRoutes={
          'Name': '/name',
          'Email': '/email',
          'ID card Number': '/id_card_number',
          'Phone Number': '/phone_number',
          'Date of birth': '/date_of_birth',
        };


  ProfilePage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<UserBloc,UserState>(
          builder: (context,state) {
            if (state is UserInitial){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
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
                          Navigator.pushNamed(context, infoRoutes[key]!);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        ),

      ),
    );
  }
}
