// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class LampState {}

class InialState extends LampState {}

class LampOn extends LampState {
  Color lampOnColor;
  LampOn({required this.lampOnColor});
}

class LampOff extends LampState {
  Color lampOffColor;
  LampOff({required this.lampOffColor});
}

class LampBroke extends LampState {
  Color lampBrokenColor;
  LampBroke({required this.lampBrokenColor});
}
