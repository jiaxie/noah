class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string   "title"
      t.integer  "deck_id"
      t.string   "content"
      t.datetime "created_at",     :null => false
      t.datetime "updated_at",     :null => false
    end
  end
end
