class Position {
  int index = -1;
  int line = 1;
  int column = 0;

  void advance(String? current_char) {
    index++;
    column++;
    if (current_char == "\n") {
      line++;
      column = 1;
    }
  }

  String toString() => "[$line,$column]";
}