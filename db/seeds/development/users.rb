accounts = %w(tests development wheeler)
names = %w(テスト 開発 出席管理)
email_domains = %w(example.com dev.example.co.jp wheeler.net)
permit = 0


3.times do |n|
	10.times do |m|
		g_acc = "#{accounts[n]}#{m}"
		name = "#{names[n]}#{m}"
		email = "#{g_acc}@#{email_domains[n]}"
		description = "description\ndescription"
		del =  (m % 3 == 0)
		susp = (m % 5 == 0)

#		c = Group.create!(
#			account: g_acc
#			name: name
#			email: email
#			hashed_password: row_pass
#			permit_level: 100
#			group:
#			deleted: del
#			suspended: susp
#		)
	end
end


#      t.string  :account, null: false                  # アカウント名
#      t.string  :name                                  # 名前
#      t.string  :email, null: false                    # Eメール
#      t.string  :hashed_password                       # パスワード
#      t.integer :permit_level, null: false             # 権限レベル
#      t.references :group, null: false                 # 外部キー グループ
#      t.boolean :deleted, null: false, default: false  # 削除フラグ
#      t.boolean :suspended, null:false, default: false # 停止フラグ
#      t.timestamps null: false