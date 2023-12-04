class Api::V1::TransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    transaction = Transaction.new
  end

  def create
    transaction = Transaction.new(transaction_params)
    transaction.user_id = current_user.id
    if transaction.save
      redirect_to root_path, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  private

  def set_user
    user = User.find(params[:user_id])
  end

  def transaction_params
    params.require(:transaction).permit(:withdrawal_amount, :deposit_amount, :amount, :currency, :user_id)
  end
end
