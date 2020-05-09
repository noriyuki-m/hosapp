class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file
  process convert: 'jpg'
  # 保存するディレクトリ名
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # thumb バージョン(width 400px x height 200px)
  version :thumb do
    process :resize_to_fit => [400, 200]
    # process :resize_to_fill => [200, 200, "Center"]
    # process :resize_to_fill => [400, 400, "height", gravity = ::Magick::CenterGravity]
    # process :resize_to_fill => [400, 200]
  end
  # 許可する画像の拡張子
  def extension_white_list
    %W[jpg jpeg gif png]
  end
  # 変換したファイルのファイル名の規則
  def filename
    "#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
  end
  # class MyUploader < CarrierWave::Uploader::Base
  #   def default_url(*args)
  #     "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  #   end
  # end
  # class MyUploader < CarrierWave::Uploader::Base
  #   def default_url(*args)
  #     "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  #   end
  # end
    # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
    # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end
end
