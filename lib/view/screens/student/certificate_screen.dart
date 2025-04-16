import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/certificate_controller.dart';
import 'package:school/controller/student/certificates_controller.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/certificate_widgets/certificate_widget.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CertificateController());

    Get.put(CertificatesController());

    return Scaffold(
      appBar: AppBar(
        title: Text('الشهادات'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: AppColor.kOtherColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppPadding.kDefaultPadding * 3),
              topRight: Radius.circular(AppPadding.kDefaultPadding * 3),
            )),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 10, 6, 0),
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.certificates.length,
              itemBuilder: (context, index) {
                final certificate = controller.certificates[index];
                return CertificateCard(certificate: certificate);
              },
            );
          }),
        ),
      ),
    );
  }
}
