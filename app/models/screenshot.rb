class Screenshot < ApplicationRecord
    require 'carrierwave/orm/activerecord'
    belongs_to :user
    before_create :randomize_id
    mount_uploader :image, ScreenshotUploader

    private
    def randomize_id
      begin
        self.id = SecureRandom.random_number(1_000_000)
      end while Screenshot.where(id: self.id).exists?
    end
end
