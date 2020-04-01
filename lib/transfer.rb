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
    if sender.balance < amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status != "complete" && sender.valid? && receiver.valid?
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end
    "Transaction rejected. Please check your account balance."
  end

  
end
