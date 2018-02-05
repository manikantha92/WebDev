defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  test "eval" do
    assert Calc.eval(["1", "+", "3", "*", "3", "+", "1"], [], []) ==
             ["+", "+", "1", "*", "3", "3", "1"]

    assert Calc.eval(["24", "/", "6", "+", "(", "5", "-", "4", ")"], [], []) ==
             ["+", "-", "4", "5", "/", "6", "24"]

    assert Calc.eval(["(", "8", "+", "9", "-", "3", ")"], [], []) == ["+", "-", "3", "9", "8"]
    assert Calc.eval(["(", "4", "/", "2", ")"], [], []) == ["/", "4", "2"]
    assert Calc.eval(["8", "-", "7"], [], []) == ["-", "8", "7"]
    assert Calc.eval(["1", "+", "2"], [], []) == ["+", "1", "2"]
    assert Calc.eval(["3", "*", "2"], [], []) == ["*", "3", "2"]
    assert Calc.eval(["20", "/", "4"], [], []) == ["/", "4", "20"]
    assert Calc.eval(["0"], [], []) == ["0"]
    assert Calc.eval([], [], []) == []
  end

  test "evalPostFixExp" do
    assert ["+", "-", "4", "5", "/", "6", "24"]
           |> Enum.reverse()
           |> Calc.evalPostFixExp([]) == "5"

    assert ["+", "+", "1", "*", "3", "3", "1"]
           |> Enum.reverse()
           |> Calc.evalPostFixExp([]) == "11"

    assert ["+", "8", "7"] |> Enum.reverse() |> Calc.evalPostFixExp([]) == "15"
    assert ["*", "5", "5"] |> Enum.reverse() |> Calc.evalPostFixExp([]) == "25"
    assert ["/", "2", "4"] |> Enum.reverse() |> Calc.evalPostFixExp([]) == "2"
  end

  def splitString(string) do
    string |> String.split("") |> Enum.filter(fn x -> x != "" && x != " " end)
  end

  test "arrangeExp" do
    inputString = "((((11)))) - (21 / 7) + 1 - (8/2) * 9 + 3 + 2"
    first = ["(", "(", "(", "(", "11", ")", ")", ")", ")", "-"]
    second = ["(", "21", "/", "7", ")", "+", "1", "-", "(", "8"]
    third = ["/", "2", ")", "*", "9", "+", "3", "+", "2"]
    output = first ++ second ++ third

    unformatted =
      with inputList <- splitString(inputString),
           act <- Calc.arrangeExp(inputList, "", []),
           do: act

    assert unformatted == output
  end

  test "stackTop" do
    assert Calc.stackTop([10, 12, 13]) == 10
    assert Calc.stackTop([]) == nil
  end

  test "checkPrecedence" do
    assert Calc.checkPrecedence("+", "+") == 0
    assert Calc.checkPrecedence("+", "-") == 0
    assert Calc.checkPrecedence("/", "+") > 0
    assert Calc.checkPrecedence("-", "*") < 0
  end

  test "isOperator" do
    assert Calc.isOperator("+") == true
    assert Calc.isOperator("-") == true
    assert Calc.isOperator("/") == true
    assert Calc.isOperator("*") == true
    assert Calc.isOperator(")") == false
    assert Calc.isOperator("(") == false
  end

  test "isInteger" do
    assert Calc.isInteger("0") == true
    assert Calc.isInteger("A") == false
    # truncates
    assert Calc.isInteger("2.0") == true
  end
end
