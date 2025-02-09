import 'package:chat_with_ai/controller/ai_controller_bloc.dart';
import 'package:chat_with_ai/view/widget/chat_widget.dart';
import 'package:chat_with_ai/view/widget/init_widget.dart';
import 'package:chat_with_ai/view/widget/loading_widget.dart';
import 'package:chat_with_ai/view/widget/text_input_widget.dart';
import 'package:chat_with_ai/view/widget/write_and_send_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController askTextEditingController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Chat With AI",
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: BlocBuilder<AiControllerBloc, AiControllerState>(
          builder: (context, state) {
        if (state is AiControllerResponseMessage) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return ChatWidget(response: state.responses[index] , message: state.messages[index]);
              },
              itemCount: state.messages.length);
        }
        else if (state is RefreshState) {
          return LoadingWidget();
        }
        else {
          return InitWidget();
        }
      }),
      bottomNavigationBar: WriteAndSendWidget(askTextEditingController: askTextEditingController)
    );
  }
}
