import 'package:random_string/random_string.dart';

String generateFolderName() {
  return 'folder_${randomAlpha(4)}';
}
