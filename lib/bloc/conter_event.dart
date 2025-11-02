// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ConterEvent {}

class PutNumberByTextField extends ConterEvent {
  String newNumber;
  PutNumberByTextField({required this.newNumber});
}

class Increment extends ConterEvent {}

class Decrement extends ConterEvent {}

class Reset extends ConterEvent {}
