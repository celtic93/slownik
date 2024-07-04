class ApplicationController < ActionController::Base
  DEFAULT_AND_NEED_OPPOSITE_WORD_KIND = "vocabulary".freeze

  def current_user
    @current_user ||= User.find(1)
  end
end
