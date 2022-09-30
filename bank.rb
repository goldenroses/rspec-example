class Bank
  def initialize(bank_name, balance = 0, deposit = 0)
    @bankName = bank_name
    @balance = balance
    @deposit = deposit
    puts "#{bank_name} created."
  end

  def withdrawal(name, amount)
    if amount > 0
      @balance -= amount
      puts "#{name} withdrew $#{amount} from #{@bankName}.  #{name} has #{@balance}."
    end
  end

  def deposit(name, amount)
    if amount > 0
      @balance += amount
      puts "#{name} deposited $#{amount} to #{@bankName}. #{name} has #{@balance}."
    end
  end
end
