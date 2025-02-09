import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  String response;
  String message;

  ChatWidget({required this.response, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 200,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade800,
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 300,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade800,
              ),
              child: Text(
                response,
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
