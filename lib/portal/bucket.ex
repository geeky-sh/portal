defmodule Portal.Bucket do
  use Agent

  def start_link(fruit) do
    Agent.start_link(fn -> %{} end, name: fruit)
  end

  def push(fruit, item) do
    Agent.update(fruit, fn map -> Map.merge(item, map) end)
  end

  def get(fruit) do
    Agent.get(fruit, fn map -> map end)
  end

  def delete_all(fruit) do
    Agent.update(fruit, fn _ -> %{} end)
  end
end
