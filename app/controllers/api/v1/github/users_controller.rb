# frozen_string_literal: true

module Api
  module V1
    module Github
      class UsersController < ApplicationController
        def create
          interactor = Users::Create.call(username: user_params)

          if interactor.success?
            # TODO: Extract text to locale translations
            render json: { user: interactor.user.as_json, message: 'We are processing your repo projects' },
                   status: :partial_content
          else
            # TODO: Extract text to locale translations
            render json: { message: 'We had problems processing your request' }, status: :bad_request
          end
        end

        def show
          @user = User.find_by(username: user_params)
          if @user
            render json: @user.as_json(include: { projects: { except: [:raw_data] } }), status: :ok
          else
            # TODO: Maybe in future extract renders to responsers
            render json: { message: 'Record not found' }, status: :not_found
          end
        end

        private

        def user_params
          params.fetch(:username)
        end
      end
    end
  end
end
