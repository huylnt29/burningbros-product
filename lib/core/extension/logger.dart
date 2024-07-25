// ignore_for_file: avoid_print, unused_field

import 'dart:io';

import 'package:intl/intl.dart';

enum LogLevel { verbose, debug, info, warning, error }

class Logger {
  Logger._internal();
  static final red = Platform.isAndroid ? '\u001b[31m' : '';
  static final green = Platform.isAndroid ? '\u001b[32m' : '';
  static final yellow = Platform.isAndroid ? '\u001b[33m' : '';
  static final blue = Platform.isAndroid ? '\u001b[34m' : '';
  static final magenta = Platform.isAndroid ? '\u001b[35m' : '';
  static final cyan = Platform.isAndroid ? '\u001b[36m' : '';
  static final reset = Platform.isAndroid ? '\u001b[0m' : '';

  static final _formatLogTime = DateFormat('yyyy-MM-dd hh:mm:ss');

  static void _log(String level, Object? object) =>
      print('[${_formatLogTime.format(DateTime.now())}] $level $object');

  static void v(Object? object) => _log('$yellow[Verbose]$reset', object);

  static void d(Object? object) => _log('$cyan[Debug]$reset', object);

  static void i(Object? object) => _log('$blue[Info]$reset', object);

  static void w(Object? object) => _log('$magenta[Warning]$reset', object);

  static void e(
    dynamic message, {
    bool trackCrash = false,
    StackTrace? stackTrace,
    dynamic reason,
    Iterable<Object> information = const [],
    bool? printDetails,
    bool fatal = false,
  }) {
    _log('$red[Error]$reset', message);
  }

  static void custom(String color, Object object) => _log(color, object);
  static void withYellow(Object object) => custom(yellow, object);
  static void withGreen(Object object) => custom(green, object);
}
