module Wizard
    module Review
      STEPS = %w(step1 step2 step3).freeze
  
      class Base
        include ActiveModel::Model
        attr_accessor :review
  
        delegate *::Review.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :review
  
        def initialize(review_attributes)
          @review = ::Review.new(review_attributes)
        end
      end
  
      class Step1 < Base
        validates :business_name, presence: true
      end
  
      class Step2 < Step1
        
      end
  
      class Step3 < Step2
        
      end
  
    end
  end