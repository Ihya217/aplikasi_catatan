class Catatan {
  String? id;
  String? judul;
  String? isi;

  Catatan({
    this.id,
    this.judul,
    this.isi,
  });

  Catatan.fromJson(
    Map<String, dynamic> json
  ) {
    id = json['id']; //nah disini isi apa ??
    judul = json['judul'];
    isi = json['isi'];
  }

  get cast => null;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['isi'] = isi;
    return data;
  }
}
