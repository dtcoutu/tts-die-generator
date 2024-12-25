# frozen_string_literal: true

module TtsDieGenerator
  # Contain details specific to creating a D12 die image.
  class TwelveSided < DieImage
    def image_source
      "#{TEMPLATE_DIR}/D12.png".freeze
    end

    def positions # rubocop:disable Metrics/MethodLength
      [
        Position.new(1750, 1790),
        Position.new(590, 860),
        Position.new(570, 1785),
        Position.new(1150, 1785),
        Position.new(880, 420, 180),
        Position.new(280, 420, 180),
        # 7
        Position.new(1450, 420, 180),
        Position.new(1450, 1350, 180),
        Position.new(290, 1350, 180),
        Position.new(890, 1350, 180),
        Position.new(1160, 860),
        Position.new(1750, 860)
      ]
    end

    def pointsize
      325
    end

    def image_resize(image)
      image.resize "75%"
    end
  end
end
