import 'dart:typed_data';

class PrintResponseData {
  String? fun;
  String? status;
  String? timeStamp;
  String? sign;
  Map<String, dynamic> extra;

  /// ✅ 응답 원본 바이트
  Uint8List? rawBytes;

  PrintResponseData({
    this.fun,
    this.status,
    this.timeStamp,
    this.sign,
    this.extra = const {},
    this.rawBytes,
  });

  factory PrintResponseData.fromJson(Map<String, dynamic> json, {Uint8List? rawBytes}) {
    return PrintResponseData(
      fun: json['Fun'],
      status: json['Status'],
      timeStamp: json['TimeStamp'],
      sign: json['Sign'],
      extra: Map.from(json)
        ..removeWhere((k, _) => ['Fun', 'Status', 'TimeStamp', 'Sign'].contains(k)),
      rawBytes: rawBytes,
    );
  }

  // factory PrintResponseData.fromJson(Map<String, dynamic> json) {
  //   return PrintResponseData(
  //     fun: json['Fun'],
  //     status: json['Status'],
  //     timeStamp: json['TimeStamp'],
  //     sign: json['Sign'],
  //     extra: Map.from(json)
  //       ..removeWhere((k, _) => ['Fun', 'Status', 'TimeStamp', 'Sign'].contains(k)),
  //   );
  // }
}
