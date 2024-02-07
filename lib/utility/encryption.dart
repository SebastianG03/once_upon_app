
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/foundation.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Encryption {
  static late encrypt.IV _iv;
  final String _encryptionKey = dotenv.env['ENCRYPTION_KEY']!;
  late encrypt.Key _key;
  static late encrypt.Encrypter encrypter;

  Encryption() {
    _key = encrypt.Key.fromUtf8(_encryptionKey);
    _iv = encrypt.IV.fromLength(16);
    encrypter = encrypt.Encrypter(encrypt.AES(_key));
  }



  String encryptAES(String text) {
    var encrypted = encrypter.encrypt(text, iv: _iv).base64;
    if (kDebugMode) print(encrypted);
    return encrypted;
  }

  String decryptAES(String encrypted) {
    var decrypted = encrypter.decrypt(encrypt.Encrypted.fromBase64(encrypted), iv: _iv);
    if (kDebugMode) print(decrypted);
    return decrypted;
  }
}