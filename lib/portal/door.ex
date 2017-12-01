defmodule Portal.Door do
  use Agent
  @doc """
  create a door of the specified color
  """
  def start_link(color) do
    Agent.start_link(fn -> [] end, name: color)
  end

  @doc """
  get all the items in the dooor
  """
  def get(door) do
    Agent.get(door, fn list -> list end)
  end

  @doc """
  push new items in the door
  """
  def push(door, item) do
    Agent.update(door, fn list -> [item | list] end)
  end

  @doc """
  pop last items from the door
  and update the door
  """
  def pop(door) do
    Agent.get_and_update(door, fn
      [] -> {:error, []}
      [h | t] -> {{:ok, h}, t}
    end)
  end

  def delete_all(door) do
    case pop(door) do
      {:ok, _} -> delete_all(door)
      _ -> :ok
    end
  end
end
