class SessionsController < Devise::SessionsController
   prepend_before_filter :allow_params_authentication!, :only => :create

   def new
      super
   end



   # POST /resource/sign_in
   def create
      @resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
      set_flash_message(:success, :signed_in) if is_flashing_format?
      #sign_in(resource_name, @resource)
      sign_in_without_redirect(resource_name, @resource)
      respond_to do |format|
         format.html { 
            yield resource if block_given?
            respond_with @resource, :location => after_sign_in_path_for(@resource) 
         }
         format.js{ render :template => "remote_content/devise_success_sign_in.js.erb"}
         # format.js {return render :js => "window.location.href = '#{@after_sign_in_path }'"}
      end
   end

    # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    yield if block_given?
    respond_to_on_destroy
  end

    def respond_to_on_destroy
    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
    end

   def failure
      flash.clear
      flash.now[:error] = "Invalid email or password."
      render :template => "remote_content/devise_errors.js.erb"
   end

   def sign_in_without_redirect(resource_or_scope, resource=nil)
      scope = Devise::Mapping.find_scope!(resource_or_scope)
      resource ||= resource_or_scope
      sign_in(scope, resource) unless warden.user(scope) == resource
   end

end
