import gleam/erlang/file
import gleam/result
import gleam/string
import gleam/list

pub type LexContext {
  LexContext(file_path: String, source_code: List(String))
}

pub type TokenKind {
  Syntax
  Integer
  Identifier
}

pub type Token {
  Token(value: String, kind: TokenKind, location: Int, lc: LexContext)
}

fn eat_whitespace(source: List(String), location: Int) -> Int {
  source
  |> list.fold_until(
    location,
    fn(local, char) {
      case string.is_empty(char) {
        True -> list.Continue(local + 1)
        False -> list.Stop(local)
      }
    },
  )
}

pub fn lex(lc: LexContext) -> List(Token) {

 
}

pub fn new(file_path: String) -> LexContext {
  let source =
    file.read(file_path)
    |> result.unwrap("__ERR__")

  case source {
    "__ERR__" -> panic
    _ -> LexContext(file_path, string.split(source, ""))
  }
}
