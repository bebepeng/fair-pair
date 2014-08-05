class Repo < ActiveRecord::Base
  belongs_to :user
  validates :owner, :presence => true
  validates :name, :presence => true
end