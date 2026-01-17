import 'package:user_manager/constaints/api_constants.dart';

class Url {
  static String storeUrl(String endpoint) {
    return '${ApiConstants.storeBaseUrl}/$endpoint';
  }
}
