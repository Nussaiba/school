import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class CertificateData {
  Crud crud;
  CertificateData(this.crud);

  getAllCertificatesData(String studentId) async {
    var response = await crud.getData("${AppLink.getCertificate}/$studentId");
    return response.fold((l) => l, (r) => r);
  }
}
