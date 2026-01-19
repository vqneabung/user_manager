import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:user_manager/domain/dtos/request/chat/chatbot_message.dart';

part 'chat_client.g.dart';

@RestApi()
abstract class ChatClient {
  factory ChatClient(Dio dio, {String baseUrl}) = _ChatClient;


  @POST('/messages')
  Future<String> sendMessage(@Body() List<ChatbotMessage> message);
}