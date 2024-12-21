import 'package:bsc_app/features/auth/pages/bloc/auth_bloc.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_event.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BirthDayPage extends StatefulWidget {
  const BirthDayPage({super.key});

  @override
  State<BirthDayPage> createState() => _BirthDayPageState();
}
 late   TextEditingController _controller ;
class _BirthDayPageState extends State<BirthDayPage> {
  @override

    void initState() {
     _controller=TextEditingController();
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('update your Birth Day'),
        centerTitle: true,
      ),
      body: BlocBuilder<UserBloc,UserState>(
        builder: (context,state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Birth Day',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: ElevatedButton(
                  onPressed: () {
                    try {
          
                          final format = DateFormat('dd/MM/yyyy');
                        final date= format.parse(_controller.text); 
                      final newUser=(state as UserLoaded).user.copyWith(dateOfBirth: date);
                context.read<UserBloc>().add(changeUserField(user: newUser)); 
                                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text( e.toString())));
                                      
                      
                                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color(0xFF140C47),
                      minimumSize: const Size(double.infinity, 50)),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
