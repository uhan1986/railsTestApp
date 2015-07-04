
accounts = %w(tests development wheeler)
names = %w(テスト 開発 出席管理)
email_domains = %w(example.com dev.example.co.jp wheeler.net)
row_pass = 'password'
permit = 0


3.times do |n|
	10.times do |m|
		g_acc = "#{accounts[n]}#{m}"
		name = "#{names[n]}#{m}"
		email = "#{g_acc}@#{email_domains[n]}"
		description = "description\ndescription"
		del =  (m % 3 == 0)
		susp = (m % 5 == 0)

		c = Group.create!(
			group_account: g_acc,
			group_name: name,
			description: description,
			deleted: del,
			suspended: susp
		)
	end
end
