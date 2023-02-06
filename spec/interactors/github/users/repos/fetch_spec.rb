# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Github::Users::Repos::Fetch, type: :model do
  subject { described_class }

  describe 'call' do
    context 'When passes username and request executed' do
      let(:username) { 'juuh42dias' }

      before do
        github_stub_request_success(username)
      end

      it 'call returns projects by username' do
        interactor = subject.call(username:)
        expect(interactor.projects).to match(JSON.parse(GITHUB_RESPONSE_SUCCESS))
      end
    end

    context 'When username is invalid or not exists' do
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

GITHUB_RESPONSE_SUCCESS ||= File.read("#{Rails.root.join}spec/support/fixtures/github_sucessful_response.json").freeze
GITHUB_RESPONSE_FAIL ||= {
  'message' => 'Not Found',
  'documentation_url' => 'https://docs.github.com/rest/reference/repos#list-repositories-for-a-user'
}.freeze

def github_stub_request_success(username)
  stub_request(:get, "https://api.github.com/users/#{username}/repos")
    .to_return(status: 200, body: GITHUB_RESPONSE_SUCCESS, headers: {})
end

def github_stub_request_fail(username)
  stub_request(:get, "https://api.github.com/users/#{username}/repos")
    .to_return(status: 404, body: GITHUB_RESPONSE_FAIL.to_json, headers: {})
end
