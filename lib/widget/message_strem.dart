import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/widget/message_line.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageStrem extends StatelessWidget {
  const MessageStrem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return 
       StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('messages')
            .orderBy('time')
            .snapshots(),
        builder: (context, snapshot) {
          List<MessageLine> messageWidgets = [];
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final messages = snapshot.data!.docs.reversed;
          for (var message in messages) {
            final messagrText = message.get('text');
            final messagrSender = message.get('sender');
            final messagrTime = message.get('time');

            final currentUser =
                Provider.of<AuthProvider>(context, listen: false)
                    .loggedAppUser!
                    .fname;
            if (currentUser == messagrSender) {}
            final messageWidget = MessageLine(
              sender: messagrSender,
              text: messagrText,
              time: messagrTime,
              isMe: currentUser == messagrSender,
            );
            messageWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageWidgets,
            ),
          );
        },
      );
    });
  }
}
