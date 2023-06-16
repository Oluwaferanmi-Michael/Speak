

import 'package:speak/core/util/extensions/ext.dart';

class AppException implements Exception {
  final String message;
  AppException({
    required this.message,
  });

  void log() => message.log();

  @override
  toString() => message;
}


class FetchDataException extends AppException{
  FetchDataException({
    message
  }) : super(
      message: 'Error During Communication'
      );
}



