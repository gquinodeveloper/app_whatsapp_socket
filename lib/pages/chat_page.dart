import 'package:app_ui_whatsapp/models/message_model.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:app_ui_whatsapp/models/user_model.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

//https://ibkchatapp.herokuapp.com/#/
//https://api-chat-flutter.herokuapp.com/
class ChatPage extends StatefulWidget {
  final UserModel user;
  ChatPage({
    @required this.user,
  });

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  IO.Socket socket;
  GlobalKey<FormState> formKey;
  List<MessageModel> messages = [];

  FocusNode messageNode;
  ScrollController controller = ScrollController();
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    messageNode = FocusNode();
    initSocket();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (this.mounted) {
      return super.setState(fn);
    }
  }

  void initSocket() {
    try {
      socket = IO.io('https://ibkchatapp.herokuapp.com/#/', <String, dynamic>{
        "transports": ['websocket']
      });

      socket.onConnect((_) {
        print('connect');
        socket.emit('msg', 'test');
      });

      socket.emit("joinRoom", [widget.user.room, widget.user.name]);
      socket.on("sendMessage", (res) {
        MessageModel msg = (res is String)
            ? MessageModel(message: res, username: widget.user.name)
            : MessageModel(message: res[0], username: res[1]);

        if (msg.username == widget.user.name) return;

        setState(() {
          messages.add(msg);
          controller.animateTo(
            controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 100),
            curve: Curves.linear,
          );
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void sendMessage() {
    try {
      print(messageController.text);
      socket.emit("sendMessage", [
        messageController.text,
        widget.user.room,
        widget.user.name,
      ]);

      MessageModel msg = MessageModel(
        message: messageController.text,
        username: widget.user.name,
      );

      setState(() {
        messages.add(msg);

        controller.animateTo(
          controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 100),
          curve: Curves.linear,
        );
      });

      messageController.clear();
      messageNode.requestFocus();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(244, 244, 244, 1.0),
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.user.path),
            ),
            SizedBox(width: 10.0),
            Text(
              "${widget.user.name} ${widget.user.lastname}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: Text(
              "Sala ${widget.user.room}",
              style: TextStyle(
                color: Colors.blueAccent[400],
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 15.0)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backstar.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            //Messages
            Expanded(
              flex: 9,
              child: ListView.builder(
                controller: controller,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];

                  if (message.username == widget.user.name) {
                    return Bubble(
                      margin: BubbleEdges.only(top: 8),
                      alignment: Alignment.topRight,
                      radius: Radius.circular(8.0),
                      nip: BubbleNip.rightTop,
                      color: Color.fromRGBO(225, 255, 199, 1.0),
                      child: Text(
                        message.message,
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    );
                  }

                  return Bubble(
                    margin: BubbleEdges.only(top: 8),
                    alignment: Alignment.topLeft,
                    radius: Radius.circular(8.0),
                    nip: BubbleNip.leftTop,
                    //color: Color.fromRGBO(225, 255, 199, 1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.username,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 11.0, color: Colors.grey),
                        ),
                        Text(
                          message.message,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            //Footer Send
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 244, 244, 1.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 35.0,
                      color: Colors.blueAccent[400],
                    ),
                    Expanded(
                      child: Container(
                        height: 40.0,
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: messageController,
                            focusNode: messageNode,
                            /* onFieldSubmitted: (value) {
                              sendMessage();
                            }, */
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10.0),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: .4,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: .4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        sendMessage();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent[400],
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
