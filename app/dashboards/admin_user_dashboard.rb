require "administrate/base_dashboard"

class AdminUserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    posts: Field::HasMany,
    id: Field::Number,
    email: Field::String.with_options(searchable: true),
    password: Field::String.with_options(searchable: false),
    first_name: Field::String,
    last_name: Field::String,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :posts,
    :first_name,
    :last_name,
    :email,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :posts,
    :id,
    :email,
    :first_name,
    :last_name,
    :type,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :email,
    :first_name,
    :last_name,
    :password,
    :type,
  ].freeze

  # Overwrite this method to customize how admin users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(admin_user)
  #   "AdminUser ##{admin_user.id}"
  # end
end
