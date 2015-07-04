class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_account, null: false              # グループアカウント名
      t.string :group_name, null: false                 # グループ名(表示名)
      #t.string :email, null: false                      # グループEメール
      #t.string :hashed_password                         # パスワード
      t.text :description                               # グループ名説明
      t.boolean :deleted, null: false, default: false   # 削除フラグ
      t.boolean :suspended, null: false, default: false   # 停止フラグ
      t.timestamps null: false
    end

    add_index :groups, :group_account, unique: true
    #add_index :groups, :email, unique: true
  end
end
