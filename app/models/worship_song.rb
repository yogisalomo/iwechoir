class WorshipSong < ActiveRecord::Base
	mount_uploader :file, ImageUploader
end
