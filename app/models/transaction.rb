class Transaction < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true
  validate :valid_transaction_amount

  private

  def valid_transaction_amount
    if withdrawal_amount.blank? && deposit_amount.blank?
      errors.add(:base, 'Either withdrawal_amount or deposit_amount must be present')
    elsif withdrawal_amount.present? && deposit_amount.present?
      errors.add(:base, 'Cannot have both withdrawal_amount and deposit_amount')
    end
  end
end
