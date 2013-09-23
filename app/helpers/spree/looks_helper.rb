module Spree
  module LooksHelper

    def method_missing(method_name, *args, &block)
      if image_style = image_style_from_method_name_for_look(method_name)
        define_look_image_method(image_style)
        self.send(method_name, *args)
      else
        super
      end
    end

    private

    # Returns style of image or nil
    def image_style_from_method_name_for_look(method_name)
      if style = method_name.to_s.sub(/_look_image$/, '')
        possible_styles = Spree::LookImage.attachment_definitions[:attachment][:styles]
        style if style.in? possible_styles.with_indifferent_access
      end
    end

    def define_look_image_method(style)
      self.class.send :define_method, "#{style}_look_image" do |look, *options|
        options = options.first || {}
        if look.images.empty?
          image_tag "noimage/#{style}.png", options
        else
          image = look.images.first
          options.reverse_merge! :alt => image.alt.blank? ? look.name : image.alt
          image_tag image.attachment.url(style), options
        end
      end
    end
  end
end