import 'package:flutter/foundation.dart';

class ApiConstants {
  static const String authBaseUrl = kIsWeb ? "http://localhost:5117/api/auth/" : "http://10.0.2.2:5117/api/auth/";
  static const String storeBaseUrl = kIsWeb ? "https://localhost:5176/api" : "http://10.0.2.2:5176/api";
  static const String chatBaseUrl = kIsWeb ? "http://localhost:3000/chatbot" : "http://10.0.2.2:3000/chatbot";
}