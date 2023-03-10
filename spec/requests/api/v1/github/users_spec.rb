# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Github::Users', type: :request do
  subject { described_class }

  describe 'POST /users' do
    let(:username) { 'juuh42dias' }

    it 'returns http partial content' do
      post '/api/v1/github/users', params: { username: }

      expect(response).to have_http_status(:partial_content)
    end

    it 'returns bad request' do
      post '/api/v1/github/users', params: { username: '' }

      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'GET /users/:username' do
    context 'when user exists in database' do
      let(:username) { 'juuh42dias' }

      it 'returns user with your username' do
        FactoryBot.create(:user, username:)
        get api_v1_github_user_path(username)

        expect(JSON.parse(response.body)['username']).to eq(username)
      end
    end

    context 'when user not exists' do
      let(:username) { 'testenilda' }

      it 'returns not found status' do
        get api_v1_github_user_path(username)

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
