class Board < ApplicationRecord
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments

  attribute :is_deleted, :boolean, default: false
  validates :title, presence: true

  def display_created_time
    created_at.in_time_zone('Tokyo').strftime("%Y-%m-%d %H:%M:%S")
  end
end
