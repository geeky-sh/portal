defmodule Portal do
  defstruct [:left, :right]

  @doc """
  creates a new portal door under supervisor
  """
  def shoot(color) do
    Supervisor.start_child(Portal.Supervisor, [color])
  end

  @doc """
  push elements from left portal to right portal
  """
  def push_right(portal) do
    case Portal.Door.pop(portal.left) do
      {:ok, item} -> Portal.Door.push(portal.right, item)
      _ -> :error
    end

    portal
  end

  @doc """
  inserts data in the left portal
  """
  def start_up(portal, data) do
    for item <- data do
      Portal.Door.push(portal.left, item)
    end

    %Portal{left: portal.left, right: portal.right}
  end
end
