module ApplicationHelper
   def resource_name
      :user
   end

   def resource
      @resource ||= User.new
   end

   def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
   end

   def flash_normal
      render "flashes"
   end


   def twitterized_type(type)
      case type
      when :errors
         "alert-error"
      when :alert
         "alert-warning"
      when :error
         "alert-error"
      when :notice
         "alert-success"
      when :info
         "alert-success"
      else
         "alert-info"
      end
   end
end
