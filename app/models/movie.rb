class Movie < ActiveRecord::Base
   searchkick
   belongs_to :user
   has_many :reviews
   
   validates  :title, :description, presence: true

   has_attached_file :image, styles: { medium: "400x600#", thumb: "300x450#" }
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
