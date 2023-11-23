class CourseModel {
  final String courseTitle;
  final String courseAuthor;
  final String courseImage;
  final List<dynamic> coursePlaylist;

  CourseModel({
    required this.courseTitle,
    required this.courseAuthor,
    required this.courseImage,
    required this.coursePlaylist,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        courseTitle: json["course_title"],
        courseAuthor: json["course_author"],
        courseImage: json["course_image"],
        coursePlaylist: json["course_playlist"],
      );
}
