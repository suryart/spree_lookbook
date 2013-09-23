require 'spec_helper'

describe Spree::Admin::LookImagesController do
  stub_authorization!

  context 'admin should be able to see tooltip on a look image' do
    let!(:look){ create(:look_with_look_products) }

    it 'can creates a tooltip with multiple tooltip locations' do
      visit spree.admin_path
      click_link "Lookbook"
      puts look.inspect
      puts look.look_products.inspect
      puts look.products.inspect
      sleep(10)

    end
  end
end
