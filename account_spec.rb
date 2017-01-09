require "rspec"

require_relative "account"

describe Account do

  let(:acct_number) { "1010101010" }
  let(:account) { Account.new(acct_number) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Account of the specified account number" do
        expect(account).to be_kind_of(Account)
        # OR: expect(Account.new("1010101010")).to be_kind_of(Account)
      end
    end

    context "with invalid input" do
      it "throws an argument error when given an invalid acct_number" do
        expect { Account.new }.to raise_error(StandardError)
      end
    end
  end

  describe "#transactions" do
    it "returns 0 when no starting balance is given" do
      expect(account.transactions).to eq [0]
    end
  end

  describe "#balance" do
    it "shows the balance" do
      expect(account.balance).to eq 0
    end
  end

  describe "#account_number" do
    it "hide the first 6 digit of the account number" do
      expect(account.acct_number).to eq "******1010"
    end
  end

  describe "deposit!" do
    context "when amount is > 0" do
      it "Adds new deposit amount to existing balance and show latest balance" do
        expect(account.deposit!(100)).to eq 100        
      end
    end    

    context "when amount is < 0" do
      it "raise error for negative input" do
        expect{ account.desposit!(-100) }.to raise_error(StandardError)
      end
    end  

  end

  describe "#withdraw!" do
    context "when amount withdraw is within the balance amount" do
      it "Reduce balance by withdraw amount and and show latest balance" do
        account.deposit!(100)
        expect(account.withdraw!(20)).to eq 80        
      end
    end    

    context "when amount withdraw is more than balance" do
      it "raise error when amount widr negative input" do
        account.deposit!(20)
        expect{ account.withdraw(-30) }.to raise_error(StandardError)
      end
    end  

  end
end