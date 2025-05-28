// lib/core/utils/encryption_helper.dart

import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:gbk_codec/gbk_codec.dart';

class EncryptionHelper {
  /// MD5로 문자열 암호화
  static String md5Encrypt(String input) {
    try {
      final bytes = gbk_bytes.encode(input); // GBK/GB2312 인코딩
      final digest = md5.convert(bytes);
      return digest.toString().toUpperCase();
    } catch (e) {
      throw Exception('MD5 암호화 실패: $e');
    }
  }

  /// int 값을 4바이트 배열로 변환 (빅 엔디안)
  static Uint8List intToBytes(int value) {
    final bytes = Uint8List(4);
    bytes[0] = (value >> 24) & 0xFF;
    bytes[1] = (value >> 16) & 0xFF;
    bytes[2] = (value >> 8) & 0xFF; // 상위 8비트
    bytes[3] = value & 0xFF; // 하위 비트
    return bytes;
  }

  /// 바이트 배열을 int로 변환 (빅 엔디안)
  static int bytesToInt(Uint8List src) {
    if (src.length < 4) {
      throw Exception('바이트 배열의 길이가 4보다 작습니다.');
    }

    return ((src[0] & 0xFF) << 24) |
        ((src[1] & 0xFF) << 16) |
        ((src[2] & 0xFF) << 8) |
        (src[3] & 0xFF);
  }

  String prettyJson(dynamic response) {
    final map = {
      'Status': response.status,
      'Fun': response.fun,
      'TimeStamp': response.timeStamp,
      // 'DataType': response.dataType,
      'Sign': response.sign,
      ...response.extra,
    };
    return const JsonEncoder.withIndent('  ').convert(map);
  }

  String prettySendJson(dynamic response) {
    final map = {
      'Fun': response.fun,
      'TimeStamp': response.timeStamp,
      'DataType': response.dataType,
      'Sign': response.sign,
    };
    return const JsonEncoder.withIndent('  ').convert(map);
  }
}
