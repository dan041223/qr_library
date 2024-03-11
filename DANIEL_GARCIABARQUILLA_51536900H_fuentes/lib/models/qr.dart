// ignore_for_file: non_constant_identifier_names, prefer_initializing_formals

class QR {
  int? id;
  String? qr_url;
  String? name_qr;
  String? description;
  DateTime? qr_date;
  String? id_user;

  QR(id, qr_url, name_qr, description, qr_date, id_user) {
    this.id = id;
    this.qr_url = qr_url;
    this.name_qr = name_qr;
    this.description = description;
    this.qr_date = DateTime.now();
    this.id_user = id_user;
  }
}
