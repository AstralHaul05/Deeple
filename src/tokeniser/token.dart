import 'token_types.dart';

class Token {
  late TokenType type;
  dynamic value;

  Token(TokenType type, {dynamic value = null}) {
    this.type = type;
    this.value = value;
  }

  toString() => "${type.name}${this.value != null ? ': $value' : ''}";}