class Activity {
  int _id;
  String _name;
  String _durasi;

  Activity(this._name, this._durasi);

  Activity.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._durasi = map['durasi'];
  }

  int get id => _id;
  String get name => _name;
  String get durasi => _durasi;

  set name(String value) {
    _name = value;
  }

  set durasi(String value) {
    _durasi = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['durasi'] = durasi;
    return map;
  }  

}