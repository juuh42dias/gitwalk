# frozen_string_literal: true

class User < ApplicationRecord
  has_many :projects, dependent: :destroy

  validates :username, uniqueness: true
  validates :username, presence: true
end
