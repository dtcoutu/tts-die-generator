# frozen_string_literal: true

module TtsDieGenerator
  # Contain details specific to creating a D10 die image.
  class TenSided < DieImage
    def image_source
      "#{TEMPLATE_DIR}/D10.png".freeze
    end

    def positions # rubocop:disable Metrics/MethodLength
      [
        Position.new(290, 840),
        Position.new(1200, 470, 180),
        Position.new(890, 840),
        Position.new(1790, 1350, 180),
        Position.new(880, 1725),
        Position.new(590, 490, 180),
        Position.new(290, 1725),
        Position.new(590, 1350, 180),
        Position.new(1490, 1720),
        Position.new(1160, 1350, 180)
      ]
    end

    def pointsize
      325
    end

    def image_resize(image)
      image.resize "50%"
    end
  end
end
