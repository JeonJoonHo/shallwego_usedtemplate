class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|

      t.belongs_to :user
      t.belongs_to :course

      t.timestamps
    end
  end
end