defmodule StateDemoTest do

  use ExUnit.Case

  setup do
    StateDemo.startReceiver();
  :ok
  end

  test "testing the state maintainer" do
    send(:statemaintainer,{:put,:mykey,"Hello"})
    send(:statemaintainer,{:get,:mykey,self()})
    receive do
      {:ok,val} -> assert val == "Hello"
    end
  end



end