class Building < ActiveRecord::Base

  has_many :user_buildings, dependent: :destroy
  has_many :users, through: :user_buildings

  has_many :votings, dependent: :destroy

end
