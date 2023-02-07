# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GithubHandleReposJob, type: :job do
  describe '#perform_later' do
    it 'search projects by username and persists' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        described_class.perform_later('username')
      end.to have_enqueued_job
    end
  end
end
