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
require 'test_helper'

class AlbumPlayerTest < ActiveSupport::TestCase
  test "valid album" do
    album_player = AlbumPlayer.new(player: players(:shakira), album: albums(:fixation))
    assert album_player.valid?
  end

  test "presence of player" do
    album_player = AlbumPlayer.new
    assert_not album_player.valid?
    assert_not_empty album_player.errors[:player]
  end

   test "presence of album" do
    album_player = AlbumPlayer.new
    assert_not album_player.valid?
    assert_not_empty album_player.errors[:player]
  end
end
