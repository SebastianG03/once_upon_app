import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Encryption {
  static late encrypt.IV iv;
  final String encryptionKey = dotenv.env['ENCRYPTION_KEY']!;
  static late encrypt.Encrypter encrypter;

  Encryption() {
    iv = encrypt.IV.fromUtf8(encryptionKey);
    encrypter = encrypt.Encrypter(encrypt.AES(encrypt.Key.fromUtf8(encryptionKey), mode: encrypt.AESMode.ctr, padding: null));
  }

  String encryptAES(String text) => encrypter.encrypt(text, iv: iv).base64;

  String decryptAES(String encrypted) {
    final Uint8List encryptedBytesWithSalt = base64.decode(encrypted);
    final Uint8List encryptedBytes = encryptedBytesWithSalt.sublist(
      0,
      encryptedBytesWithSalt.length,
    );
    final String decrypted =
    encrypter.decrypt64(base64.encode(encryptedBytes), iv: iv);
    return decrypted;
  }
}