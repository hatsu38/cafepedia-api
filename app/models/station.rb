# frozen_string_literal: true

class Station < ApplicationRecord
  validates :kana_name, presence: true
  validates :kanji_name, presence: true
  validates :kanji_name, uniqueness: true

  def self.search(word)
    where('kanji_name LIKE :word OR
      kana_name LIKE :word', word: "%#{word}%")
  end
end
