defmodule ListDemoTest do

  use ExUnit.Case
  doctest ListDemo

  test "extraction Header" do
    assert 1 == ListDemo.extractHead([1,2,3])
    assert 1 == ListDemo.extractHeadByPatternMatch([1,2,3,4])
  end

  test "extraction Tail" do
    assert [2,3] == ListDemo.extractTail([1,2,3])
    assert [2,3,4] == ListDemo.extractTailByPatternMatch([1,2,3,4])
  end

  test "OtherListFunctions" do
    #Deletion from a list
    # can use the Elixir.List module

    assert [1,3,4] == List.delete([1,2,3,4],2)

    #to delete at a specific index
    assert [1,3,4] == List.delete_at([1,2,3,4],1)

  end
end