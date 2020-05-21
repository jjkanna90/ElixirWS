defmodule ElixirBasicsTest do
  use ExUnit.Case
  doctest ElixirBasics
  @moduledoc false

  test "basics invocation" do
    ElixirBasics.basic()
  end

  test "ifConditionOneLine test" do

    #pattern match
    {:ok,result} = ElixirBasics.ifConditionOneLine(40)
    assert result == :fail

    {:ok,result} = ElixirBasics.ifConditionOneLine(60)
    assert result == :pass
  end


  test "ifConditionDoEndConv test" do

    #pattern match
    {:ok,result} = ElixirBasics.ifConditionDoEndConv(40)
    assert result == :fail

    {:ok,result} = ElixirBasics.ifConditionDoEndConv(60)
    assert result == :pass
  end



  test "unlessConditionDoEndConv test" do

    #pattern match
    {:ok,result} = ElixirBasics.unlessConditionDoEndConv(40)
    assert result == :pass

    {:ok,result} = ElixirBasics.unlessConditionDoEndConv(60)
    assert result == :fail
  end


 test "caseBlockDemo test" do
   assert ElixirBasics.caseBlockDemo({:add,1,2}) == {:ok,3}
   assert ElixirBasics.caseBlockDemo({:sub,1,2}) == {:ok,-1}
   assert ElixirBasics.caseBlockDemo({:div,4,2}) == {:ok,2}
   assert ElixirBasics.caseBlockDemo({:div,4,0}) == {:error,"Cant divide by 0"}
   assert ElixirBasics.caseBlockDemo({:xyz,1,2}) == {:error,"invalid params"}
  end

  test "condBlockDemo test" do
    assert ElixirBasics.condBlockDemo(10) == {:ok,:nobrain}
    assert ElixirBasics.condBlockDemo(40) == {:ok,:acceptable}
  end

end
