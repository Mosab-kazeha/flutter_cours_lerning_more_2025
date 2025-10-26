import 'dart:io';

import 'package:auth_flow/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences storage;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  storage=await SharedPreferences.getInstance();
  // print(Directory.current.path);
  token  =await storage.getString("token")??"";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:token.isEmpty ? LogInPage() : HomePage());
  }
}

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  hintText: "username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                bool status = await logIn(
                  username: username.text,
                  password: password.text,
                );
                if (status) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Success"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Error"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getMyInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListTile(
                title: Text(snapshot.data!.username),
                subtitle: Text(snapshot.data!.email),
                leading: Image.network(snapshot.data!.image),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
