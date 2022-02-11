import 'package:flutter/cupertino.dart';
import 'package:obs_bproce/about_us/about_us_view.dart';
import 'package:obs_bproce/announcement/announcement.dart';
import 'package:obs_bproce/exams/view.dart';
import 'package:obs_bproce/login/login.dart';

import '../change_password/change_password.dart';
import '../contact_us/view.dart';
import '../courses/my_courses.dart';
import '../exam_place/view.dart';

class ImageData {
  final String id;
  final String imagePath;
  final Widget navigationLink;
  final String title;

  const ImageData({
    required this.id,
    required this.imagePath,
    required this.navigationLink,
    required this.title,
  });
}

List<ImageData> imageList = [
  const ImageData(
    id: '1',
    imagePath: 'assets/images/derslerim.png',
    navigationLink: MyCourses(),
    title: 'Derslerim',
  ),
  ImageData(
    id: '2',
    imagePath: 'assets/images/sinavlarim.png',
    navigationLink: ExamInformationView(),
    title: 'Sınavlarım',
  ),
  const ImageData(
    id: '3',
    imagePath: 'assets/images/duyuru.png',
    navigationLink: Announcement(),
    title: 'Duyurular',
  ),
  ImageData(
    id: '4',
    imagePath: 'assets/images/sinavyerim.png',
    navigationLink: ExamPlaceView(),
    title: 'Sınav Yerim',
  ),
  const ImageData(
    id: '5',
    imagePath: 'assets/images/contact_us.png',
    navigationLink: ContactUsView(),
    title: 'İletişim',
  ),
  ImageData(
    id: '7',
    imagePath: 'assets/images/info_icon_5.jpeg',
    navigationLink: AboutUs(),
    title: 'Hakkımızda',
  ),
  ImageData(
    id: '6',
    imagePath: 'assets/images/change_password.png',
    navigationLink: ChangePasswordPage(),
    title: 'Sifre Değiştir',
  ),
  ImageData(
    id: '8',
    imagePath: 'assets/images/log_out.png',
    navigationLink: Login(),
    title: 'Güvenli Çıkış',
  ),
];

List<ImageData> imageListForMenu = [
  const ImageData(
    id: '1',
    imagePath: 'assets/images/derslerim.png',
    navigationLink: MyCourses(),
    title: 'Derslerim',
  ),
  ImageData(
    id: '2',
    imagePath: 'assets/images/sinavlarim.png',
    navigationLink: ExamInformationView(),
    title: 'Sınavlarım',
  ),
  const ImageData(
    id: '3',
    imagePath: 'assets/images/duyuru.png',
    navigationLink: Announcement(),
    title: 'Duyurular',
  ),
  ImageData(
    id: '4',
    imagePath: 'assets/images/sinavyerim.png',
    // navigationLink: ExamPlaceView(),
    navigationLink: ExamPlaceView(),
    title: 'Sınav Yerim',
  ),
  const ImageData(
    id: '5',
    imagePath: 'assets/images/contact_us.png',
    navigationLink: ContactUsView(),
    title: 'İletişim',
  ),
  ImageData(
    id: '7',
    imagePath: 'assets/images/info_icon_5.jpeg',
    navigationLink: AboutUs(),
    title: 'Hakkımızda',
  ),
  ImageData(
    id: '6',
    imagePath: 'assets/images/change_password.png',
    navigationLink: ChangePasswordPage(),
    title: 'Şifre Değiştir',
  )
];
