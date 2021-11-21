class AddressModel{
  int? _id;
  String? _country;
  String? _city;
  String? _zip;
  String? _address;
  String? _phone;

  AddressModel(this._country,this._address,this._city,this._phone,this._zip);

  int? get id => _id;
  String get country => _country!;
  String get address => _address!;
  String get city => _city!;
  String get phone => _phone!;
  String get zip => _zip!;

  //Convert a note object to mop object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    if (id != null) {
      map['id'] = _id;
    }
    map['country'] = _country;
    map['address'] = _address;
    map['city'] = _city;
    map['phone'] = _phone;
    map['zip'] = _zip;
    return map;
  }

  //Extract a note object from a map object
  AddressModel.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _address = map['address'];
    _city = map['city'];
    _phone = map['phone'];
    _country = map['country'];
    _zip = map['zip'];
  }
}