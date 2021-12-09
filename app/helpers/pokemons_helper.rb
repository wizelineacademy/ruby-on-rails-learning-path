module PokemonsHelper

  def clean_tag(title)
    title.gsub!('-', ' ')
    title.titleize
  end
end
