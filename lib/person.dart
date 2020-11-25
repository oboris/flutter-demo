abstract class IPerson {
  int getType();
}

class PersonAddress implements IPerson {
  String name;
  String address;

  PersonAddress(this.name, this.address);

  @override
  int getType() {
    return 1;
  }
}

class PersonInfo implements IPerson {
  String _name;
  String _info;

  PersonInfo(this._name, this._info);

  String get name => _name;

  String get info => _info;

  @override
  int getType() {
    return 2;
  }
}
