
import 'package:bloc_secion/bloc/lamp_event.dart';
import 'package:bloc_secion/bloc/lamp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LampBloc extends Bloc<LampEvent, LampState> {
  LampBloc() : super(InialState()) {
    int timeTheLampUse = 0;
    on<TrunLampOn>((event, emit) {
      timeTheLampUse++;
      if (timeTheLampUse < 5) {
        emit(LampOn(lampOnColor: Colors.amber));
      } else {
        emit(LampBroke(lampBrokenColor: Colors.black));
      }
    });
    on<TrunLampOff>((event, emit) {
      timeTheLampUse++;
      if (timeTheLampUse < 5) {
        emit(LampOff(lampOffColor: Colors.grey));
      } else {
        emit(LampBroke(lampBrokenColor: Colors.black));
      }
    });
    on<ChangeTheLamp>((event, emit) {
      timeTheLampUse = 0;
      emit(LampOff(lampOffColor: Colors.white));
    });
  }
}
