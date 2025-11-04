// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_secion/Auth/bloc/login_bloc.dart';
import 'package:bloc_secion/Auth/model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: LoginScreen(),
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController userName = TextEditingController();
  TextEditingController passowrd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is SuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('login successFuly'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserScreen(userToken: token),
            ),
          );
        }
        if (state is FialerState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('login failed'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userName,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: passowrd,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextButton(
              onPressed: () {
                context.read<LoginBloc>().add(
                  UserLogginIn(
                    user: UserModel(
                      password: passowrd.text,
                      username: userName.text,
                    ),
                  ),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  final String userToken;
  const UserScreen({super.key, required this.userToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(userToken)));
  }
}
