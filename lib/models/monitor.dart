
class cardhome {
  final String namasapi;
  final String kodealat;
  final String detak;
  final String suhu;
  final String detak1hari;
  final String suhu1hari;

  cardhome({
    required this.namasapi,
    required this.kodealat,
    required this.detak,
    required this.suhu,
    required this.detak1hari,
    required this.suhu1hari
  });

  factory cardhome.fromJson(dynamic json) {
  return cardhome(
    namasapi: json['nama_sapi'] as String? ?? 'Data Kosong',
    kodealat: json['kode_alat'] as String? ?? 'Data Kosong',
    detak: json['detak'] as String? ?? '0',
    suhu: json['suhu'] as String? ?? '0',
    detak1hari: json['detak1hari'] as String? ?? '0',
    suhu1hari: json['suhu1hari'] as String? ?? '0',
  );
}

  static List<cardhome> CardhomefromSnapshot(List snapshot){
    return snapshot.map((data) {
      return cardhome.fromJson(data);
    }).toList();
  }
  @override
  String toString(){
    return 'Monitor {namasapi: $namasapi, suhu: $suhu, detak: $detak, kode: $kodealat, suhu1hari: $suhu1hari, detak1hari: $detak1hari}';
  }
}