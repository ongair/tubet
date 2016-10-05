# == Schema Information
#
# Table name: leagues
#
#  id         :integer          not null, primary key
#  code       :string
#  name       :string
#  active     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class League < ApplicationRecord
  validates :code, presence: true
  validates :name, presence: true
end
