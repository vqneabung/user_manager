import 'package:injectable/injectable.dart';
import 'package:user_manager/domain/dtos/request/chat/chatbot_message.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/repositories/chat_repository.dart';


abstract class ChatService {
  Future<BaseResponse<String>> sendMessage(List<ChatbotMessage> message);
}

@LazySingleton(as: ChatService)
class ChatServiceImpl implements ChatService {
  final ChatRepository chatRepository;

  ChatServiceImpl({required this.chatRepository});

  @override
  Future<BaseResponse<String>> sendMessage(List<ChatbotMessage> message) async {
    return await chatRepository.sendMessage(message);
  }
}