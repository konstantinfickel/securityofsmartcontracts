# own work
tenant: public(address)
landlord: public(address)
landlordAllowsWithdrawal: public(bool)

@payable
@public
def __init__(_landlord: address):
    self.landlord = _landlord
    self.tenant = msg.sender

@public
def allWithdrawal(_newDecision: bool):
    assert(msg.sender == self.landlord)
    self.landlordAllowsWithdrawal = _newDecision

@public
def withdraw():
    assert(msg.sender == self.tenant and self.landlordAllowsWithdrawal)
    selfdestruct(self.tenant)
