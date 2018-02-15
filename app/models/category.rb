class Category < ActiveRecord::Base
  has_many :article_categories
  has_many :articles, through: :article_categories
  validates :name, presence: true, length: {  minimum: 3, maximum: 25 }
  #Ensure that name is unique
  validates_uniqueness_of :name
end