class ScreenshotUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick


  storage :fog

  process :convert => 'jpg'
  process :exif_rotation
  process :strip
  process :interlace 

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/"
  end

  def random_string
    (0...50).map { ('a'..'z').to_a[rand(26)] }.join
  end

  def filename
    new_name = Haikunator.haikunate
    if original_filename
      if model && model.read_attribute(mounted_as).present?
        model.read_attribute(mounted_as)
      else
        @name ||= "#{new_name}.jpeg"
      end
    end
  end

  def extension_whitelist
    %w(jpg jpeg gif png gif)
  end


  def exif_rotation
    manipulate! do |img|
      img.auto_orient
      img = yield(img) if block_given?
      img
    end
  end

  # Strips out all embedded information from the image
  def strip
    manipulate! do |img|
      img.strip
      img = yield(img) if block_given?
      img
    end
  end
  # Tiny gaussian blur to optimize the size
  def gaussian_blur(radius)
    manipulate! do |img|
      img.gaussian_blur(radius.to_s)
      img = yield(img) if block_given?
      img
    end
  end
  
  # set the Interlace of the image plane/basic
  def interlace
    manipulate! do |img|
      img.strip
      img.combine_options do |c|
        c.quality "80"
        c.depth "8"
        c.interlace "plane"
      end
      img
    end
  end

  # Reduces the quality of the image to the percentage given
  def quality(percentage)
    manipulate! do |img|
      img.quality(percentage.to_s)
      img = yield(img) if block_given?
      img
    end
  end

end
