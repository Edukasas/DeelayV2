import 'dart:convert';
import 'dart:typed_data';

class Base64Helper {
  static Uint8List? decodeBase64Icon(String base64String) {
    try {
      base64String = base64String.replaceAll(RegExp(r'\s+'), '');

      if (!RegExp(r'^[A-Za-z0-9+/=]+$').hasMatch(base64String)) {
        print('Invalid Base64 string: $base64String');
        return null;
      }

      while (base64String.length % 4 != 0) {
        base64String += '=';
      }

      final decodedBytes = base64Decode(base64String);
      return decodedBytes;
    } catch (e) {
      print('Error decoding Base64 icon: $e');
      return null;
    }
  }
}
