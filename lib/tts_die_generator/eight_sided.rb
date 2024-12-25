# frozen_string_literal: true

module TtsDieGenerator
  # Contain details specific to creating a D8 die image.
  class EightSided < DieImage
    def image_source
      "#{TEMPLATE_DIR}/D8.png".freeze
    end

    def positions
      [
        Position.new(390, 1840),
        Position.new(1195, 1105),
        Position.new(765, 770, 180),
        Position.new(1680, 1550, 180),
        Position.new(1580, 780, 180),
        Position.new(790, 1550, 180),
        Position.new(350, 1105),
        Position.new(1230, 1820)
      ]
    end

    def pointsize
      350
    end

    def image_resize(image)
      image.resize "75%"
    end
  end
end
