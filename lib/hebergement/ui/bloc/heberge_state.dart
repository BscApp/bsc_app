import 'package:bsc_app/hebergement/logic/models/heberge.dart';

sealed class HebergeState {}
class HebergeStateInitial extends HebergeState {}
class HebergeStateLoading extends HebergeState {}
class HebergeStateSuccess extends HebergeState {
  final List<Heberge> heberges;
  HebergeStateSuccess(this.heberges);
}
class HebergeStateError extends HebergeState {
  final String message;
  HebergeStateError(this.message);
}
