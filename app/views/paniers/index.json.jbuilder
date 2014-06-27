json.array!(@paniers) do |panier|
  json.extract! panier, :id, :semaine, :coute
  json.url panier_url(panier, format: :json)
end
