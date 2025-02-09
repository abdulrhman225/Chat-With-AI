part of 'ai_controller_bloc.dart';

@immutable
sealed class AiControllerState {}

final class AiControllerInitial extends AiControllerState {
}

final class RefreshState extends AiControllerState{}

final class AiControllerResponseMessage extends AiControllerState{
   List<String> responses;
   List<String> messages;

  AiControllerResponseMessage({required this.responses , required this.messages });
}
