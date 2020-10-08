class ChangeSuperherosProperties < ActiveRecord::Migration[6.0]
  def change
    change_table :superheros do |t|
      t.rename :alias, :full_name
      t.string :image
    end
  end
end
