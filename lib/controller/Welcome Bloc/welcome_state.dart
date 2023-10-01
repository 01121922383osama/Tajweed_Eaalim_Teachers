part of 'welcome_cubit.dart';

@immutable
sealed class WelcomeState {
  final int index;
  const WelcomeState({this.index = 0});
}

final class WelcomeInitial extends WelcomeState {
  const WelcomeInitial({super.index});
}
