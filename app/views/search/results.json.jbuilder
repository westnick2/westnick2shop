
json.array! @res do |elem|
  json.id elem.id
  json.title elem.title
  json.preview_image elem.preview_image
  json.short_description elem.short_description
  json.old_price elem.old_price
  json.price elem.price
end

json.extract! @res
