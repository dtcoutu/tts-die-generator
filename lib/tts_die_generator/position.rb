# frozen_string_literal: true

module TtsDieGenerator
  # Holds the position information for a single die face.
  class Position
    attr_reader :x, :y, :rotation

    def initialize(x_axis, y_axis, rotation = 0)
      @x = x_axis
      @y = y_axis
      @rotation = rotation
    end

    # Images are placed from their top-left corner so this shifts
    # the position based on it's size.
    def for_image(image)
      Position.new(
        x - (image.width / 2),
        y - (image.height / 2),
        rotation
      )
    end
  end
end
