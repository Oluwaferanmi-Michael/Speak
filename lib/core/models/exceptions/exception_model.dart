

class AppExceptions implements Exception {
  final String message;

const AppExceptions({
  this.message = 'error'
});


  String detail(dynamic value) => '$message : returned [$value]';

  @override
  String toString() => message;
}


class FetchDataException extends AppExceptions {
  const FetchDataException({super.message = 'Error During Communication'});
}

// 3--
class MultipleResponseValuesException extends AppExceptions{
  const MultipleResponseValuesException({super.message = 'Recieved More than one response for the request please select one'});
}

// 4--
class BadRequestException extends AppExceptions {
  const BadRequestException({super.message = 'error concerning api request'});
}

// 5--
class ServerException extends AppExceptions {
  const ServerException({super.message = 'Something seems wrong with the server'});
}