require "administrate/base_dashboard"

class InterviewDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    fee_agent_name: Field::String,
    fee_agent_email: Field::String,
    fee_agent_phone_number: Field::String,
    download_link: DownloadLinkField,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    fee_agent_name
    created_at
    download_link
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    created_at
    updated_at
    fee_agent_name
    fee_agent_email
    fee_agent_phone_number
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    fee_agent_name
    fee_agent_email
    fee_agent_phone_number
  ].freeze

  # Overwrite this method to customize how interviews are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(interview)
  #   "Interview ##{interview.id}"
  # end
end
