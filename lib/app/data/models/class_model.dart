class ClassModel {
  final String classTitle;
  final String classVideo;
  final String classDescription;

  ClassModel({
    required this.classTitle,
    required this.classVideo,
    required this.classDescription,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'course_title': courseTitle,
  //     'course_author': courseAuthor,
  //     'course_image': courseImage,
  //     'course_playlist': coursePlaylist,
  //   };
  // }

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    classTitle: json["class_title"],
    classVideo: json["class_video"],
    classDescription: json["class_description"],
  );
}