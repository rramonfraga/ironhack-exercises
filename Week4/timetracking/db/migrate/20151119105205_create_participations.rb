class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :person, index: true
      t.references :project, index: true
      
      t.timestamps null: false
    end
  end
end
