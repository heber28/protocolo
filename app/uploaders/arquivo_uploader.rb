# encoding: utf-8

class ArquivoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  ###include CarrierWaveDirect::Uploader
  # include CarrierWave::MiniMagick
  include CarrierWave::MiniMagick
  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  #storage :fog

  include CarrierWave::MimeTypes
  process :set_content_type

  #storage :fog
  storage :file

  #def filename
  #  "#{model.id.to_s}.#{file.extension}" if original_filename.present?
  #end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "../uploads/#{model.processo.id}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  process :resize_to_limit => [800, 800]
  #
  # def scale(width, height)
  #   # do something
  # end
  #process :read_dimensions
  #process :extract_dimensions
  # Create different versions of your uploaded files:
  #version :thumb do
    #process :scale => [50, 50]
   # process :resize_to_limit => [200, 200]
  #end

  #version :content do
  #  process :resize_to_limit => [800, 800]
  #end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
