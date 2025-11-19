import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomSnackBar {
  static void showSuccessSnackBar(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      snackBarPosition: SnackBarPosition.top,
      displayDuration: const Duration(seconds: 3),
      _SuccessSnackBarWidget(
        message: message,
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    showTopSnackBar(
      animationDuration: const Duration(milliseconds: 300),
      snackBarPosition: SnackBarPosition.top,
      Overlay.of(context),
      _ErrorSnackBarWidget(
        message: message,
      ),
    );
  }
}

class _SuccessSnackBarWidget extends StatelessWidget {
  final String message;

  const _SuccessSnackBarWidget({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorSnackBarWidget extends StatelessWidget {
  final String message;

  const _ErrorSnackBarWidget({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}