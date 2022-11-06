class HttpCustomExceptions implements Exception {
  final String message;
  final String prefix;

  HttpCustomExceptions(this.message, this.prefix);
}

class BadRequestException extends HttpCustomExceptions {
  BadRequestException(String message) : super(message, "Requisição inválida");
}

class UnauthorizedException extends HttpCustomExceptions {
  UnauthorizedException(String message) : super(message, "Não autorizado");
}

class InvalidEmailException extends HttpCustomExceptions {
  InvalidEmailException(String message) : super(message, "Email inválido");
}

class FetchDataException extends HttpCustomExceptions {
  FetchDataException(String message)
      : super(message, "Comunicação mal sucedida");
}
