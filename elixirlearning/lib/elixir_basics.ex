defmodule ElixirBasics do
  @moduledoc false

  def basic() do
     a=10
     b=20
     IO.puts("Sum is #{a+b}");

  end

  def ifConditionOneLine(val) do
    #if (val<50, [{do: {:ok,:fail}},{else: {:ok, :pass}}])
    if val<50, do: {:ok,:fail},else: {:ok, :pass}
  end

  def ifConditionDoEndConv(val) do
    if val<50 do
      {:ok,:fail}
    else
      {:ok, :pass}
    end
  end

  def unlessConditionDoEndConv(val) do
    unless val<50 do
      {:ok,:fail}
    else
      {:ok, :pass}
    end
  end

  def caseBlockDemo(tup) do
    # case block can execute statements based on value of variables.
    case tup do
      {:add, val1, val2} -> {:ok,val1+val2}
      {:sub, val1, val2} -> {:ok,val1-val2}
      {:div,val1,val2} when val2>0 -> {:ok,val1/val2}
      {:div,val1,0} -> {:error, "Cant divide by 0"}
      _ -> {:error,"invalid params"}

    end
  end


  def condBlockDemo(val) do
    # case block can execute statements based on value of variables.
    cond do
      val<=10 -> {:ok,:nobrain}
      val<=20 -> {:ok,:mudbrain}
      val<=50 -> {:ok,:acceptable}
      val<=100 -> {:ok,:good}
      val==100 -> {:ok,:nothuman}
      true -> {:error,:invalid}
    end
  end

end
