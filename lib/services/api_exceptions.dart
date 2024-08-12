class ApiExceptions implements Exception {
  final String? _message;
  final String? _prefix;

  ApiExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ApiExceptions {
  FetchDataException([message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends ApiExceptions {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ApiExceptions {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class ApiNotFoundException extends ApiExceptions {
  ApiNotFoundException([message]) : super(message, "API not accessible: ");
}

class InvalidInputException extends ApiExceptions {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}