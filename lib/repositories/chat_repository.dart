import 'package:injectable/injectable.dart';
import 'package:user_manager/domain/dtos/request/chat/chatbot_message.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/network/chat/chat_client.dart';

abstract class ChatRepository{
    Future<BaseResponse<String>> sendMessage(List<ChatbotMessage> message);
}

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository{
  final ChatClient chatClient;

  ChatRepositoryImpl({required this.chatClient});

  @override
  Future<BaseResponse<String>> sendMessage(List<ChatbotMessage> message) async {
    try {
      var response = await chatClient.sendMessage(message);
      return BaseResponse(success: true, data: response, errors: null);
    } catch (e) {
      return BaseResponse(success: false, data: null, errors: e.toString());
    }
  }
}