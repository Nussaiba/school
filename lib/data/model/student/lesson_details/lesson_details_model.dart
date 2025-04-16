class LessonDetailsModel {
  final int? id;
  final int ?lessonId;
  final int ?teacherId;
  final int ?roomId;
  final int ?termId;
  final String? video;
  final String? typeVideo;
  final String? quiz;
  final String? test;
  final String? exam;
  final String? addition;
  final String type;
  final String? typeFile;
  final String? extension;
  final String? startTime;
  final String? endTime;
  final String? nameHomework;
  final String? homeworkLink;
  final String? nameQuiz;
  final String? nameExam;
  final String? nameAudio;
  final String? audioLink;
  final String? audioFile;
  final String? nameVideo;
  final String ?nameAddition;
  final String? additionLink;
  final int? typeVoice;
  final int? lectureId;
  final String? isGlobal;
  final String? period;
  final String? note;
  final int? successMark;
  final dynamic? examStatus;
  final int? classId;
  final String? selectedQues;
  final int ?hasTraditional;
  final String? testLink;
  final String? videoLink;
  final String? quizLink;
  final String? examLink;
  final String? nameQuiz1;
  final String? quizLink1;
  final String? quiz1;
  final String? coorId;
  final String? key;
  final String? createdAt;

  LessonDetailsModel({
     this.id,
     this.lessonId,
     this.teacherId,
     this.roomId,
     this.termId,
    this.video,
    this.typeVideo,
    this.quiz,
    this.test,
    this.exam,
    this.addition,
    required this.type,
    this.typeFile,
    this.extension,
    this.startTime,
    this.endTime,
    this.nameHomework,
    this.homeworkLink,
    this.nameQuiz,
    this.nameExam,
    this.nameAudio,
    this.audioLink,
    this.audioFile,
    this.nameVideo,
     this.nameAddition,
    this.additionLink,
    this.typeVoice,
     this.lectureId,
     this.isGlobal,
    this.period,
    this.note,
    this.successMark,
    this.examStatus,
    this.classId,
    this.selectedQues,
    required this.hasTraditional,
    this.testLink,
    this.videoLink,
    this.quizLink,
    this.examLink,
    this.nameQuiz1,
    this.quizLink1,
    this.quiz1,
    this.coorId,
    this.key,
     this.createdAt,
  });

  factory LessonDetailsModel.fromJson(Map<String, dynamic> json) {
    return LessonDetailsModel(
        id: json['id'],
        lessonId: json['lesson_id'],
        teacherId: json['teacher_id'],
        roomId: json['room_id'],
        termId: json['term_id'],
        video: json['video'],
        typeVideo: json['type_video'],
        quiz: json['quize'],
        test: json['test'],
        exam: json['exam'],
        addition: json['addition'],
        type: json['type'],
        typeFile: json['type_file'],
        extension: json['extension'],
        startTime: json['start_time'],
        endTime: json['end_time'],
        nameHomework: json['namehomework'],
        homeworkLink: json['homework_link'],
        nameQuiz: json['name_quize'],
        nameExam: json['name_exam'],
        nameAudio: json['name_audio'],
        audioLink: json['audio_link'],
        audioFile: json['audio_file'],
        nameVideo: json['name_video'],
        nameAddition: json['name_addition'],
        additionLink: json['addition_link'],
        typeVoice: json['type_voice'],
        lectureId: json['lecture_id'],
        isGlobal: json['is_global'],
        period: json['period'],
        note: json['note'],
        successMark: json['success_mark'],
        examStatus: json['exam_status'],
        classId: json['class_id'],
        selectedQues: json['selected_ques'],
        hasTraditional: json['has_traditional'],
        testLink: json['test_link'],
        videoLink: json['video_link'],
        quizLink: json['quiz_link'],
        examLink: json['exam_link'],
        nameQuiz1: json['name_quize1'],
        quizLink1: json['quiz_link1'],
        quiz1: json['quize1'],
        coorId: json['coor_id'],
        key: json['key'],
        createdAt: json['created_at']
        
        );
  }
}
