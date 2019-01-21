json.extract! comment, :id, :username, :email, :body, :rate, :status, :created_at, :updated_at
json.url comment_url(comment, format: :json)
