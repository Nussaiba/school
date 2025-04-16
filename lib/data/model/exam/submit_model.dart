// class Submit {
//   final int questionNumber; // رقم السؤال
//   final List<String> selectedOptions; // سلسلة الاختيارات

//   Submit({
//     required this.questionNumber,
//     required this.selectedOptions,
//   });
//    Map<String, dynamic> toMap() {
//     return {
//       questionNumber.toString(): selectedOptions,
//     };
//   }
//   @override
//   String toString() {
//     return ' $questionNumber  $selectedOptions';
//   }
// }

class Submit {
  final int questionNumber; // رقم السؤال
  final List<String> selectedOptions; // سلسلة الاختيارات
   String? traditionalAnswer; // الإجابة التقليدية (نص)

  Submit({
    required this.questionNumber,
    required this.selectedOptions,
    this.traditionalAnswer, // إضافة الإجابة التقليدية كخيار
  });

  Map<String, dynamic> toMap() {
    if (selectedOptions.isNotEmpty)
      return {
        questionNumber.toString(): selectedOptions,
      };
    else {
      return {
        questionNumber.toString(): traditionalAnswer,
      };
    }
  }

  @override
  String toString() {
    return 'Question Number: $questionNumber, Selected Options: $selectedOptions, Traditional Answer: $traditionalAnswer';
  }
}
