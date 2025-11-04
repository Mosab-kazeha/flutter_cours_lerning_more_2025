import 'package:bloc_secion/bloc/lamp_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/lamp_bloc.dart';
import '../bloc/lamp_state.dart';

class LampScreen extends StatelessWidget {
  const LampScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            child: Icon(Icons.sunny),
            onPressed: () {
              if (context.read<LampBloc>().state is LampOn) {
              } else {
                context.read<LampBloc>().add(TrunLampOn());
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: Icon(Icons.more_time_outlined),
              onPressed: () {
                context.read<LampBloc>().add(ChangeTheLamp());
              },
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              context.read<LampBloc>().add(TrunLampOff());
            },
          ),
        ],
      ),
      body: Center(
        child: BlocListener<LampBloc, LampState>(
          listener: (context, state) {
            if (state is LampBroke) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("the lamp is broken")));
            }
          },
          child: BlocBuilder<LampBloc, LampState>(
            builder: (context, state) {
              if (state is LampOn) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: state.lampOnColor,
                  ),
                );
              } else if (state is LampOff) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: state.lampOffColor,
                  ),
                );
              } else if (state is LampBroke) {
                return InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state.lampBrokenColor,
                    ),
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
