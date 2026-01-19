import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:user_manager/chatbot/lib/chat/chat.dart';
import 'package:user_manager/chatbot/lib/models/chat_options.dart';
import 'package:user_manager/chatbot/lib/models/chat_message.dart';
import 'package:user_manager/chatbot/lib/transport/default_chat_transport.dart';
import 'package:user_manager/chatbot/lib/utils/id_generator.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => ChatbotState();
}

class ChatbotState extends State<Chatbot> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> messages = [
    ChatMessage(
      text: "Chào bạn! Tôi có thể giúp gì cho bạn hôm nay?",
      role: "assistant",
      id: IdGenerator.generate(),
    ),
    ChatMessage(
      text: "Tôi muốn biết thêm về sản phẩm của bạn.",
      role: "user",
      id: IdGenerator.generate(),
    ),
  ];

  final chat = Chat(
    transport: DefaultChatTransport(
      api: "http://localhost:3000/chatbot/messages",
    ),
    options: ChatOptions(id: "chatbot"),
  );

  @override
  void initState() {
    super.initState();
    chat.messagesStream.listen((messages) {
      try {
        for (var message in messages) {
          setState(() {
            this.messages.add(
              ChatMessage(
                id: message.id,
                role: message.role.name,
                text: message.parts[1].props[1].toString(),
              ),
            );
          });
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error processing latest message: $e');
        }
      }
    });
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messageController.clear();
    });
    chat.sendMessage(_messageController.text);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chatbot"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              reverse: true,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Nhập tin nhắn...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    maxLines: null,
                    minLines: 1,
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  mini: true,
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.role == "user"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: message.role == "user" ? Colors.blue[400] : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.role == "user" ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
