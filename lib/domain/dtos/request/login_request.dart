
import 'package:data_class_plugin/data_class_plugin.dart';

@DataClass()
class LoginRequest {
    String get email;
    String get password;  
}