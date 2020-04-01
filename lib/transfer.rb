require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    rejection = "Transaction rejected. Please check your account balance."
    if @status != "complete" && sender.valid? && receiver.valid?
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    elsif sender.valid? != true
      @status = "rejected"
      rejection
    end
  end

  
end
