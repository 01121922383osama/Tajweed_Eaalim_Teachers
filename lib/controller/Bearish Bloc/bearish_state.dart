part of 'bearish_cubit.dart';

@immutable
sealed class BearishState {
  final int? counter;
  const BearishState({this.counter});
}

class BearishInitial extends BearishState {
  const BearishInitial({super.counter});
}
