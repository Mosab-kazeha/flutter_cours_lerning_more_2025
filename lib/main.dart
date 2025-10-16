import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

String textFileValue = '';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController controller;
  double contnerWight = 0;
  double contnerHight = 0;

  @override
  void initState() {
    controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("the value of text file is => ${controller.text}"),
            SizedBox(
              width: 250,
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  // suffix: Icon(Icons.person),
                  suffixIcon: Icon(Icons.abc),
                  // prefix: Icon(Icons.phone),
                  prefixIcon: Icon(Icons.phone),
                  helper: Text("hello"),
                  // hintText: "phone number",
                  hintStyle: TextStyle(fontSize: 20),
                  label: Text("data"),
                ),
                onChanged: (String value) {
                  print(controller.text);
                  setState(() {});
                  contnerHight = contnerHight + 10;
                  contnerWight = contnerWight + 10;
                  textFileValue = value;
                },
              ),
            ),

            InkWell(
              // onTap: () {
              //   contnerHight = 100;
              //   contnerWight = 400;
              //   setState(() {});
              // },
              // child: Checkbox(
              //   value: isChecked,
              //   checkColor: Colors.teal,
              //   // focusColor: Colors.amber,
              //   activeColor: Colors.black,
              //   shape: CircleBorder(side: BorderSide.none, eccentricity: 0.9),
              //   // splashRadius: 1000,

              //   // materialTapTargetSize: ,

              //   // overlayColor: WidgetStateColor.transparent,
              //   onChanged: (isCelacted) {
              //     setState(() {});
              //     isChecked = isCelacted;
              //     print(isChecked);
              //   },
              // ),
              child: Switch(
                value: isChecked!,
                activeColor: Colors.teal,
                // focusColor: Colors.amber,
                inactiveTrackColor: Colors.amber,
                onChanged: (value) {
                  isChecked = value;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
