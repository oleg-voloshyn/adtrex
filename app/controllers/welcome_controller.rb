class WelcomeController < ApplicationController
  skip_before_action :require_user
  # skip_before_filter :authenticate, only: :show
  def index; end
end
