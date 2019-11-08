class Usuario {
  int _id;
  String _nome;
  String _senha;

  Usuario(this._nome, this._senha);

  Usuario.map(dynamic obj) {
    this._nome = obj['nome'];
    this._senha = obj['senha'];
    this._id = obj['id'];
  }

  String get nome => this._nome;
  String get senha => this._senha;
  int get id => this._id;

  Map<String, dynamic> toMap() {
    var mapa = new Map<String, dynamic>();
    mapa["nome"] = this._nome;
    mapa["senha"] = this._senha;

    if (id != null) {
      mapa["id"] = this._id;
    }

    return mapa;
  }

  Usuario.fromMap(Map<String, dynamic> mapa) {
    this._nome = mapa["nome"];
    this._senha = mapa["senha"];
    this._id = mapa["id"];
  }

}