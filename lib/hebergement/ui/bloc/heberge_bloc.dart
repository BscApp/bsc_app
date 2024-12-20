
import 'package:bsc_app/hebergement/logic/sourec/remote.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_event.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HebergeBloc extends Bloc<HebergeEvent,HebergeState> {
  final remote=Remote();
  HebergeBloc():super(HebergeStateInitial()){
    on<HebergesEventFetch>((event, emit) async {
      emit(HebergeStateLoading());
      try {
        final heberges = await Remote().getHeberge();
        emit(HebergeStateSuccess(heberges));
      } catch (e) {
        emit(HebergeStateError(e.toString()));
      }
    });
 on<HebergesEventFetchAvailable>((event, emit) async {
    emit(HebergeStateLoading());
    try {
      final heberges = await Remote().getAvailableHeberges(event.date);
      emit(HebergeStateSuccess(heberges));
    } catch (e) {
      emit(HebergeStateError(e.toString()));
    }
  });
  
  }

 }
