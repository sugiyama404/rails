class ApplicationController < ActionController::Base
    def sign_out
        cookies.delete(:guest_remember_token)
      end
      def sign_inhh(guest)
        remember_token = Guest.new_remember_token
        cookies.permanent[:guest_remember_token] = remember_token
        guest.update!(remember_token: Guest.encrypt(remember_token))
        @current_guest = guest
      end
end
