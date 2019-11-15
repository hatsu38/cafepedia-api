class Comment < ApplicationRecord
  belongs_to :shop

  with_options presence: true do
    validates :name
    validates :content
  end
end
