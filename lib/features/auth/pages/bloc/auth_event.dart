import 'package:bsc_app/features/auth/model/user.dart';

sealed class UserEvents {}

class LoginEvent extends UserEvents {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends UserEvents {
  final User user;
  RegisterEvent({required this.user});
}

class LogoutEvent extends UserEvents {}

class deleteAccount extends UserEvents {}

class updateUser extends UserEvents {
  final User user;
  updateUser({required this.user});
}
