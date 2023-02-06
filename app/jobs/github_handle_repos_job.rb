# frozen_string_literal: true

class GithubHandleReposJob < ApplicationJob
  queue_as :default
  discard_on ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound

  # TODO: this logic is confuse yet and with much responsability, needs refactor
  def perform(username)
    user = User.find_by!(username:)
    interactor = Github::Users::Repos::Fetch.call(username: user.username)
    result = interactor.projects.map do |project|
      {
        name: project['name'].presence,
        star_count: project['stargazers_count'].presence,
        raw_data: project,
        user_id: user.id
      }
    end

    Project.upsert_all(result)
  end
end
