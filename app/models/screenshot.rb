class Screenshot < ApplicationRecord
    require 'carrierwave/orm/activerecord'
    belongs_to :user
    mount_uploader :image, ScreenshotUploader
end
