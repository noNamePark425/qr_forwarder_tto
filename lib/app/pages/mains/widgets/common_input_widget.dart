import 'package:flutter/material.dart';

class CommonInputWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool? isPrinterConnected;

  const CommonInputWidget({
    super.key,
    required this.title,
    required this.controller,
    this.isPrinterConnected = true,
  });

  @override
  State<CommonInputWidget> createState() => _CommonInputWidgetState();
}

class _CommonInputWidgetState extends State<CommonInputWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            widget.title,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              border: Border.all(
                color: Colors.black26,
                width: 2.0,
              ),
            ),
            child: TextField(
              textAlign: TextAlign.start,
              controller: widget.controller,
              focusNode: _focusNode,
              decoration: const InputDecoration(
                labelText: '',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              enabled: (widget.isPrinterConnected),
              keyboardType: TextInputType.number,
            ),
          ),
        )
      ],
    );
  }
}
