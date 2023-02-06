# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Github::Users::Repos::Fetch, type: :model do
  subject { described_class }

  describe 'call' do
    context 'when passes username and request executed' do
      let(:username) { 'juuh42dias' }

      before do
        github_stub_request_success(username)
      end

      it 'call returns projects by username' do
        interactor = subject.call(username:)
        expect(interactor.projects).to match(JSON.parse(GITHUB_RESPONSE_SUCCESS))
      end
    end

    context 'when username is invalid or not exists' do
      let(:username) { 'invalid' }

      before do
        github_stub_request_fail(username)
      end

      it 'call returns failure' do
        interactor = subject.call(username:)
        expect(interactor.failure?).to be true
      end
    end
  end
end
