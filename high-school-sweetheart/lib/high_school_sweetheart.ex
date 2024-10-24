defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name) |> String.at(0)
  end

  def initial(name) do
    first_letter(name) |> String.upcase() |> Kernel.<>(".")
  end

  def initials(full_name) do
    full_name_list = String.split(full_name, " ")
    initial(full_name_list |> Enum.at(0)) <> " " <> initial(full_name_list |> Enum.at(1))
  end

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
