class ApplicationController < ActionController::Base

    protect_from_forgery unless: -> { request.format.json? }

    private

    def confirm_user_access
        unless session[:user_id]
            redirect_to(login_auth_path)
        end
    end

    def is_user_already_logged
        session[:user_id].nil? == false
    end

end
