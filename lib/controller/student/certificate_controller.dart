
import 'package:get/get.dart';
import 'package:school/data/model/certificate_model.dart';


class CertificateController extends GetxController {
  var certificates = <Certificate>[
    Certificate(
        subject: 'رياضيات',
        date: '2024-10-21',
        teacher: 'أحمد علي',
        grade: '95'),
    Certificate(
        subject: 'علوم', date: '2024-09-15', teacher: 'سارة محمد', grade: '88'),
    Certificate(
        subject: 'لغة عربية',
        date: '2024-08-10',
        teacher: 'مريم خالد',
        grade: '92'),
    Certificate(
        subject: 'تاريخ', date: '2024-07-05', teacher: 'علي حسن', grade: '85'),
  ].obs;
}