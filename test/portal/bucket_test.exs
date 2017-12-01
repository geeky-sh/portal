defmodule Portal.BucketTest do
  use ExUnit.Case, async: true

  setup do
    assert Portal.Bucket.delete_all(:apples)
  end

  test "get values from list" do
    assert Portal.Bucket.get(:apples) == %{}
  end

  test "push kvs into the list and check" do
    Portal.Bucket.push(:apples, %{"aash" => "dhariya"})

    assert Map.has_key?(Portal.Bucket.get(:apples), "aash")
  end
end
