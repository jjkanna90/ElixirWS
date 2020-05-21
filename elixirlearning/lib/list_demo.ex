defmodule ListDemo do
  @moduledoc false

  def extractHead(inplist) do
    hd(inplist)
  end

  def extractHeadByPatternMatch([head|tail]) do
    head
  end

  def extractTailByPatternMatch([head|tail]) do
    tail
  end

  def extractTail(inplist) do
    tl(inplist)
  end



end
