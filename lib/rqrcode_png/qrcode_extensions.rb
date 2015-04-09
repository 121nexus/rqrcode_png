module RQRCodePNG
  module QRCodeExtensions 
    # This method returns a 33x33 .png of the code
    def to_img(bg_color = ChunkyPNG::Color::TRANSPARENT, fg_color = ChunkyPNG::Color::BLACK)
      return Image.new(self).render(bg_color, fg_color)
    end
    
    def to_img_rgba(bg_color = [0,0,0,0], fg_color = [0,0,0,255])
      chunky_bg = ChunkyPNG::Color.rgba(bg_color[0],bg_color[1],bg_color[2],bg_color[3])
      chunky_fg = ChunkyPNG::Color.rgba(fg_color[0],fg_color[1],fg_color[2],fg_color[3])
      return Image.new(self).render(chunky_bg, chunky_fg)
    end
  end
end

