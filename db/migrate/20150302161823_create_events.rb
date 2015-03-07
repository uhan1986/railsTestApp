class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :group, null: false              # 外部キー グループ
      t.string :title, null:false                      # イベントタイトル
      t.string :summary                                # イベント詳細
      t.timestamp :start_date                          # イベント開始日時
      t.timestamp :end_date                            # イベント終了日時
      t.timestamp :absence_limit                       # 出欠登録期限
      t.string :location                               # イベント場所

      t.timestamps null: false
    end

    add_index :events, :group_id
    add_index :events, :absence_limit
    add_foreign_key :events, :groups
  end
end
