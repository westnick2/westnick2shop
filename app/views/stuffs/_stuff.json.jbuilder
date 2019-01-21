json.extract! stuff, :id, :title, :price, :short_description, :full_description, :preview_image, :in_stock, :slug, :created_at, :updated_at
json.url stuff_url(stuff, format: :json)
