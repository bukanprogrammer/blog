class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|

      if @subscriber.save
        format.html { redirect_to root_path, notice: 'Anda telah menjadi subscriber' }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { redirect_to root_path, alert: @subscriber.errors[:email].first  }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, :name)
  end
end
