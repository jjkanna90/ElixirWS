defmodule FuncDemoTest do

  import FuncDemo
  use ExUnit.Case

  test "createAnonymousFuncForConcatTest" do

    myanon = createAnonymousFuncForConcat()
    assert(myanon.([1,2,3],[4,5,6]) == [1,2,3,4,5,6])
  end


  test "createAnonymousFuncWithArgCheckingTest" do
    myanon = createAnonymousFuncWithArgChecking()
    assert(myanon.(0,0,1) == "FizzBuzz")
  end


  test "createChainingFunctionTest" do
    prefix = createChainingFunction()
    withSalutation = prefix.("Mr").("Jegajeeth")
    assert(withSalutation == "Mr Jegajeeth")
  end


  test "gcdtest" do
    assert(5 == gcd(5,10))
    assert(8 == gcd(24,16))
    assert(1 == gcd(3,5))
  end

  test "printtest" do
    assert print(0)==true
  end

  test "testgradetest" do
    assert testgrade(70)==:pass
  end

end