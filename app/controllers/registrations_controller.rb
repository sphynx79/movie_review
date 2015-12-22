class RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    build_resource(sign_up_params)

    if resource.save
      respond_to do |format|
        format.html {
          yield resource if block_given?
          if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_flashing_format?
            sign_up(resource_name, resource)
            respond_with resource, :location => after_sign_up_path_for(resource)
          else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
            expire_data_after_sign_in!
            respond_with resource, :location => after_inactive_sign_up_path_for(resource)
          end
        }
        format.js {
          flash.now[:success] = "Account creato, effettua il login."
          # return render :js => "window.location.href = '#{root_path}'"
          render :template => "remote_content/devise_success_sign_up.js.erb"
        }
      end
    else
      respond_to do |format|
        format.html {
          clean_up_passwords resource
          respond_with resource
        }
        format.js {
          flash.now[:error] = @user.errors.full_messages.to_sentence
          render :template => "remote_content/devise_errors.js.erb"
        }
      end
    end
  end
end
