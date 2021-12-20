class CreatePlayerAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :player_albums do |t|

      t.timestamps
    end
  end
end
