defmodule UncaloteMe.AppContext do
  @moduledoc """
  The AppContext context.
  """

  import Ecto.Query, warn: false
  alias UncaloteMe.Repo

  alias UncaloteMe.AppContext.Debtor

  @doc """
  Returns the list of debtors.

  ## Examples

      iex> list_debtors()
      [%Debtor{}, ...]

  """
  def list_debtors do
    Repo.all(Debtor)
  end

  @doc """
  Gets a single debtor.

  Raises `Ecto.NoResultsError` if the Debtor does not exist.

  ## Examples

      iex> get_debtor!(123)
      %Debtor{}

      iex> get_debtor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_debtor!(id), do: Repo.get!(Debtor, id)

  @doc """
  Creates a debtor.

  ## Examples

      iex> create_debtor(%{field: value})
      {:ok, %Debtor{}}

      iex> create_debtor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_debtor(attrs \\ %{}) do
    %Debtor{}
    |> Debtor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a debtor.

  ## Examples

      iex> update_debtor(debtor, %{field: new_value})
      {:ok, %Debtor{}}

      iex> update_debtor(debtor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_debtor(%Debtor{} = debtor, attrs) do
    debtor
    |> Debtor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Debtor.

  ## Examples

      iex> delete_debtor(debtor)
      {:ok, %Debtor{}}

      iex> delete_debtor(debtor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_debtor(%Debtor{} = debtor) do
    Repo.delete(debtor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking debtor changes.

  ## Examples

      iex> change_debtor(debtor)
      %Ecto.Changeset{source: %Debtor{}}

  """
  def change_debtor(%Debtor{} = debtor) do
    Debtor.changeset(debtor, %{})
  end

  alias UncaloteMe.AppContext.Debt

  @doc """
  Returns the list of debts.

  ## Examples

      iex> list_debts()
      [%Debt{}, ...]

  """
  def list_debts(debtor_id) do
    # Repo.all from d in Debt, preload: [:debtor]
    query = from d in Debt, where: d.debtor_id == ^debtor_id
    Repo.all(query)
  end

  @doc """
  Gets a single debt.

  Raises `Ecto.NoResultsError` if the Debt does not exist.

  ## Examples

      iex> get_debt!(123)
      %Debt{}

      iex> get_debt!(456)
      ** (Ecto.NoResultsError)

  """
  def get_debt!(id), do: Repo.get!(Debt, id)

  @doc """
  Creates a debt.

  ## Examples

      iex> create_debt(%{field: value})
      {:ok, %Debt{}}

      iex> create_debt(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_debt(attrs \\ %{}) do
    %Debt{}
    |> Debt.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a debt.

  ## Examples

      iex> update_debt(debt, %{field: new_value})
      {:ok, %Debt{}}

      iex> update_debt(debt, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_debt(%Debt{} = debt, attrs) do
    debt
    |> Debt.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Debt.

  ## Examples

      iex> delete_debt(debt)
      {:ok, %Debt{}}

      iex> delete_debt(debt)
      {:error, %Ecto.Changeset{}}

  """
  def delete_debt(%Debt{} = debt) do
    Repo.delete(debt)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking debt changes.

  ## Examples

      iex> change_debt(debt)
      %Ecto.Changeset{source: %Debt{}}

  """
  def change_debt(%Debt{} = debt) do
    Debt.changeset(debt, %{})
  end
end
