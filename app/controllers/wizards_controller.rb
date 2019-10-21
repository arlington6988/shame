
require 'wizard'

class WizardsController < ApplicationController
    include Wizard
    before_action :load_review_wizard, except: %i(validate_step)
  
    def validate_step
      current_step = params[:current_step]
  
      @review_wizard = wizard_review_for_step(current_step)
      @review_wizard.review.attributes = review_wizard_params
      session[:review_attributes] = @review_wizard.review.attributes
  
      if @review_wizard.valid?
        next_step = wizard_review_next_step(current_step)
        create and return unless next_step
        redirect_to action: next_step
      else
        render current_step
      end
    end
  
    def create
      if @review_wizard.review.save
        session[:review_attributes] = nil
        redirect_to root_path, notice: 'Review succesfully created!'
      else
        redirect_to({ action: Wizard::Review::STEPS.first }, alert: 'There were a problem when creating the review.')
      end
    end
  
    private
  
    def load_review_wizard
      @review_wizard = wizard_review_for_step(action_name)
    end
  
    def wizard_review_next_step(step)
      Wizard::Review::STEPS[Wizard::Review::STEPS.index(step) + 1]
    end
  
    def wizard_review_for_step(step)
      raise InvalidStep unless step.in?(Wizard::Review::STEPS)
  
      "Wizard::Review::#{step.camelize}".constantize.new(session[:review_attributes])
    end
  
    def review_wizard_params
      params.require(:review_wizard).permit(:story, :business_name, :location, :associate, :date, :rating)
    end
  
    class InvalidStep < StandardError; end
  end