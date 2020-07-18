defmodule FuncDemo do
  @moduledoc false

  def createAnonymousFuncForConcat do
    fn
      (a,b) ->
      if(is_list(a) && is_list(b)) do
        a++b
      else
        []
      end
    end
  end


  #Write a function that takes three arguments. If the first two are zero, return
  #“FizzBuzz”. If the first is zero, return “Fizz”. If the second is zero return “Buzz”.
  #Otherwise return the third argument. Do not use if, else or case blocks


  def createAnonymousFuncWithArgChecking do
    fn
      (0,0,_) -> IO.puts("FizzBuss")
                 "FizzBuzz"
      (0,_,_) -> "Fizz"
      (_,0,_) -> "Buzz"
      (_,_,a) -> a
    end
  end


  def createChainingFunction do
    fn
      (s) -> fn
               (a) -> s <> " " <> a
             end
    end
  end


  #Write a function which calculates the sum of integers from 1 to 10

  def sumofintegers(n) do
    findsum(n);
  end

  defp findsum(n) when n==0 do
    0
  end
  defp findsum(n) do
    n+findsum(n-1)
   end

  #function to find gcd. Algebrarically gcd(x,y) is x if y is 0 otherwise its gcd(y,rem(x,y))

  def gcd(x,y) do
    findgcd(x,y)
  end
  defp findgcd(x,0) do
    x
  end
  defp findgcd(x,y) do
    findgcd(y,rem(x,y))
  end



  # the order in which the functions are defined matters in this case
  # cause if 2 functions have the same name and signature initailly the arguments will be pattern matched and then the guards will be checked
  def print(0), do: true
  def print(a) when is_integer(a), do: false


  #order of guards matter too
  def testgrade(grade) when grade>50, do: :pass
  def testgrade(grade) when grade>0, do: :fail










end
