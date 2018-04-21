class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize (sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
  end

  def valid?
    @sender.valid? && @receiver.valid?

    #Long version
    #if @sender.valid? && @receiver.valid?
      #true
    #else
      #false
    #end
  end

  def execute_transaction
    if !@sender.valid? #|| @amount > @sender.balance
      @status="rejected"
      "Transaction rejected. Please check your account balance."

    elsif @status=="pending" #&& valid?
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)

      @status="complete"
    end
  end

  def reverse_transfer
    if @status=="complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)

      @status="reversed"
    end
  end

end
