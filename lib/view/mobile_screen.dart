import 'package:flutter/material.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double border = MediaQuery.sizeOf(context).width / 20;
    return Scaffold(
      appBar: AppBar(title: Text("Mobile layOut")),
      drawer: Drawer(),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
    );
  }
}
