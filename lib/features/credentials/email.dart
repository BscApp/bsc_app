import 'package:bsc_app/features/auth/pages/bloc/auth_bloc.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_event.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});
  @override
  State<EmailPage> createState() => _EmailPageState();
}

  late  TextEditingController _controller ;
class _EmailPageState extends State<EmailPage> {
  @override
    void initState() {
    
   _controller= TextEditingController();
      super.initState();
    }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('update your Email'),
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
                      labelText: 'Email',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: ElevatedButton(
                  onPressed: () {
          
                       final newUser=(state as UserLoaded).user.copyWith(email: _controller.text);
                      context.read<UserBloc>().add(changeUserField(user: newUser));
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
