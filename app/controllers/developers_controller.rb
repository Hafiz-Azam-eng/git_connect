class DevelopersController < ApplicationController
    def index
        @developers = Developer.joins(:user).where.not(users: { confirmed_at: nil })

    end
  end
  