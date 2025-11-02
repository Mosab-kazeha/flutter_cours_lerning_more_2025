import 'package:flutter/material.dart';
import 'package:intro_to_bloc/state_mangment/conter_mangment.dart';

class ConterScreen extends StatefulWidget {
  const ConterScreen({super.key});

  @override
  State<ConterScreen> createState() => _ConterScreenState();
}

class _ConterScreenState extends State<ConterScreen> {
  ConterMangment conterMangment = ConterMangment();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '${conterMangment.conter}',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {});
                  conterMangment.increment();
                },
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  setState(() {});
                  conterMangment.decrement();
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  setState(() {});
                  conterMangment.reset();
                },
                icon: Icon(Icons.add_alert),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
