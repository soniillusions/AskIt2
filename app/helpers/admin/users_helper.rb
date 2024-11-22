# frozen_string_literal: true

module Admin
  module UsersHelper
    def user_roles
      User.roles.keys.map do |role|
        [t(role, scope: 'global.user.roles'), role]
      end
    end

    def admin_user?
      current_user&.role == 'admin'
    end
  end
end
