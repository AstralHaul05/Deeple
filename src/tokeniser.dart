import 'position.dart';
import 'syntax_error.dart';
import 'token.dart';
import 'token_types.dart';

class Tokeniser {
  String source = "";

  String? current_char;
  Position position = Position();

  Tokeniser(String source_code) {
    this.source = source_code;
    this.advance();
  }

  void advance() {
    this.position.advance(this.current_char);
    this.current_char = this.position.index < this.source.length ? this.source[position.index] : null;
  }

  List<Token> tokenise() {
    List<Token> tokens = [];
    while (this.current_char != null) {
      if (is_whitespace(this.current_char)) { 
        this.advance();
        continue;
      }

      if (is_op(this.current_char)){
        tokens.add(Token(operator_matches[this.current_char]!));
        this.advance();
        continue;
      }

      if ("0123456789.".contains(this.current_char!)) {
        tokens.add(make_number());
        continue;
      }   

      throw new SyntaxError(position: position, description: "Invalid character '$current_char' in source code.");
    }
    tokens.add(Token(TokenType.EOF));
    return tokens;
  }

  bool is_op(String? char) {
    if (char == null) {
      return false;
    }
    for(String key in operator_matches.keys){
      if (key.contains(this.current_char!)) {
          return true;
      }
    }
    return false;
  }

  Token make_number() {
    String number = "";
    int dots = 0;

    while (this.current_char != null && "0123456789.".contains(this.current_char!)) {
      number += this.current_char!;
      if (this.current_char == ".") {
        dots < 1 ? dots++ : throw new SyntaxError(position: position, description: "Too many decimal points in float literal.");
      }
      advance();
    }
    if (dots == 0) {
      return Token(TokenType.INT, value: number);
    }
    else {
      return Token(TokenType.FLOAT, value: number);
    }
  }
  
  bool is_whitespace(String? char) => char != null ? " \t".contains(char) : false;
}