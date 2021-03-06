module RQRCodePNG
  class Image
    BLACK = ::ChunkyPNG::Color::BLACK
    WHITE = ::ChunkyPNG::Color::WHITE	
    TRANSPARENT = ::ChunkyPNG::Color::TRANSPARENT	

    def initialize(qr_code)
      @sequence = Sequence.new(qr_code)
    end

    # Returns an image file of the QR Code
    def render (bg_color = TRANSPARENT, fg_color = BLACK)
      png = blank_img(bg_color)
      @sequence.dark_squares_only do |x, y|
        png[y + @sequence.border_width(), x + @sequence.border_width()] = fg_color
      end
      return png
    end

    private

    # Returns the size of the image
    def img_size()
      @img_size ||= @sequence.img_size() + @sequence.border_width() * 2
    end

    # Returns an appropriately sized, blank (transparent) image
    def blank_img bg_color = TRANSPARENT
      ::ChunkyPNG::Image.new(img_size(), img_size(), bg_color)
    end
  end
end

