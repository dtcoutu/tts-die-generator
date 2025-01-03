# frozen_string_literal: true

require "mini_magick"

module TtsDieGenerator
  # Provides base logic for creating die image with given sides.
  class DieImage
    class MissingImplementation < StandardError; end
    class InvalidDie < StandardError; end

    attr_reader :sides, :test
    attr_accessor :die_image

    TEMPLATE_DIR = "#{Gem.loaded_specs["tts_die_generator"].gem_dir}/lib/templates".freeze

    class << self
      def create(sides)
        die_class = die_class(sides.count)
        die_class.new(sides)
      end

      def die_class(size)
        die_class = subclasses.find { _1.expected_sides == size }

        raise InvalidDie, size if die_class.nil?

        die_class
      end

      def positions
        raise MissingImplementation
      end

      def pointsize
        raise MissingImplementation
      end

      def expected_sides
        positions.count
      end
    end

    def image_source
      raise MissingImplementation
    end

    def image_resize(_image)
      raise MissingImplementation
    end

    def generate
      white_background

      sides.each_with_index do |side, index|
        position = self.class.positions[index]

        handle_side(position, side)
      end

      die_image
    end

    protected

    def initialize(sides, test: false)
      @die_image = MiniMagick::Image.open(image_source)
      @sides = sides
      @test = test
    end

    private

    def handle_side(position, value)
      if File.exist?(value)
        handle_image(position, value)
      else
        handle_text(position, value)
      end
    end

    def handle_image(position, image_path)
      image = MiniMagick::Image.open(image_path)
      image_resize(image)
      position = position.for_image(image)
      image.rotate position.rotation.to_s if position.rotation != 0

      @die_image = die_image.composite(image) do |c|
        c.compose "Over"
        c.geometry "+#{position.x}+#{position.y}"
      end
    end

    def handle_text(position, text)
      die_image.combine_options do |c|
        c.family "Arial"
        c.pointsize pointsize.to_s
        c.fill "black"
        c.gravity "center"
        c.draw "translate #{position.x},#{position.y} translate -1024,-1024 " \
               "rotate #{position.rotation} text 0,0 '#{text}'"
      end
    end

    def white_background
      return if test

      die_image.combine_options do |c|
        c.fill "white"
        c.draw "rectangle 0,0 2048,2048"
      end
    end
  end
end
