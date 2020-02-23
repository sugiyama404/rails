class ApplicationController < ActionController::Base
    def sign_out
        cookies.delete(:user_remember_token)
      end
end
