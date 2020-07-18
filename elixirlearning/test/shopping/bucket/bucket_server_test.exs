defmodule Shopping.Bucket.BucketServerTest do
  @moduledoc false


  use ExUnit.Case
  alias Shopping.Bucket.BucketServer


  setup do

    {:ok,bucket} = BucketServer.start_link("mybucket")
    %{:bucket => bucket}
  end

  test "test insert and retrieval", %{:bucket => bucket} do

    BucketServer.addItem(bucket,:test,"myval")
    assert BucketServer.getItem(bucket,:test) == "myval"

  end


  test "test get and delete", %{:bucket => bucket} do

    BucketServer.addItem(bucket,:test2,"myval2")
    assert BucketServer.getItem(bucket,:test2) == "myval2"
    deletedItem = BucketServer.deleteItem(bucket,:test2)
    assert deletedItem == "myval2"
    assert BucketServer.getItem(bucket,:test2) == nil

  end

end
