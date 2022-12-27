import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageLine extends StatelessWidget {
  final String? sender;
  final String? text;
  final Timestamp? time;

  final bool isMe;
  const MessageLine({this.sender, this.text, this.time, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            "$sender",
            style: TextStyle(fontSize: 15, color: Colors.black45),
          ),
          Material(
              borderRadius: isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))
                  : BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
              color: isMe
                  ? Color.fromARGB(255, 99, 0, 221)
                  : Color.fromRGBO(234, 236, 242, 100),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '$text',
                  style: TextStyle(
                    fontSize: 15,
                    color: isMe ? Colors.white : Colors.black,
                  ),
                ),
              )),
          //Text(time)
        ],
      ),
    );
  }
}
