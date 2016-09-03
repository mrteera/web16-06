json.extract! allquotation, :id, :quote, :author, :categories_id, :created_at, :updated_at
json.url allquotation_url(allquotation, format: :json)