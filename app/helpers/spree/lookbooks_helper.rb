module Spree
  module LookbooksHelper

    # converts line breaks in lookbook description into <p> tags (for html display purposes)
    # def lookbook_description(lookbook)
    #   if Spree::Config[:show_raw_product_description]
    #     raw(lookbook.description)
    #   else
    #     raw(lookbook.description.gsub(/(.*?)\r?\n\r?\n/m, '<p>\1</p>'))
    #   end
    # end
  end
end
