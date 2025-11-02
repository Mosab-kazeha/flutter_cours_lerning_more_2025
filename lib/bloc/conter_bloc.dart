import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc/bloc/conter_event.dart';
import 'package:intro_to_bloc/bloc/conter_state.dart';

class ConterBloc extends Bloc<ConterEvent, ConterState> {
  int conter = 0;
  ConterBloc() : super(InsalState()) {
    on<Increment>((event, emit) {
      conter++;
      emit(ChangeConter());
    });
    on<Decrement>((event, emit) {
      conter--;
      emit(ChangeConter());
    });
    on<PutNumberByTextField>((event, emit) {
      if (event.newNumber.isNotEmpty || int.tryParse(event.newNumber) != null) {
        conter = int.parse(event.newNumber);
        emit(ChangeConter());
      } else {
        conter = 0;
        emit(ConterError());
      }
    });
  }
}
