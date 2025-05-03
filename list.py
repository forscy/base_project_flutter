import os
# Tentukan path ke folder '.' dalam proyek Flutter
flutter_lib_directory = '.'

# Simpan output ke file
output_file = 'docs/prompt/context/struktur-project.txt'

with open(output_file, 'w') as f:
    for root, dirs, files in os.walk(flutter_lib_directory):
        for file in files:
            f.write(os.path.join(root, file) + '\n')
            print(os.path.join(root, file))