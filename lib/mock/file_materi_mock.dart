class FileMateriModel {
  final int id;
  final String urlFile;

  FileMateriModel({required this.id, required this.urlFile});

  factory FileMateriModel.fromJson(Map<String, dynamic> json) {
    return FileMateriModel(
      id: json['id'] as int,
      urlFile: json['urlFile'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'urlFile': urlFile};
  }
}

class FileMateriMock {
  static final List<FileMateriModel> fileMateri = [
    FileMateriModel(
      id: 1,
      urlFile: 'https://example.com/files/materi_pengenalan_quran.pdf',
    ),
    FileMateriModel(
      id: 2,
      urlFile: 'https://example.com/files/materi_tahsin_dasar.pdf',
    ),
    FileMateriModel(
      id: 3,
      urlFile: 'https://example.com/files/materi_tahfidz_metode.pdf',
    ),
    FileMateriModel(
      id: 4,
      urlFile: 'https://example.com/files/materi_kajian_islam.pptx',
    ),
    FileMateriModel(
      id: 5,
      urlFile: 'https://example.com/files/jadwal_kegiatan.xlsx',
    ),
  ];

  // Helper methods for FileMateriModel
  static FileMateriModel? getFileMateriById(int id) {
    try {
      return fileMateri.firstWhere((file) => file.id == id);
    } catch (e) {
      return null;
    }
  }
}
