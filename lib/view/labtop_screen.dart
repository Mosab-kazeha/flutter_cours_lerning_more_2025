import 'package:flutter/material.dart';

class LabtopScreen extends StatelessWidget {
  const LabtopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double border = MediaQuery.sizeOf(context).width / 50;
    return Scaffold(
      appBar: AppBar(title: Text("LabTob layOut")),

      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 3.2,
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(border),
                ),
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text("User Name"),
                      accountEmail: Text("User Email"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width / 3.2,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(border),
                      color: Colors.white,
                    ),
                    child: Center(child: Text("task $index")),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.blueGrey),
                width: MediaQuery.sizeOf(context).width / 3.3,
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(border),
                    ),
                    width: MediaQuery.sizeOf(context).width / 3,
                    child: ListTile(title: Text("todo $index")),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
