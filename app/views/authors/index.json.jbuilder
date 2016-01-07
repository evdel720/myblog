json.array!(@authors) do |author|
  json.extract! author, :id, :author, :email
  json.url author_url(author, format: :json)
end
