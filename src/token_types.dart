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
}

Map<TokenType, String> token_matches = {
  TokenType.INT: "0123456789",
  TokenType.FLOAT: "0123456789.",
  TokenType.STRING: "\"",

  TokenType.PLUS: "+",
  TokenType.SUB: "-",
  TokenType.DIV: "/",
  TokenType.MUL: "*",
  TokenType.MOD: "%",

  TokenType.LPAREN: "(",
  TokenType.RPAREN: ")",
};