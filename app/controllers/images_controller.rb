class ImagesController < ApplicationController
  before_action :set_image, only: [:compress, :convert_to_png, :convert_to_bw, :show]
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image, notice: "Image uploaded successfully."
    else
      render :new
    end
  end
  
  def show; end

  def compress
    quality = params[:quality].to_i
    compressed_image = compress_image(@image.file, quality)
    send_data compressed_image, type: 'image/jpeg', disposition: 'inline'
  end

  def convert_to_png
    png_image = convert_image_to_png(@image.file)
    send_data png_image, type: 'image/png', disposition: 'inline'
  end

  def convert_to_bw
    bw_image = convert_image_to_bw(@image.file)
    send_data bw_image, type: 'image/jpeg', disposition: 'inline'
  end
  
  private

  def set_image
    @image = Image.find(params[:id])
  end

  def convert_image_to_bw(image)
    image_file = image.blob.download

    img = Magick::Image.from_blob(image_file).first
    img = img.quantize(256, Magick::GRAYColorspace)
    img.to_blob { |attrs| attrs.format = 'JPEG' }
  end
  
  def convert_image_to_png(image)
    image_file = image.blob.download

    img = Magick::Image.from_blob(image_file).first
    img.to_blob { |attrs| attrs.format = 'PNG' }
  end
  
  def compress_image(image, quality)
    image_file = image.blob.download

    img = Magick::Image.from_blob(image_file).first
    img.to_blob { |attrs| attrs.format = 'JPEG'; attrs.quality = quality }
  end

  def image_params
    params.require(:image).permit(:file)
  end
end