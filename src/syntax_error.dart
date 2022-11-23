import 'dart:io';

import 'position.dart';
import 'token_types.dart';

class SyntaxError implements Exception {
  String name = "SyntaxError";
  String? description;
  Position? position;

  SyntaxError({String? description = null, Position? position = null}) {
    this.description = description;
    this.position = position;
  }

  String toString(){
    String error_str = "$name";
  
    if (position != null) {
      error_str += " $position";
    }

    if (description != null) {
      error_str += ": $description";
    } 

    return error_str;
  }
}
