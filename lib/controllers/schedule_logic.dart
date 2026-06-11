import '../models/course_model.dart';

class ScheduleLogic {
  static bool isLoggedIn = false;

  // 1. Logic untuk mendapatkan jadwal hari ini
  static List<Course> getTodaysClasses() {
    return [
      Course(title: 'Desain Web', time: '08:00 - 10:30 WIB', location: 'Lab Software', instructor: 'M. Arqam Salam'),
      Course(title: 'Bahasa Inggris II', time: '13:00 - 14:30 WIB', location: 'Ruangan Teori', instructor: 'Jajang Nooralam'),
    ];
  }

  // 2. Logic untuk mendapatkan seluruh jadwal (Timeline)
  static List<Course> getScheduleTimeline() {
    return [
      Course(title: 'Desain Web', time: '08:00', location: 'Lab Software'),
      Course(title: 'Istirahat', time: '10:30', isBreak: true),
      Course(title: 'Bahasa Inggris II', time: '13:00', location: 'Lab Software'),
    ];
  }

  // 3. Logic untuk mendapatkan daftar semua mata kuliah
  static List<Course> getAllCourses() {
    return [
      Course(title: 'Desain Web', sks: 3, instructor: 'Muhammad Arqam Salam, M.Kom.'),
      Course(title: 'Jaringan Komputer Dasar', sks: 3, instructor: 'Muhammad Arqam Salam, M.Kom.'),
      Course(title: 'Bahasa Inggris II', sks: 2, instructor: 'Jajang Nooralam, M.Pd.'),
      Course(title: 'Grafika Komputer', sks: 3, instructor: 'M. Syahdan, S.Kom.'),
    ];
  }

  // 4. Logic profil user
  static Map<String, String> getUserProfile() {
    return {
      'greeting': 'Halo,',
      'name': 'Muhammad Widad Murtadhy',
      'nim': '3202439018',
      'prodi': 'Teknik Informatika',
      'semester': '4',
      'email': 'muhammad.widad@mhs.ac.id'
    };
  }
}