class CreateAlbumsPlayers < ActiveRecord::Migration[5.2]
  def up
    create_table :album_players do |t|
      t.references :player, foreign_key: true
      t.references :albums, foreign_key: true

      t.timestamps
    end

    # Se for muito dados o ideal e colocar um find and batch
    # https://api.rubyonrails.org/classes/ActiveRecord/Batches.html
    Album.all.each do |album|
      AlbumPlayer.create(album_id:album.id, player_id: album.player_id)
    end
  end

  def down
    drop_table :taggables
  end
end
