# frozen_string_literal: true

module TtsDieGenerator
  # Contain details specific to creating a D20 die image.
  class TwentySided < DieImage
    def image_source
      "#{TEMPLATE_DIR}/D20.png".freeze
    end

    def positions # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      [
        Position.new(1045, 1320, 180),
        Position.new(1800, 160, 180),
        Position.new(1035, 730, 180),
        Position.new(540, 1320, 180),
        Position.new(1570, 730, 180),
        # 6
        Position.new(530, 730, 180),
        Position.new(300, 160, 180),
        Position.new(1290, 160, 180),
        Position.new(810, 160, 180),
        Position.new(1570, 1320, 180),
        # 11
        Position.new(1800, 1580),
        Position.new(1300, 1580),
        Position.new(1570, 390),
        Position.new(1035, 390),
        Position.new(280, 1580),
        # 16
        Position.new(260, 980),
        Position.new(790, 980),
        Position.new(1290, 980),
        Position.new(530, 390),
        Position.new(780, 1580)
      ]
    end

    def pointsize
      220
    end

    def image_resize(image)
      image.resize "75%"
    end
  end
end
