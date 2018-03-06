class User < ActiveRecord::Base
  has_and_belongs_to_many :tracks
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :genres
end