import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black.withAlpha(62),
        ),
        child: Scaffold(
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Text(message),
            ),
          ),
        ),
      ),
    );
  }
}
