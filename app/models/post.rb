# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true

class Post < ApplicationRecord
  has_rich_text :content
  validates :title, :content, presence: true
end
