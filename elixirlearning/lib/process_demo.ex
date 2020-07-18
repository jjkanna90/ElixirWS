defmodule ProcessDemo do
  @moduledoc false


  #In actual scenarios Processes are considered low level. So dont use them directly. Use Task, Agents and GenServer instead.



  def createProcess(functiondef) do
    pid = spawn functiondef
    IO.puts("spawned process #{inspect(pid)}")
    alive=Process.alive?(pid)
    IO.puts("Sub Process #{inspect(pid)} is alive ? #{alive}")
    IO.puts("Current process #{inspect(self())} is alive? #{Process.alive?(self())}")
  end



  def startReceiverProcess() do
    spawn_link &receiveComms/0
  end
  defp receiveComms() do
    receive do
      {:open,pid} -> IO.puts("Connection opened for process #{inspect(pid)}")
                              receiveComms();
      {:comm,pid,message} -> IO.puts("Message from #{inspect(pid)} : #{message}")
                             receiveComms();
      {:close,pid} -> IO.puts("Closing connection for process #{inspect(pid)}")
                               receiveComms();
    after
      5000 -> IO.puts("Receiver #{inspect(self())} timedout closing listener...")
    end
  end


  def openCommLink(rpid) do
    send rpid,{:open,self()}
  end
  def sendMessage(rpid,message) do
    send rpid,{:comm,self(),message}
  end
  def closeCommLink(rpid) do
    send rpid,{:close,self()}
  end


  def processLinkingWithTrapExit() do
    #Tell current process that we want to trap exits
    Process.flag(:trap_exit, true)
    npid = spawn_link( fn-> Process.sleep(1000)
                            raise("Exception raised by child") end)

    #to trap exits of child process the exception in the parent process
    #exceptions are received as process message tuples
    receive do
      {:EXIT,pid,:normal} -> IO.puts("#{inspect(npid)} process exited normally")
      {:EXIT,pid,message} -> IO.puts("#{inspect(npid)} process exited abnormally with #{inspect(message)}")
    end

    Process.sleep(3000);
    IO.puts("Done")
  end




end
