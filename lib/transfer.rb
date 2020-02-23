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
    if valid?
      sender.balance -= amount && receiver.balance += amount
    end
  end

  def reverse_transfer(sender, receiver, amount)
  end
end
