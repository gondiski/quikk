class Api::V1::TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: [:show, :update, :destroy]
  
  def index
    transactions = Transaction.all
    render json: transactions
  end

  def show
    transaction = Transaction.find(params[:id])
    render json: transaction
  end


  def new
    transaction = Transaction.new
  end

  def create
    transaction = Transaction.new(transaction_params)
    transaction.user_id = current_user.id
    if transaction.save
      render status: :ok, json: transaction
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end


  def transaction_params
    params.require(:transaction).permit(:withdrawal_amount, :deposit_amount, :amount, :currency, :user_id)
  end
end
