# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:projects).dependent(:destroy) }
  it { validate_uniqueness_of(:username) }
  it { validate_presence_of(:username) }
end
