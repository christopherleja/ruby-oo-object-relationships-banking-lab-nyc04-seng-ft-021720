class Transfer
  attr_accessor :name, :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    # sender_is_valid = BankAccount.new(sender).valid? 
    # receiver_is_valid = BankAccount.new(receiver).valid?
    if sender.valid? && receiver.valid? 
      true
    else
      false
    end
  end
  
  def execute_transaction(sender, receiver, amount)
    if self.valid?
      BankAccount.new(@sender).balance -= amount && BankAccount.new(@receiver).balance += amount
    end
  end

  def reverse_transfer(sender, receiver, amount)
  end
end
