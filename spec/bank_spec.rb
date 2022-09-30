require 'rspec'
require "spec_helper"
require_relative '../bank.rb'

RSpec.describe 'Bank Class Tests' do
  before(:context) do
    @bank = Bank.new("Wells Fargo")
    @bankName = @bank.instance_variable_get(:@bankName)
    @balance = @bank.instance_variable_get(:@balance)
    @deposit = @bank.instance_variable_get(:@deposit)
  end

  context "Initializing the bank" do
    it "should create a bank with the given name", :bank_name do
      expect(@bankName).to eq("Wells Fargo")
      expect(@balance).to eq(0)
      expect(@deposit).to eq(0)
    end

    it "should have a balance of 0", :balance do
      balance = @bank.instance_variable_get(:@balance)
      expect(balance).to eq(0)
    end

    it "should have a deposit of 0", :deposit do
      deposit = @bank.instance_variable_get(:@deposit)
      expect(deposit).to eq(0)
    end

  end

  context "Depositing and Withdrawing to the bank" do
    it "should have a balance of 0" do
      @bank.deposit("Rose", 100)
      balance = @bank.instance_variable_get(:@balance)
      expect(balance).to eq(100)
    end

    it "should have a balance of 50 after withdrawing 50" do
      @bank.withdrawal("Rose", 50)
      balance = @bank.instance_variable_get(:@balance)
      expect(balance).to eq(50)
    end
  end
end
