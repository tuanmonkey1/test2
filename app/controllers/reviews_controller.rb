class ReviewsController < ApplicationController

	#before_action :logged_in_user, only: [:create, :destroy, :new, :index]
	#before_action :correct_user, only: :destroy

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
      if @review.save
        flash[:success] = "Review created!"
        redirect_to reviews_url
      else
        render 'new'
      end
	end

	def destroy
	  @review.destroy
	  flash[:success] = "Review deleted"
	  redirect_to request.referrer || pages_review_url
	end

	def show
	  @review = Review.find(params[:id])
	  @user = @review.user
	#   @comments = @review.comments
	#   @comment = Comment.new
	#   @rate = Rate.new
	end
	
	# def rate
    	# @review = Review.find(params[:id])
	# end

	def index
		#@review = current_user.reviews.build
		#if params[:auto]
		@reviews = Review.all
		if params[:title] && !params[:title].empty?
			@reviews = Review.search_review(params[:title].downcase)
		end
	end

	private

	  def review_params
		params.require(:review).permit(:title,:description, :content)
      end

      def correct_user
		@review = current_user.reviews.find_by(id: params[:id])
		redirect_to root_url if @review.nil?
	  end

end
