enum UserRole {
  admin('Admin'),
  mahasiswa('Mahasiswa'),
  panitia('Panitia'),
  dosen('Dosen');
  
  final String value;
  const UserRole(this.value);
  
  @override
  String toString() => value;
}

class UserModel {
  final int id;
  final String nama;
  final String email;
  final String? noTelp;
  final String agama;
  final String? password; // Ubah password menjadi nullable
  final String? fotoUrl;
  final UserRole role;
  final String? token;

  const UserModel({
    required this.id,
    required this.nama,
    required this.email,
    this.noTelp,
    required this.agama,
    this.password, // Ubah password menjadi nullable di constructor
    this.fotoUrl,
    required this.role,
    this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'noTelp': noTelp,
      'agama': agama,
      'password': password, // Tetap nullable di toJson
      'fotoUrl': fotoUrl,
      'role': role.name,
      'token': token,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      nama: json['nama'] as String,
      email: json['email'] as String,
      noTelp: json['noTelp'] as String?,
      agama: json['agama'] as String,
      password: json['password'] as String?, // Ubah password menjadi nullable di fromJson
      fotoUrl: json['fotoUrl'] as String?,
      role: _parseRole(json['role']),
      token: json['token'] as String?,
    );
  }

  static UserRole _parseRole(String role) {
    switch (role.toLowerCase()) {
      case 'admin':
        return UserRole.admin;
      case 'mahasiswa':
        return UserRole.mahasiswa;
      case 'panitia':
        return UserRole.panitia;
      case 'dosen':
        return UserRole.dosen;
      default:
        throw ArgumentError('Invalid role: $role');
    }
  }

  UserModel copyWith({
    int? id,
    String? nama,
    String? email,
    String? Function()? noTelp,
    String? agama,
    String? Function()? password, // Ubah password menjadi nullable di copyWith
    String? Function()? fotoUrl,
    UserRole? role,
    String? Function()? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      email: email ?? this.email,
      noTelp: noTelp != null ? noTelp() : this.noTelp,
      agama: agama ?? this.agama,
      password: password != null ? password() : this.password, // Tetap nullable di copyWith
      fotoUrl: fotoUrl != null ? fotoUrl() : this.fotoUrl,
      role: role ?? this.role,
      token: token != null ? token() : this.token,
    );
  }
}