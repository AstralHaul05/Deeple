enum TokenType {
  INT,
  FLOAT,
  STRING,

  PLUS,
  SUB,
  DIV,
  MUL,
  MOD,

  LPAREN,
  RPAREN,
  LCURLY,
  RCURLY,
  LSQUARE,
  RSQUARE,

  EOF,
}

Map<String, TokenType> operator_matches = {
  "+": TokenType.PLUS,
  "-": TokenType.SUB,
  "/": TokenType.DIV,
  "*": TokenType.MUL,
  "%": TokenType.MOD,

  "(": TokenType.LPAREN,
  ")": TokenType.RPAREN,
  "{": TokenType.LCURLY,
  "}": TokenType.RCURLY,
  "[": TokenType.LSQUARE,
  "]": TokenType.RSQUARE,
};