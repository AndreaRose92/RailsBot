class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :content
      t.string :notes
      t.belongs_to :user

      t.timestamps
    end
  end
end
