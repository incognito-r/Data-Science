# Create a class with 2 attributes - balance & acc. no.,
# Create methods for debit, credit and printing acc. balance.

class BankAccount():
    def __init__(self, balance, acc_no) -> None:
        self.balance = balance
        self.acc_no = acc_no

    def debit(self, amt):
        self.balance-=amt
        print(f"Amount debited: {amt}")

    def credit(self, amt):
        self.balance+=amt
        print(f"Amount credited: {amt}")

    def getBalance(self):
        print(f"Account Balance: {self.balance}")

obj = BankAccount(1000, 1234)
obj.debit(500)
obj.getBalance()
obj.credit(700)
obj.getBalance()