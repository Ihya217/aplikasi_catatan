class Catatan {
  String? id;
  String? judul;
  String? isi;

  Catatan({
    this.id,
    this.judul,
    this.isi,
  });

  Catatan.fromJson(Map<String, dynamic> json) {
    id = json['name'];
    judul = json['judul'];
    isi = json['isi'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = id;
    data['judul'] = judul;
    data['isi'] = isi;
    return data;
  }
}
