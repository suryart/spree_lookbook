FactoryGirl.define do
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_lookbook/factories'

  sequence(:lookbook_name) { |n| "Lookbook - #{n}" }
  sequence(:lookbook_description) { |n| "Lookbook Description with number - #{n}" }

  sequence(:look_name) { |n| "Look - #{n}" }
  sequence(:look_description) { |n| "Look Description with number - #{n}" }

  trait :inactive do
    active false
  end

  factory :lookbook, :class => Spree::Lookbook do
    # attributes
    name { generate(:lookbook_name) }
    description { generate(:lookbook_description) }

    factory :inactive_lookbook, :traits => [:inactive]

    # lookbook_with_looks will create looks data after when lookbook has been created
    # Usages:
    # FactoryGirl.create(:lookbook_with_looks).looks.length # 5
    # FactoryGirl.create(:lookbook_with_looks, :looks_count => 15).looks.length # 15
    factory :lookbook_with_looks do
      ignore do
        looks_count 5
        active true
      end

      after(:create) do |lookbook, evaluator|
        FactoryGirl.create_list(:look, evaluator.looks_count, :lookbook => lookbook, :active => evaluator.active)
      end

      factory :inactive_lookbook_with_looks, :traits => [:inactive]
    end
  end

  # Default Look Factory
  factory :look, :class => Spree::Look do
    lookbook

    # attributes
    name { generate(:look_name) }
    description { generate(:look_description) }

    # Usages:
    # FactoryGirl.create(:look_with_look_products).look_products.length # 5
    # FactoryGirl.create(:look_with_look_products, :look_products_count => 15).look_products.length # 15
    factory :look_with_look_products do
      ignore do
        look_products_count 5
        active true
      end

      after(:create) do |look, evaluator|
        FactoryGirl.create_list(:look_product, evaluator.look_products_count, :look => look, :active => evaluator.active)
      end
    end
    
    factory :inactive_look, :traits => [:inactive]
  end

  factory :look_product, :class => Spree::LookProduct do
    look
    product
    ignore do
      active true
    end

    factory :inactive_look_with_look_products, :traits => [:inactive]
  end
end
