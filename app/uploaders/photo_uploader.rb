class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :store_dimensions

  version :thumb do
    process resize_to_limit: [nil, 100]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_dimensions
    return if !file || !model

    img = ::Magick::Image::read(file.file).first
    model.width = img.columns
    model.height = img.rows
  end
end
