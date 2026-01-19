class ChatMessage {
  final String id;
  final String role;
  final String text;

  ChatMessage({
    required this.id,
    required this.role,
    required this.text,
  });

  /// Convert từ JSON object
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] as String,
      role: json['role'] as String,
      text: json['text'] as String,
    );
  }

  /// Convert thành JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
      'text': text,
    };
  }

  @override
  String toString() {
    return 'Message(id: $id, role: $role, text: $text)';
  }
}
