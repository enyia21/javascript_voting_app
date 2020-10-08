class CreateSuperheros < ActiveRecord::Migration[6.0]
  def change
    create_table :superheros do |t|
      t.string :name
      t.string :gender
      t.string :power_level
      t.string :alias
      t.string :place_of_birth
      t.string :publisher
      t.string :alignment
      t.string :team_affliation

      t.timestamps
    end
  end
end
