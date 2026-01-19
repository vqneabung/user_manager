
import 'package:json_annotation/json_annotation.dart';

part 'ChatMessage.g.dart';

@JsonSerializable()
class ChatMessage {
  String id;
  String role;
  List<Part> parts;
  Map<String, dynamic> metadata;

  ChatMessage({
    required this.id,
    required this.role,
    required this.parts,
    required this.metadata,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
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