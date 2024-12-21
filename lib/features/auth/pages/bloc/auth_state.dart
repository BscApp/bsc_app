import 'package:bsc_app/features/auth/model/user.dart';

sealed class UserState{}
class UserInitial extends UserState{}
class UserLoading extends UserState{}
class UserLoaded extends UserState{
  final User user;
  UserLoaded({required this.user});
}
class UserError extends UserState{
  final String message;
  UserError({required this.message});
}
