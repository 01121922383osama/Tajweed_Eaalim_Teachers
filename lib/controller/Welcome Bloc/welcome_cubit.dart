import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(const WelcomeInitial());
  void updateWelcomeState(int newIndex) {
    emit(WelcomeInitial(index: newIndex));
  }
}
