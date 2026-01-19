
import 'package:json_annotation/json_annotation.dart';

part 'chatbot_message.g.dart';

@JsonSerializable()
class ChatbotMessage {
  String id;
  String role;
  List<Part> parts;
  Map<String, dynamic> metadata;

  ChatbotMessage({
    required this.id,
    required this.role,
    required this.parts,
    required this.metadata,
  });

  factory ChatbotMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatbotMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatbotMessageToJson(this);
}

class Part {
  String type;
  String text;

  Part({
    required this.type,
    required this.text,
  });

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      type: json['type'] as String,
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'text': text,
    };
  }
}