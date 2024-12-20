

import 'package:bsc_app/ai/logic/repo/ai_repo.dart';
import 'package:bsc_app/ai/ui/bloc/ai_events.dart';
import 'package:bsc_app/ai/ui/bloc/ai_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bsc_app/ai/logic/model/resModel.dart';

class AiBloc extends Bloc<AiEvents, MessagesState> {
  final AiRepo _repo;

  AiBloc(this._repo) : super(MessagesInitial()) {
    // Handle when a prompt is sent
    on<PromptSentEvent>((event, emit) async {
      final List<Message> oldMessages = state is MessagesLoaded
          ? List.from((state as MessagesLoaded).messages)
          : []; // Retrieve previous messages
      oldMessages.add(Message(event.prompt,isAi: false));

      emit(MessagesLoading(oldMessages)); // Show loading state with existing messages

      try {
        // Fetch the AI response
        final res = await _repo.getResponse(event.prompt);
        final newMessages = List<Message>.from(oldMessages)..add(res);

        emit(MessagesLoaded(newMessages)); // Emit updated messages
      } catch (e) {
        emit(MessagesError("Failed to fetch AI response"));
      }
    });
  }
}

