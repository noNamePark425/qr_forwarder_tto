import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const CommonButtonWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48.0,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
