

class AppExceptions implements Exception {
  final String message;

const AppExceptions({
  this.message = 'error'
});


@override
  String toString() => message;
}


class FetchDataException extends AppExceptions {
  const FetchDataException({super.message = 'Error During Communication'});
}