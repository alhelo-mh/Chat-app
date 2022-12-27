import 'dart:developer';

import 'package:chat_app/widget/message_line.dart';
import 'package:chat_app/widget/message_strem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_app/helpers/firestore_helper.dart';
import 'package:chat_app/providers/auth_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseFirestore storage = FirebaseFirestore.instance;
  final messagecontroller = TextEditingController();

  String? message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 127,
        backgroundColor: const Color.fromRGBO(247, 248, 251, 100),
        elevation: 0.0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).updataImage();
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: const Color.fromRGBO(247, 248, 251, 100),
                child: Provider.of<AuthProvider>(context, listen: false)
                            .loggedAppUser ==
                        null
                    ? Image.network(
                        Provider.of<AuthProvider>(context, listen: false)
                            .loggedAppUser!
                            .imageUrl!,
                        width: 48,
                        height: 46,
                      )
                    : CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            const Color.fromRGBO(247, 248, 251, 100),
                      ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Provider.of<AuthProvider>(context, listen: false)
                      .loggedAppUser!
                      .fname!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Online',
                  style: TextStyle(color: Colors.green[200], fontSize: 14),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 73,
              height: 44,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(191, 196, 211, 100),
                  borderRadius: BorderRadius.only(
                    bottomLeft: (Radius.circular(20)),
                    topLeft: (Radius.circular(20)),
                  )),
              child: IconButton(
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false).signOut();
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MessageStrem(),
          Container(
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(color: Color.fromARGB(9, 0, 0, 0), width: 2),
            )),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: TextField(
                  controller: messagecontroller,
                  onChanged: (value) {
                    message = value;
                  },
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      label: Text('Write your message here..'),
                      border: InputBorder.none),
                )),
                TextButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('messages').add({
                        'text': message,
                        'sender':
                            Provider.of<AuthProvider>(context, listen: false)
                                .loggedAppUser!
                                .fname,
                        'time': FieldValue.serverTimestamp()
                      });
                      messagecontroller.clear();
                    },
                    child: const Icon(Icons.send,
                        size: 28, color: Color.fromARGB(255, 99, 0, 221)))
              ],
            ),
          )
        ],
      )),
    );
  }
}
