# frozen_string_literal: true

module Github
  module Users
    module Repos
      class Fetch
        include Interactor

        BASE_URL = 'https://api.github.com'

        def call
          fetch_user_repositories
        end

        private

        def fetch_user_repositories
          result = Faraday.get("#{BASE_URL}/users/#{context.username}/repos")
          parsed_body = JSON.parse(result.body)
          context.projects = parsed_body

          return unless result.status >= 400

          context.fail!(error: result.body)
        end
      end
    end
  end
end
