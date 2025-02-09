import 'package:bloc/bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:meta/meta.dart';

part 'ai_controller_event.dart';

part 'ai_controller_state.dart';

class AiControllerBloc extends Bloc<AiControllerEvent, AiControllerState> {
  List<Content> messagesContent = [];
  List<String> messages = [];
  List<String> responses = [];

  AiControllerBloc() : super(AiControllerInitial()) {
    on<sendMessageEvent>(
      (event, emit) async {
        emit(RefreshState());
        await sendMessageToAi(message: event.message);
        emit(AiControllerResponseMessage(responses: responses , messages: messages));
      },
    );
  }

  sendMessageToAi({required String message}) async {
    messages.add(message);
    messagesContent.add(Content(parts: [Part.text(message)], role: 'user'));
    await Gemini.instance.chat(messagesContent).then(
      (event) {
        responses.add(event!.output.toString());
      },
    );
  }
}
