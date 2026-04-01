import 'dart:io';
import 'package:logging/logging.dart';

Logger initFileLogger(String name) {
  hierarchicalLoggingEnabled = true;

  final logger = Logger(name);
  final now = DateTime.now();



  return logger;
}
