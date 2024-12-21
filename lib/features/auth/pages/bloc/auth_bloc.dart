import 'package:bsc_app/features/auth/logic/remote_auth.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_event.dart';
import 'package:bsc_app/features/auth/pages/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
final rmoteAuth=RemoteAuth();

  UserBloc():super(UserInitial()){
    on<LoginEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await rmoteAuth.login(event.email, event.password);
        emit(UserLoaded(user: user));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });
    on<RegisterEvent>((event, emit) async {
      emit(UserLoading());
      try {
        print('Trying');
        final user = await rmoteAuth.register(event.user);
        emit(UserLoaded(user: user));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });
    on<LogoutEvent>((event, emit) async {
      emit(UserInitial());
    });
    
  } 


    }
