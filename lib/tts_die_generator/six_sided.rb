# frozen_string_literal: true

module TtsDieGenerator
  # Contain details specific to creating a D6 die image.
  class SixSided < DieImage
    class << self
      def positions
        [
          Position.new(340, 1740, 180),
          Position.new(340, 1050),
          Position.new(1020, 1740),
          Position.new(1020, 1050),
          Position.new(1700, 1050),
          Position.new(1700, 1740, 180)
        ]
      end

      def pointsize
        400
      end
    end

    def image_source
      "#{TEMPLATE_DIR}/D6.png".freeze
    end

    def image_resize(image)
      image.resize "458x458"
    end
  end
end
