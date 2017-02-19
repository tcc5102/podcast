class Podcast < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  before_save :format_day

  def format_day
    if days
      days.capitalize
    end

  end
end
