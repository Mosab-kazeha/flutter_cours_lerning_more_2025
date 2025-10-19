import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 1;
  List<Widget> page = [
    Center(
      child: Tooltip(
        onTriggered: () {
          print("0");
        },
        message: "flutter",
        enableFeedback: true,
        child: FlutterLogo(size: 500),
      ),
    ),
    Center(child: FlutterLogo(size: 300)),
    Center(child: FlutterLogo(size: 100)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: page[pageIndex],
      drawer: Drawer(
        child: Column(
          children: [
            // DrawerHeader(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Row(
            //         children: [
            //           CircleAvatar(child: Icon(Icons.person)),
            //           Text("name"),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           CircleAvatar(child: Icon(Icons.phone)),
            //           Text("+963"),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            UserAccountsDrawerHeader(
              // decoration: BoxDecoration(
              //   image: DecorationImage(image:
              //   )
              // ),
              accountName: Row(
                children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  Text("name"),
                ],
              ),
              accountEmail: Row(
                children: [
                  CircleAvatar(child: Icon(Icons.phone)),
                  Text("+963"),
                ],
              ),
            ),

            Text("setting"),
            Text("setting"),
            Text("setting"),
            Text("setting"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: pageIndex,
        onTap: (value) {
          print(value);
          setState(() {});
          pageIndex = value;
        },
        selectedLabelStyle: TextStyle(fontSize: 50),
        items: [
          BottomNavigationBarItem(
            
            icon: Icon(Icons.person),
            label: "profile",
            tooltip: 'profile',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        ],
      ),
    );
  }
}
