# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

table_names = %w(groups users events)

table_names.each do |t_name|
	path = Rails.root.join('db', 'seeds', Rails.env, "#{t_name}.rb")
	if File.exists?(path)
		puts "Creating #{t_name}"
		puts path
		require (path)
	end
end