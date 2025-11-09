// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_secion/config/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_secion/features/Auth/model/user_model.dart';

import '../bloc/auth_bloc.dart';


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

class UserScreen extends StatefulWidget {
  final String userToken;

  UserScreen({super.key, required this.userToken});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController dataToSave = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              prefs.getString("data_from_text_field") ??
                  "there is no saved data yet",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Checkbox(
              value: prefs.getBool("isCheck"),
              onChanged: (value) {
                prefs.setBool("isCheck", value!);
                setState(() {});
              },
            ),
            TextField(
              controller: dataToSave,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextButton(
              onPressed: () async {
                await prefs.setString("data_from_text_field", dataToSave.text);
                setState(() {});
              },
              child: Text('clike to save'),
            ),
          ],
        ),
      ),
    );
  }
}
