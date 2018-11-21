class StaticPagesController < ApplicationController
  before_action :clear_interview_from_session

  helper_method :current_interview

  def index; end

  private

  def current_interview; end

  def clear_interview_from_session
    session[:current_interview_id] = nil
  end
end
