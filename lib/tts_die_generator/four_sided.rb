# frozen_string_literal: true

module TtsDieGenerator
  # Contain details specific to creating a D4 die image.
  class FourSided < DieImage
    def image_source
      "#{TEMPLATE_DIR}/D4.png".freeze
    end

    def positions # rubocop:disable Metrics/MethodLength
      [
        # 1s
        Position.new(590, 685, 230),
        Position.new(1350, 500, 55),
        Position.new(1370, 1650, 120),
        # 2s
        Position.new(490, 940),
        Position.new(500, 1900),
        Position.new(1550, 1900),
        # 3s
        Position.new(390, 680, 120),
        Position.new(1570, 360, 180),
        Position.new(635, 1685, 235),
        # 4s
        Position.new(1680, 600, 300),
        Position.new(380, 1680, 120),
        Position.new(1720, 1720, 235)
      ].freeze
    end

    def pointsize
      250
    end

    def expected_sides
      4
    end

    def image_resize(image)
      # TODO: resize to specific height and width instead of percentage
      image.resize "50%"
    end

    def generate
      # TODO: Instead of complete background fill in just the die face
      white_background

      sides.each_with_index do |side, index|
        # Need to map side to three positions
        (0..2).each do |j|
          position = positions[(index * 3) + j]

          handle_side(position, side)
        end
      end

      die_image
    end
  end
end
