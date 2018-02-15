defmodule MacroCompiler.Parser.MacroBlock do
  use Combine
  use Combine.Helpers

  alias MacroCompiler.Parser.SyntaxError

  alias MacroCompiler.Parser.DoCommand
  alias MacroCompiler.Parser.LogCommand
  alias MacroCompiler.Parser.CallCommand
  alias MacroCompiler.Parser.UndefCommand
  alias MacroCompiler.Parser.ScalarAssignmentCommand
  alias MacroCompiler.Parser.ArrayAssignmentCommand
  alias MacroCompiler.Parser.HashAssignmentCommand
  alias MacroCompiler.Parser.IncrementCommand
  alias MacroCompiler.Parser.DecrementCommand
  alias MacroCompiler.Parser.PauseCommand
  alias MacroCompiler.Parser.PushCommand
  alias MacroCompiler.Parser.PopCommand
  alias MacroCompiler.Parser.ShiftCommand
  alias MacroCompiler.Parser.UnshiftCommand

  def parser() do
    many(
      between(
        spaces(),
        choice([
          DoCommand.parser(),
          LogCommand.parser(),
          CallCommand.parser(),
          UndefCommand.parser(),
          ScalarAssignmentCommand.parser(),
          ArrayAssignmentCommand.parser(),
          HashAssignmentCommand.parser(),
          IncrementCommand.parser(),
          DecrementCommand.parser(),
          PauseCommand.parser(),
          PushCommand.parser(),
          PopCommand.parser(),
          ShiftCommand.parser(),
          UnshiftCommand.parser(),

          SyntaxError.raiseAtPosition(),
        ]),
        skip(newline())
      )
    )
  end
end