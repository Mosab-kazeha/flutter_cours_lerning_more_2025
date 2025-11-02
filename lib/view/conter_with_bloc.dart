import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc/bloc/conter_bloc.dart';
import 'package:intro_to_bloc/bloc/conter_event.dart';
import 'package:intro_to_bloc/bloc/conter_state.dart';

class ConterWithBloc extends StatelessWidget {
  const ConterWithBloc({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              context.read<ConterBloc>().add(
                PutNumberByTextField(newNumber: value),
              );
            },
          ),
          Center(
            child: BlocBuilder<ConterBloc, ConterState>(
              builder: (context, state) {
                if (state is ChangeConter) {
                  return Text(
                    '${context.watch<ConterBloc>().conter}',

                    style: TextStyle(fontSize: 50),
                  );
                } else if (state is InsalState) {
                  return Text('0', style: TextStyle(fontSize: 50));
                } else if (state is ConterError) {
                  return Container(
                    width: 200,
                    height: 200,
                    color: Colors.amber,
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  // setState(() {});
                  // conterMangment.increment();
                  context.read<ConterBloc>().add(Increment());
                },
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  // setState(() {});
                  // conterMangment.decrement();
                  context.read<ConterBloc>().add(Decrement());
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  // setState(() {});
                  // conterMangment.reset();
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
