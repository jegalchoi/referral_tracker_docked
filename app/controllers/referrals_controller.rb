class ReferralsController < ApplicationController
  before_action :set_referral, only: [:show, :update, :destroy]

  def index
    @referrals = Referral.order(:id)
    if @referrals
      render json: {
        referrals: @referrals
      }
    else
      render json: {
        status: 500
      }
    end
  end

  def show
    if @referral
      render json: {
        referral: @referral
      }
    else
      render json: {
        status: 400
      }
    end
  end

  def create
    @referral = Referral.new(referral_params)
    if @referral.save
      render json: {
        status: 201
      }
    else
      render json: {
        status: 400
      }
    end
  end

  def update
    if @referral && @referral.update(referral_params)
      render json: {
        status: 200
      }
    elsif !@referral
      render json: {
        status: 404
      }
    else
      render json: {
        status: 400
      }
    end
  end

  def destroy
    if @referral
      @referral.destroy
      render json: {
        status: 200
      }
    else
      render json: {
        status: 400
      }
    end
  end

    private

    def referral_params
      params.require(:referral).permit(:user_id, :last_name, :first_name, :date_requested, :status)
    end

    def set_referral
      @referral ||= Referral.find_by(id: params[:id])
    end

end
