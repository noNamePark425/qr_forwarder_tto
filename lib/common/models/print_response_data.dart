class PrintResponseData {
  final String status;
  final String fun;
  final String timeStamp;
  final String sign;
  final String dataType;
  final Map<String, dynamic> extra;

  PrintResponseData({
    required this.status,
    required this.fun,
    required this.timeStamp,
    required this.sign,
    required this.dataType,
    this.extra = const {},
  });

  factory PrintResponseData.fromJson(Map<String, dynamic> json) {
    final extra = Map<String, dynamic>.from(json)
      ..remove('Status')
      ..remove('Fun')
      ..remove('TimeStamp')
      ..remove('Sign')
      ..remove('DataType');
    return PrintResponseData(
      status: json['Status'] ?? '',
      fun: json['Fun'] ?? '',
      timeStamp: json['TimeStamp'] ?? '',
      sign: json['Sign'] ?? '',
      dataType: json['DataType'] ?? '',
      extra: extra,
    );
  }
}
