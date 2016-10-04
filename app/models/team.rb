# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  code          :string
#  name          :string
#  nickname      :string
#  image_url     :string
#  promo_gif_url :string
#  league_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Team < ApplicationRecord
  belongs_to :league

  validates :code, presence: true
  validates :name, presence: true  
end
