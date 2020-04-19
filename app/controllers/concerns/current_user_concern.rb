module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(
                  name: "Friend",
                  first_name: "Guest",
                  last_name: "User",
                  email: "youremail@example.com"
                 )
  end
end
