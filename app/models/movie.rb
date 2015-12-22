class Movie < ActiveRecord::Base
   searchkick
   belongs_to :user
   has_many :review
   
   validates  :title, :description, presence: true

   has_attached_file :image, styles: { medium: "300x445>" }
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
