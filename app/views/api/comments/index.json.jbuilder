# frozen_string_literal: true

json.set! :comments do
  json.array! @comments do |comment|
    json.extract! comment,
      :id,
      :name,
      :content,
      :is_complete,
      :created_at
  end
end
