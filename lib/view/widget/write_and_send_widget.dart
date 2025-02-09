import 'package:chat_with_ai/view/widget/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/ai_controller_bloc.dart';

class WriteAndSendWidget extends StatelessWidget {
  TextEditingController askTextEditingController;

  WriteAndSendWidget({required this.askTextEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context)
            .viewInsets
            .bottom, // Adjust for keyboard height
      ),
      child: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextInputWidget(
                  hint: "",
                  label: "Ask Anything",
                  textEditingController: askTextEditingController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.green, width: 1.5),
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    onPressed: () {
                      context.read<AiControllerBloc>().add(sendMessageEvent(
                        message: askTextEditingController.text,
                      ));
                      askTextEditingController.text = "";
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.green,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
