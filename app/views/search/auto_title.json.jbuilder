

json.array! @stuff do |stuff|
  json.id stuff.id
  json.title stuff.title
end

json.extract! @stuff
