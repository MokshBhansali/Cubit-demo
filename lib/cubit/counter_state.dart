part of 'counter_cubit.dart';

// @immutable
// abstract class CounterState {}

class CounterState {
  CounterState({@required this.counterValue,this.wasIncremented});
  int counterValue;
  bool wasIncremented;
}
