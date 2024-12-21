import 'package:bsc_app/features/Servises/logic/nav.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_bloc.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_event.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_state.dart';
import 'package:bsc_app/features/auth/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccManegment extends StatefulWidget {
  
  AccManegment({super.key});

  @override
  State<AccManegment> createState() => _AccManegmentState();
}

class _AccManegmentState extends State<AccManegment> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc,UserState>(
 
       
        listener: (BuildContext context, UserState state) {  
  if (state is UserInitial){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
  }
      },
        child: BlocBuilder<UserBloc,UserState>(
          builder: (context,state) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 27),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text((state as UserLoaded).user.firstName),
                    onTap: () {
                       //context.read<state>().changestate(1);
                    },
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
                  child: Text(
                    'Info and support',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 27),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text('Help'),
                        onTap: () {
                        
                        },
                      ),
                      ListTile(
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text('Contact'),
                        onTap: () {
                          
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'login',
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 27),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text(
                          'Logout',
                        ),
                        onTap: () {
                          context.read<UserBloc>().add(LogoutEvent());
                        },
                      ),
                     
                      ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.red,
                        ),
                        title: Text('delete account',
                            style: TextStyle(color: Colors.red)),
                        onTap: () {
                          Navigator.pushNamed(context, '/delete');
                        },
                      ),
                    ],
                  ),
                )
              ],);
          }
        ));
      
  }
}
