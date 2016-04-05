class Post < ActiveRecord::Base
	validates :title, :presence => true
    validates :body, :presence => true
    validates :my_file, :presence => true
	extend FriendlyId
    friendly_id :title, use: :slugged
    mount_uploader :my_file, FileUploader
end
