class StandarFormatWaktu {
  // Helper function to format date with day name
  static String formatTanggalLengkap(
    DateTime dateTime, {
    bool useMonthName = true,
  }) {
    
    final dayName = formatNamaHari(dateTime.weekday - 1);
    if (useMonthName) {
      final monthName = formatNamaBulan(dateTime.month - 1);
      return '$dayName, ${dateTime.day} $monthName ${dateTime.year}';
    } else {
      return '$dayName, ${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

  // Helper function to format time with optional seconds
  static String formatJam(DateTime dateTime, {bool includeSeconds = false}) {
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String second = dateTime.second.toString().padLeft(2, '0');
    return includeSeconds ? '$hour:$minute:$second WIB' : '$hour:$minute WIB';
  }

  static String formatNamaBulan(int bulan) {
    switch (bulan) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maret';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Agustus';
      case 9:
        return 'September';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      case 12:
        return 'Desember';
      default:
        return '';
    }
  }

  static String formatNamaHari(int hari) {
    switch (hari) {
      case 1:
        return 'Senin';
      case 2:
        return 'Selasa';
      case 3:
        return 'Rabu';
      case 4:
        return 'Kamis';
      case 5:
        return 'Jumat';
      case 6:
        return 'Sabtu';
      case 7:
        return 'Minggu';
      default:
        return '';
    }
  }
}
