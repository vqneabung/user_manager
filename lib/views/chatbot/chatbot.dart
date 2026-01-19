import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:user_manager/config/injection.dart';
import 'package:user_manager/domain/dtos/request/chat/chatbot_message.dart';
import 'package:user_manager/services/chat_service.dart';
import 'package:user_manager/utils/id_generated.dart';


class Chatbot extends StatefulWidget {
  const Chatbot({super.key});
  

  @override
  State<Chatbot> createState() => ChatbotState();
}

class ChatbotState extends State<Chatbot> {
  final _chatController = InMemoryChatController();
  final ChatService chatService = getIt<ChatService>();


  void _sendMessage(String text) async{
    // Gửi tin nhắn đến dịch vụ chatbot và nhận phản hồi
    var userMessage = ChatbotMessage(
      id: IdGenerator.generate(),
      role: 'user',
      parts: [Part(type: 'text', text: text)],
      metadata: {},
    );

    _chatController.insertMessage(
      TextMessage(
        id: userMessage.id,
        authorId: 'user',
        createdAt: DateTime.now().toUtc(),  
        text: text,
      ),
    );

    //Gui danh sach tin nhan den chatbot service
    var chatMessages = _chatController.messages.map((message) {
      return ChatbotMessage(
        id: message.id,
        role: message.authorId == 'user' ? 'user' : 'assistant',
        parts: [Part(type: 'text', text: (message as TextMessage).text)],
        metadata: {},
      );
    }).toList();

    var response = await chatService.sendMessage(chatMessages );

    if (response.success == true && response.data != null) {
      // Thêm tin nhắn phản hồi từ bot vào giao diện chat
      print('Phản hồi từ chatbot: ${response.data}');
      _chatController.insertMessage(
        TextMessage(
          id: IdGenerator.generate(),
          authorId: 'assistant',
          createdAt: DateTime.now().toUtc(),
          text: response.data!,
        ),
      );
    } else {
      // Xử lý lỗi nếu cần thiết
      print('Lỗi khi gửi tin nhắn đến chatbot: ${response.errors}');
    }
  }

  @override
  void initState() {
    super.initState();
    // Thêm tin nhắn chào mừng từ bot
    _chatController.insertMessage(
      TextMessage(
        id: IdGenerator.generate(),
        authorId: 'bot',
        createdAt: DateTime.now().toUtc(),
        text: 'Xin chào! Tôi có thể giúp gì cho bạn?',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chat(
        currentUserId: "user",
        chatController: _chatController,
        onMessageSend: (text) {
          _sendMessage(text);
        },
        resolveUser: (UserID id) async {
          return User(id: id, name: 'John Doe');
        },
      ),
    );
  }
}
