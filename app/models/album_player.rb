# == Schema Information
#
# Table name: album_players
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer
#  player_id  :integer
#
# Indexes
#
#  index_album_players_on_album_id   (album_id)
#  index_album_players_on_player_id  (player_id)
#
class AlbumPlayer < ApplicationRecord
  belongs_to :album
  belongs_to :player
end
