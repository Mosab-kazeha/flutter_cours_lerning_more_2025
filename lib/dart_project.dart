class Bank {
  int _pankAcoutId;
  String userName;
  String password;

  Bank._(this._pankAcoutId, this.password, this.userName);

  static final Bank _bankAcount = Bank._(1, "password", "MHD");

  static Bank getBankAcount() {
    return _bankAcount;
  }

  int get myId {
    return _pankAcoutId;
  }

  changeId({required int newId}) {
    _pankAcoutId = newId;
  }
}
