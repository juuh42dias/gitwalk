# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Create, type: :model do
  subject { described_class }

  describe 'call' do
    context 'when we can create an user' do
      let(:username) { 'juuh42dias' }

      before do
        allow(GithubHandleReposJob).to receive(:perform_later).with(username).once
        github_stub_request_success(username)
      end

      it 'creates an user' do
        expect { subject.call(username:) }.to change(User, :count).by(1)
      end
    end

    context 'when user had invalid username' do
      let(:username) { nil }

      before do
        github_stub_request_fail(username)
        allow(GithubHandleReposJob).to receive(:perform_later).with(username).once
      end

      it 'interactors returns with failure' do
        interactor = subject.call(username:)
        expect(interactor.failure?).to be true
      end
    end

    # TODO: Create more bad path scenarios
    context 'when user has github invalid username' do
      pending 'it should destroy or rollback creating user'
    end
  end
end
