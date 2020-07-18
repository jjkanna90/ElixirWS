defmodule ListDemo do
  @moduledoc false

  def extractHead(inplist) do
    hd(inplist)
  end

  def extractHeadByPatternMatch([head|_tail]) do
    head
  end

  def extractTailByPatternMatch([_head|tail]) do
    tail
  end

  def extractTail(inplist) do
    tl(inplist)
  end

  def findMax(inpList) do
        getMax(inpList,hd(inpList))
  end
  defp getMax([],currmax) do
    #IO.puts("Am hit")
    currmax
  end
  defp getMax([head|tail],currmax) when currmax <= head do
    #IO.puts("Am hit1")
    getMax(tail,head)
  end
  defp getMax([head|tail],currmax) when currmax > head do
    #IO.puts("Am hit2")
    getMax(tail,currmax)
  end



end
