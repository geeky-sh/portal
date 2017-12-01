defmodule Portal.DoorTest do
  use ExUnit.Case, async: true
  doctest Portal

  setup do
    Portal.Door.delete_all(:blue)
  end

  test "get values from the list" do
    assert Portal.Door.get(:blue) == []
  end

  test "store values in the list" do
    Portal.Door.push(:blue, 1)

    assert Portal.Door.get(:blue) == [1]

    Portal.Door.push(:blue, 3)

    assert Portal.Door.get(:blue) == [3, 1]
  end
end
