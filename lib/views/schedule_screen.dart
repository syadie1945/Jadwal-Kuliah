import 'package:flutter/material.dart';
import '../controllers/schedule_logic.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  // Data dummy untuk kalender mingguan di header
  final List<Map<String, String>> _weekDays = [
    {'day': 'SEN', 'date': '18'},
    {'day': 'SEL', 'date': '19'},
    {'day': 'RAB', 'date': '20'},
    {'day': 'KAM', 'date': '21'},
    {'day': 'JUM', 'date': '22'},
  ];

  int _selectedDateIndex = 0; // Index 0 (SEN, 18) sebagai default

  @override
  Widget build(BuildContext context) {
    // Memanggil logic data timeline
    final schedule = ScheduleLogic.getScheduleTimeline();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- HEADER & KALENDER ---
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    'Jadwal Kuliah',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 20),

                // Kalender Horizontal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_weekDays.length, (index) {
                    bool isSelected = _selectedDateIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDateIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFF37B23) : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text(
                                _weekDays[index]['day']!,
                                style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.white70,
                                    fontSize: 12
                                )
                            ),
                            const SizedBox(height: 5),
                            Text(
                                _weekDays[index]['date']!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal
                                )
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),

          // --- BODY TIMELINE ---
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF5F6FA),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: schedule.length,
                itemBuilder: (context, index) {
                  final course = schedule[index];
                  // Cek apakah ini item terakhir agar garis vertikal tidak diteruskan ke bawah
                  bool isLast = index == schedule.length - 1;

                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // 1. Teks Waktu
                        Column(
                          children: [
                            const SizedBox(height: 22), // Menyelaraskan teks dengan tengah card
                            Text(
                                course.time,
                                style: const TextStyle(fontSize: 13, color: Colors.black87)
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),

                        // 2. Garis Vertikal (Timeline Line)
                        Column(
                          children: [
                            const SizedBox(height: 28), // Titik mulai garis sejajar dengan teks
                            Expanded(
                              child: Container(
                                width: 2,
                                color: isLast ? Colors.transparent : Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),

                        // 3. Garis Horizontal Penghubung (Kecil)
                        Column(
                          children: [
                            const SizedBox(height: 28),
                            Container(width: 8, height: 2, color: Colors.grey.shade300),
                          ],
                        ),
                        const SizedBox(width: 8),

                        // 4. Card Informasi Mata Kuliah / Istirahat
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3)
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    course.title,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: course.isBreak ? FontWeight.normal : FontWeight.bold,
                                        color: course.isBreak ? Colors.grey : const Color(0xFF1E2746)
                                    )
                                ),
                                if (course.location.isNotEmpty) ...[
                                  const SizedBox(height: 6),
                                  Text(
                                      course.location,
                                      style: const TextStyle(color: Colors.grey, fontSize: 13)
                                  ),
                                ]
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}