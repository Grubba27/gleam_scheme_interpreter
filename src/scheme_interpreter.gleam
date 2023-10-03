import gleam/io
import gleam/string
import lexer/lexer
import gleam/erlang/os

pub fn main() {
  let assert Ok(file_path) = os.get_env("FILE_PATH")
  let l = lexer.new(file_path)

  "Reading: "
  |> string.append(l.file_path)
  |> io.println

  "file content: "
  |> string.append(l.source_code)
  |> io.println
}
