part of 'ai_controller_bloc.dart';

@immutable
sealed class AiControllerEvent {}

class sendMessageEvent extends AiControllerEvent{
  String message;

  sendMessageEvent({required this.message});
}

