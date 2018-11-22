class FormsController < ApplicationController
  before_action :ensure_interview, only: %i[edit update]

  helper_method :current_interview, :current_path, :next_path, :applicant_or_client

  def index
    render layout: "application"
  end

  def edit
    @form = form_class.from_interview(current_interview)
  end

  def update
    @form = form_class.new(current_interview, form_params)
    if @form.valid?
      @form.save
      update_session
      redirect_to(next_path)
    else
      render :edit
    end
  end

  def current_path(params = nil)
    screen_path(self.class.to_param, params)
  end

  def next_path(params = {})
    next_step = form_navigation.next
    if next_step
      screen_path(next_step.to_param, params)
    end
  end

  def self.show?(interview)
    show_rule_sets(interview).all?
  end

  def current_interview
    Interview.find_by(id: session[:current_interview_id])
  end

  private

  delegate :form_class, to: :class

  # Override in subclasses

  def update_session; end

  def form_params
    params.fetch(:form, {}).permit(*form_class.attribute_names)
  end

  # Don't override in subclasses

  def applicant_or_client
    if current_interview.navigator.interview_type_renewal?
      "client"
    else
      "applicant"
    end
  end

  def ensure_interview
    if current_interview.blank?
      redirect_to root_path
    end
  end

  def form_navigation
    @form_navigation ||= FormNavigation.new(self)
  end

  class << self
    def to_param
      controller_name.dasherize
    end

    def form_class
      (controller_name + "_form").classify.constantize
    end

    def show_rule_sets(_)
      [ShowRules.defaults_to_true]
    end
  end
end
