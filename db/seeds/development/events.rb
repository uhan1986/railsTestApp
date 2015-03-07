
random = Random.new

group_ids = %w{1 12 28}

titles = %w(tests_event event_development wheelerEvent)


3.times do |n|
	for m in (1..10) do 
		start_date_since = (m * 6)
		end_date_since = ((m * 6) + (n * 10))
		limit_date_since = (start_date_since + end_date_since) / 2
		h = {group_id: group_ids[n],
			title: titles[m % 3] + random.rand(1..2000).to_s,
			summary: "this is Event name: " + titles[m % 3] + random.rand(10000.293183).to_s,
			start_date: start_date_since.days.since,
			end_date: start_date_since.days.since + end_date_since.minutes,
			absence_limit: limit_date_since.days.ago,
			location: "susp"}
		p start_date_since
		p start_date_since.days.since
		p 0.days.since
		p h

		c = Event.create!(
			group_id: group_ids[n],
			title: titles[m % 3] + random.rand(1..2000).to_s,
			summary: "this is Event name: " + titles[m % 3] + random.rand(10000.293183).to_s,
			start_date: start_date_since.days.since,
			end_date: end_date_since.days.since,
			absence_limit: limit_date_since.days.since,
			location: "susp"
		)
	end
end

#      t.references :group, null: false              # 外部キー グループ
#      t.string :title, null:false                      # イベントタイトル
#      t.string :summary                                # イベント詳細
#      t.timestamp :start_date                          # イベント開始日時
#      t.timestamp :end_date                            # イベント終了日時
#      t.timestamp :absence_limit                       # 出欠登録期限
#      t.string :location                               # イベント場所