class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string     :instrument,  null: false, default: ""
      t.string     :music
      t.string     :artist
      t.text       :text,        null: false,default: nil
      t.references :user,        null: false, foreign_key: true 
      t.string     :video_top
      t.timestamps
    end
  end
end
