import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bearish_state.dart';

class BearishCubit extends Cubit<BearishInitial> {
  BearishCubit() : super(const BearishInitial(counter: 0));

  void increment() => emit(BearishInitial(counter: state.counter! + 1));

  void decrement() => emit(BearishInitial(counter: state.counter! - 1));
  void zero() => emit(const BearishInitial(counter: 0));
}
