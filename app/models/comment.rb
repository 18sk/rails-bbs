class Comment < ApplicationRecord
  belongs_to :board

  def display_created_time
    created_at.in_time_zone('Tokyo').strftime("%Y-%m-%d %H:%M:%S")
  end
end
