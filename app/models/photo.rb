class Photo < ActiveRecord::Base
  has_attachment :storage => :file_system,
                 :resize_to => '560x420',
                 :thumbnails => { :thumb => '80x60'},
                 :max_size => 4.megabytes,
                 :content_type => :image,
                 :processor => 'Rmagick'
  validates_as_attachment
  acts_as_taggable
  belongs_to :user
end

