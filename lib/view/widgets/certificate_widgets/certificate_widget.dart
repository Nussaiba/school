import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/data/model/certificate_model.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard({
    super.key,
    required this.certificate,
  });

  final Certificate certificate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.all(8),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('شهادة تقدير ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColor.kTextLightColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                          )),
                ),
                Text('المادة: ${certificate.subject}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.kpraimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        )),
                SizedBox(height: 8),
                Text('م. ${certificate.teacher}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.kTextLightColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                        )),
                SizedBox(height: 8),
                Text('الدرجة المستحقة: ${certificate.grade}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.kTextLightColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        )),
                SizedBox(height: 8),
                Text(' ${certificate.date}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.kTextLightColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        )),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Center(
                  child: Text('تهانينا!',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.w800,
                            fontSize: 16.0,
                          )),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 28,
          left: 18,
          child: Image.asset(
            AppImageAsset.certificateIcon,
            height: 80,
            width: 80,
          ),
        )
      ],
    );
  }
}
