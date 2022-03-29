import 'dart:convert';
import 'package:http/http.dart' as http;

import '../globals.dart';

class ExamData {
  bool hata;
  String hataMesaji;
  List<dynamic> nesne;

  ExamData({
    required this.hata,
    required this.hataMesaji,
    required this.nesne,
  });

  factory ExamData.fromJson(Map<String, dynamic> json) {
    return ExamData(
      hata: json['hata'] ?? true,
      hataMesaji: json['hataMesaji'] ?? '',
      nesne: json['nesne'],
    );
  }
}

class ExamNesne {
  String tarihSaat;
  String dersAdi;
  String dersKodu;
  String tur;
  String derslikler;

  ExamNesne({
    required this.tarihSaat,
    required this.dersAdi,
    required this.dersKodu,
    required this.tur,
    required this.derslikler,
  });
  factory ExamNesne.fromJson(Map<String, dynamic> json) {
    return ExamNesne(
        tarihSaat: json['tarihSaat'] ?? '',
        dersAdi: json['dersAdi'] ?? '',
        dersKodu: json['dersKodu'] ?? '',
        tur: json['tur'] ?? '',
        derslikler: json['derslikler'] ?? '');
  }
}

Future<ExamData> getExamList(
    String userName, String password, String termId) async {

  final response = await http.post(
    Uri.parse(GET_EXAM_API),
    headers: {
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*",
    },
    body: jsonEncode(
      <String, String>{
        'ogrenciNumarasi': userName,
        'sifre': password,
        'donemId': termId
      },
    ),
  );
  if (response.statusCode == 200) {
    ExamData examData = ExamData.fromJson(jsonDecode(response.body));
    List<dynamic> examNesne = examData.nesne;
    ExamGList = examNesne;
    print(ExamGList[0]);
    return examData;
  } else {
    throw Exception('Error is ${response.body}');
  }
}

class Data {
  bool hata;
  String hataMesaji;
  Nesne nesne;

  Data({
    required this.hata,
    required this.hataMesaji,
    required this.nesne,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      hata: json['hata'] ?? true,
      hataMesaji: json['hataMesaji'] ?? '',
      nesne: Nesne.fromJson(json['nesne']),
    );
  }
}

class Nesne {
  String ogrenciNo;
  String adSoyad;
  String sifre;
  int dersSayisi;
  int okunmamisMesajSayisi;
  List<dynamic> donemler;
  List<dynamic> dersler;
  List mesajlar;
  List sinavProgrami;

  Nesne({
    required this.ogrenciNo,
    required this.adSoyad,
    required this.sifre,
    required this.dersSayisi,
    required this.okunmamisMesajSayisi,
    required this.donemler,
    required this.dersler,
    required this.mesajlar,
    required this.sinavProgrami,
  });

  factory Nesne.fromJson(Map<String, dynamic> json) {
    return Nesne(
      ogrenciNo: json['ogrenciNo'] ?? '',
      adSoyad: json['adSoyad'] ?? '',
      sifre: json['sifre'] ?? '',
      dersSayisi: json['dersSayisi'] ?? 0,
      okunmamisMesajSayisi: json['okunmamisMesajSayisi'] ?? 0,
      donemler: json['donemler'],
      dersler: json['dersler'] ?? [],
      mesajlar: json['mesajlar'] ?? [],
      sinavProgrami: json['sinavProgrami'] ?? [],
    );
  }
}

Future<Data> login(String userName, String password) async {
  final response = await http.post(
    Uri.parse(LOGIN_API),
    headers: {
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*",
    },
    body: jsonEncode(
      <String, String>{'ogrenciNumarasi': userName, 'sifre': password},
    ),
  );
  if (response.statusCode == 200) {
    Data data = Data.fromJson(jsonDecode(response.body));
    return data;
  } else {
    throw Exception('Failed to process ${response.body}');
  }
}

class Course {
  String subeId;
  String? dersKodu;
  String? dersAdi;
  String? subeNo;
  String? ogretimUyesi;
  String harf;
  String ortalama;
  List degerlendirmeler;

  Course({
    required this.subeId,
    required this.dersKodu,
    required this.dersAdi,
    required this.subeNo,
    required this.ogretimUyesi,
    required this.harf,
    required this.ortalama,
    required this.degerlendirmeler,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      subeId: json['subeId'],
      dersKodu: json['dersKodu'] ?? null,
      dersAdi: json['dersAdi'] ?? null,
      subeNo: json['subeNo'] ?? null,
      ogretimUyesi: json['ogretimUyesi'] ?? null,
      harf: json['harf'] ?? '',
      ortalama: json['ortalama'] ?? '',
      degerlendirmeler: json['degerlendirmeler'] ?? [],
    );
  }
}

class Degerlendirme {
  String ad;
  int yuzde;
  int adet;
  String degerlendirmeFormul;
  Sinav? sinavlar;

  Degerlendirme({
    required this.ad,
    required this.yuzde,
    required this.adet,
    required this.degerlendirmeFormul,
    required this.sinavlar,
  });
}

class Sinav {
  int sinavNo;
  int puan;
  String puanDetay;

  Sinav({
    required this.sinavNo,
    required this.puan,
    required this.puanDetay,
  });
}

Future<Course> getCourseContent(String ogrenciNumarasi, String subeId) async {
  final response = await http.post(
    Uri.parse(GET_COURSE_API),
    headers: {
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*",
    },
    body: jsonEncode(
      <String, String>{
        "ogrenciNumarasi": ogrenciNumarasi,
        "subeId": subeId,
      },
    ),
  );
  if (response.statusCode == 200) {
    Course course = Course.fromJson(jsonDecode(response.body));
    degerlendirmeListesi = course.degerlendirmeler;
    return course;
  } else {
    throw Exception('Error is ${response.body}');
  }
}
