class Board < ApplicationRecord
  attribute :is_deleted, :boolean, default: false
  validates :title, :description, presence: true

  def display_created_time
    created_at.in_time_zone('Tokyo').strftime("%Y-%m-%d %H:%M:%S")
  end
end
