# frozen_string_literal: true

# == Schema Information
#
# Table name: stations
#
#  id         :bigint           not null, primary key
#  kana_name  :string           not null
#  kanji_name :string           not null
#
class Station < ApplicationRecord
  validates :kana_name, presence: true
  validates :kanji_name, presence: true
  validates :kanji_name, uniqueness: true

  def self.search(word)
    where('kanji_name LIKE :word OR
      kana_name LIKE :word', word: "%#{word}%")
  end
end
