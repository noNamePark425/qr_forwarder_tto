class PrintData {
  final String fun;
  final String timeStamp;
  final String dataType;
  final String sign;
  // final List<List<PrintDataItem>> data;

  PrintData({
    required this.fun,
    required this.timeStamp,
    required this.dataType,
    required this.sign,
    // required this.data,
  });

  Map<String, dynamic> toJson() => {
        'Fun': fun,
        'TimeStamp': timeStamp,
        'Datatype': dataType,
        'Sign': sign,
        // 'Data': data.map((list) => list.map((item) => item.toJson()).toList()).toList(),
      };
}

class PrintDataItem {
  final String id;
  final String content;

  PrintDataItem({
    required this.id,
    required this.content,
  });

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Content': content,
      };
}

class SetPrintParameters {
  final String fun;
  final String timeStamp;
  final String dataType;
  final String sign;
  final List<PrintParameterCommand> command;

  SetPrintParameters({
    required this.fun,
    required this.timeStamp,
    required this.dataType,
    required this.sign,
    required this.command,
  });

  Map<String, dynamic> toJson() => {
        'Fun': fun,
        'TimeStamp': timeStamp,
        'Datatype': dataType,
        'Sign': sign,
        'Command': command.map((item) => item.toJson()).toList(),
      };
}

class PrintParameterCommand {
  final String method;
  final String value;

  PrintParameterCommand({
    required this.method,
    required this.value,
  });

  Map<String, dynamic> toJson() => {
        'Method': method,
        'Value': value,
      };
}
