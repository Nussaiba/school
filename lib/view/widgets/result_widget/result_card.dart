import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/data/model/result_model.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.result,
  });

  final ResultModel result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppPadding.kDefaultPadding),
      padding: EdgeInsets.all(AppPadding.kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: AppColor.ksecondColor,
          borderRadius: BorderRadius.circular(AppPadding.kDefaultPadding),
          boxShadow: [
            BoxShadow(
              color: AppColor.kTextLightColor,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                result.subjectName!,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${result.obtainedMarks!.toString()} / ${result.totalMarks!.toString()}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: result.totalMarks!.toDouble(),
                        height: 18,
                        decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(AppPadding.kDefaultPadding),
                              bottomRight:
                                  Radius.circular(AppPadding.kDefaultPadding),
                            )),
                      ),
                      Container(
                        height: 16,
                        width: result.obtainedMarks!.toDouble(),
                        decoration: BoxDecoration(
                            color: result.grade! == 'D'
                                ? AppColor.kErrorColor
                                : AppColor.kOtherColor,
                            borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(AppPadding.kDefaultPadding),
                              bottomRight:
                                  Radius.circular(AppPadding.kDefaultPadding),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    result.grade!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
