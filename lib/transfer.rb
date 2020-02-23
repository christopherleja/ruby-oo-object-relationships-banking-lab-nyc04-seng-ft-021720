class Transfer
  attr_accessor :name, :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if sender.valid? && receiver.valid? 
      true
    else
      false
    end
  end
  
  def execute_transaction
    if status == "complete"
      "This transaction has already been completed"
    elsif valid?
      sender.deposit(amount * -1) && receiver.deposit(amount)
      self.status = "complete"
    elsif sender.valid? != true
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer(sender, receiver, amount)
  end
end
