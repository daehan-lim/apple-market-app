import 'dart:developer';

/// Logs an error (e.g., exception + stack trace) to local console
void logError(dynamic error, StackTrace stack, {String? reason}) {
  final message =
      reason != null ? '[EXCEPTION] $reason\n$error' : '[EXCEPTION] $error';
  log(message, stackTrace: stack);
}
