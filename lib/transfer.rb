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
    rejection = nil
    if sender.balance < amount
      self.status = "rejected"
      rejection = "Transaction rejected. Please check your account balance."
    elsif @status != "complete" && sender.valid? && receiver.valid?
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end
    rejection
  end

  
end
