# frozen_string_literal: true

module Users
  class Create
    include Interactor

    def call
      create_user!
      create_projects
    end

    private

    def create_user!
      @user = User.create!(username: context.username)
      context.user = @user
    rescue StandardError => e
      context.fail!(error: e.message)
    end

    def create_projects
      GithubHandleReposJob.perform_later(context.username) unless context.failure?
    end
  end
end
