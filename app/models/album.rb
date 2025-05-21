# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
  has_many :album_players, dependent: :destroy

  validates_presence_of :name
end
