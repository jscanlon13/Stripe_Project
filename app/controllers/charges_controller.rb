class ChargesController < ApplicationController
  def new
  end

  def index  
  end

def create
  # Amount in cents
  @amount = 4250
  token = params[:stripeToken]

   Stripe::Charge.create(
     :amount      => @amount,
     :card        => token,
     :description => 'Rails Stripe customer',
     :currency    => 'eur'
   )

   #ch = Stripe::Charge.retrieve("ch_103Zbb2D6VMGneTDMAegkR9o")
   #ch.refund

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end