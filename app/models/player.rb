# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Player < ApplicationRecord
  has_many :album_players, dependent: :destroy

  validates_presence_of :name
end
