class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string   "name"
      t.integer  "user_id"
      t.datetime "created_at",     :null => false
      t.datetime "updated_at",     :null => false
    end
  end
end
