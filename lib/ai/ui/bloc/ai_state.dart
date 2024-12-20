
import 'package:bsc_app/ai/logic/model/resModel.dart';

abstract class MessagesState {}

class MessagesInitial extends MessagesState {}

class MessagesLoading extends MessagesState {
  final List<Message> messages;
  MessagesLoading(this.messages);
}

class MessagesLoaded extends MessagesState {
  final List<Message> messages;
  MessagesLoaded(this.messages);
}

class MessagesError extends MessagesState {
  final String error;
  MessagesError(this.error);
}

