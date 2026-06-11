class Course {
  final String title;
  final String time;
  final String location;
  final String instructor;
  final int sks;
  final bool isBreak;

  Course({
    required this.title,
    this.time = '',
    this.location = '',
    this.instructor = '',
    this.sks = 0,
    this.isBreak = false,
  });
}