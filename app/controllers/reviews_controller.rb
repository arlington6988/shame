class ReviewsController < ApplicationController
    before_action :set_deploy, only: [:show, :edit, :update, :destroy]

    def index
      @reviews = Review.all 
    end 

    def show
      @review = Review.find(params[:id])
    end

    def new
      @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        respond_to do |format|
          if @review.save
            format.html { redirect_to @review, notice: 'review was successfully created.' }
            format.json { render :show, status: :created, location: @review }
          else
            format.html { render :new }
            format.json { render json: @review.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        respond_to do |format|
          if @review.update(review_params)
            format.html { redirect_to @review, notice: 'review was successfully updated.' }
            format.json { render :show, status: :ok, location: @review }
          else
            format.html { render :edit }
            format.json { render json: @review.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @review.destroy
        respond_to do |format|
          format.html { redirect_to reviews_url, notice: 'review was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:story, :business_id, :user_id, :associate, :event_date)
    end
     
end
