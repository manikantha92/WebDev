defmodule Calc do
  # read the expression from input string and pass it evaluate
  # first the elements of string are added to a list and then
  # operators and operands are seperated into seperate stacks
  # expression is converted into a postfix expression and then
  # evaluated to obtain the value of the given expression.

  def main do
    IO.gets("> ")
    |> String.split("")
    |> Enum.filter(fn s -> s != "\n" && s != "" && s != " " end)
    |> arrangeExp("", [])
    |> eval([], [])
    |> toPostFix()
    |> IO.puts()

    main()
  end

  # converting the input strings into a list of  expression based on the
  # operators and operands in the same order as they are received
  def eval(ls, operandStack, operatorStack) do
    if ls == [] do
      endEval(operandStack, operatorStack)
    else
      [head | tail] = ls

      cond do
        isInteger(head) ->
          # pushing the operand (integers) onto the operand stack
          eval(tail, [head | operandStack], operatorStack)

        isOperator(head) ->
          # popping operators with high precedence ('','*') from operatorStack
          evalOperator([head | tail], operandStack, operatorStack)

        head == "(" ->
          # pushing the open paranthesis to the operatorStack
          eval(tail, operandStack, [head | operatorStack])

        head == ")" ->
          # poppping the operators from operandStack
          evalParenthesis(tail, operandStack, operatorStack)

        true ->
          raise "Invalid symbol"
      end
    end
  end

  # function to return the top element of the stack
  def stackTop(stack) do
    case stack do
      [] -> nil
      [top | _] -> top
      _ -> raise "No elements in stack"
    end
  end

  # below function will do the mathematical operations
  def calculate(operator, operand1, operand2) do
    {num1, _} = Integer.parse(operand1)
    {num2, _} = Integer.parse(operand2)

    case operator do
      "+" -> (num1 + num2) |> Kernel.inspect()
      "-" -> (num1 - num2) |> Kernel.inspect()
      "*" -> (num1 * num2) |> Kernel.inspect()
      "/" -> div(num1, num2) |> Kernel.inspect()
      _ -> raise "Invalid operator"
    end
  end

  # Re-arrange the list of strings received from the input in the form of an
  # expresssion to evaluate
  def arrangeExp(ls, tempList, outputList) do
    if ls == [] do
      case tempList do
        "" -> outputList
        _ -> outputList ++ [tempList]
      end
    else
      [head | tail] = ls

      cond do
        (isOperator(head) || head == ")" || head == "(" || head == " ") && tempList == "" ->
          arrangeExp(tail, "", outputList ++ [head])

        isOperator(head) || head == ")" || head == "(" || head == " " ->
          arrangeExp(tail, "", outputList ++ [tempList, head])

        true ->
          arrangeExp(tail, tempList <> head, outputList)
      end
    end
  end

  # helper function to be called when an operator is encountered
  defp evalOperator(ls, operandStack, operatorStack) do
    [operator | ls] = ls
    top = stackTop(operatorStack)

    cond do
      # if empty operatorStack or top has a left parenthesis
      top == nil || top == "(" ->
        eval(ls, operandStack, [operator | operatorStack])

      # popping the operators having a higher precedence
      checkPrecedence(operator, top) < 0 ->
        [top | operatorStack] = operatorStack
        evalOperator([operator | ls], [top | operandStack], operatorStack)

      # pushing the operators with higher prcedence into the operatorStack
      true ->
        eval(ls, operandStack, [operator | operatorStack])
    end
  end

  # helper function to solve when a left paranthesis is encountered
  defp evalParenthesis(ls, operandStack, operatorStack) do
    [head | operatorStack] = operatorStack

    if head != "(" do
      evalParenthesis(ls, [head | operandStack], operatorStack)
    else
      eval(ls, operandStack, operatorStack)
    end
  end

  # converts the expression obtained from eval into a post fix expression
  defp toPostFix(expression) do
    expression = Enum.reverse(expression)
    evalPostFixExp(expression, [])
  end

  # evaluates the actual post fix expresssion to give the final result
  def evalPostFixExp(expression, stack) do
    if expression == [] do
      case stack do
        [head | _] -> head
        [] -> "0"
      end
    else
      [head | expression] = expression

      if isOperator(head) do
        [operand2 | [operand1 | stack]] = stack
        stack = [calculate(head, operand1, operand2) | stack]
        evalPostFixExp(expression, stack)
      else
        evalPostFixExp(expression, [head | stack])
      end
    end
  end

  # returns precedence of current operators with map
  defp operatorPrecedence do
    %{"+" => 0, "-" => 0, "*" => 1, "/" => 1}
  end

  # function to compare the precedence of the two operators
  def checkPrecedence(operator1, operator2) do
    precedence = operatorPrecedence()
    precedence[operator1] - precedence[operator2]
  end

  # helper function when there are no more operators left
  defp endEval(operandStack, operatorStack) do
    if operatorStack == [] do
      operandStack
    else
      [operator | operatorStack] = operatorStack

      case operator do
        "(" -> raise "Extra parenthesis"
        ")" -> raise "Extra paranthesis"
        _ -> endEval([operator | operandStack], operatorStack)
      end
    end
  end

  # function to check if the passed operand is an integer
  def isInteger(operand) do
    intValue = Integer.parse(operand)

    case intValue do
      {_, _} -> true
      _ -> false
    end
  end

  # function to check if the passed operator is an operator
  def isOperator(operator) do
    operatorPrecedence() |> Map.has_key?(operator)
  end
end
