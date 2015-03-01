json.array!(@groups) do |group|
  json.extract! group, :id, :group_account, :group_name, :hashed_password, :description, :deleted, :suspended, :created_at, :updated_at
  json.url group_url(group, format: :json)
end
