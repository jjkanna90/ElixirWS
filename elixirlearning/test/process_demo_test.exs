defmodule ProcessDemoTest do
  import ProcessDemo
  use ExUnit.Case

  test "createProcessTest" do
    func = fn -> IO.puts("My first process") end
    createProcess(func)
  end

  test "SenderReceiver" do
    rpid = startReceiverProcess()

    openCommLink(rpid)
    sendMessage(rpid,"Funny you")
    sendMessage(rpid,"are sleeping")
    sendMessage(rpid,"while typing this")
    closeCommLink(rpid)
    IO.puts("Waiting for receiver to end")
    Process.sleep(6000)


  end

  test "Process Linking with Trap exit" do
    processLinkingWithTrapExit()
  end

end
