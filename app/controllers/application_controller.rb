require "application_responder"

class ApplicationController < ActionController::Base
   helper_method :javascript_include_view_js
   self.responder = ApplicationResponder
   respond_to :html, :json, :js

   # Prevent CSRF attacks by raising an exception.
   # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception

   before_filter :configure_permitted_parameters, if: :devise_controller?

   def javascript_include_view_js
      if FileTest.exists? "app/assets/javascripts/app/specific/"+params[:controller]+"/"+params[:action]+".js.coffee"
         return 'app/specific/'+params[:controller]+'/'+params[:action]
      end
   end

   private
   def authenticate_user
      self.status        = 200
      unless user_signed_in?
         if request.xhr?
            render file: "remote_content/remote_sign_in.js.erb"
         else
            redirect_to remote_sign_in_path
         end
      end
   end

   protected

   def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:account_update) << :name
   end

   def js_request?
      logger.info "js_request?"
      logger.info request.format.js?
      request.format.js?
   end
end

