import 'package:bsc_app/features/auth/pages/bloc/auth_bloc.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_event.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

late TextEditingController _controller;

class _NamePageState extends State<NamePage> {
  @override
    void initState() {
      super.initState();
      _controller = TextEditingController();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('update your name'),
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
                      labelText: 'Name',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: ElevatedButton(
                  onPressed: () {
                  final newUser=(state as UserLoaded).user.copyWith(firstName: _controller.text,lastName:_controller.text );
                  context.read<UserBloc>().add(changeUserField(user: newUser));
                  Navigator.pop(context);
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
