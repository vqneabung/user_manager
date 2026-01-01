import 'package:flutter/foundation.dart';

class ApiConstants {
  static const String authBaseUrl = kIsWeb ? "http://localhost:5117/api/auth/" : "http://10.0.2.2:5117/api/auth/";
}