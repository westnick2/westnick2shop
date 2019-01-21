class Stuff < ApplicationRecord
  include PgSearch
  has_many :comments
  accepts_nested_attributes_for :comments
  acts_as_taggable_on :tags

  pg_search_scope :search_by_title, :against => :title

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :short_description, presence: true, length: { maximum: 120 }

  def to_param
    slug
  end
end
