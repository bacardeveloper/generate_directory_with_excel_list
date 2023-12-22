import 'package:archive_tool/controllers/file_controller.dart';
import 'package:archive_tool/controllers/path_controller.dart';
import 'package:archive_tool/utils/generate_folder.dart';
import 'package:archive_tool/utils/random_string.dart';

void main() async {
  String currentPath = PathCtrl.getCurrentPath();
  String pathExcelFile = "$currentPath\\file_config_archive.xlsx";
  var dataStoreRead = fileCtrl.readExcelFile(pathExcelFile);
  String pathSaveMyWork = "$currentPath\\${generateFolderName()}";
  fileCtrl.createFolderParent(pathSaveMyWork);

  generateMainFolder(dataStoreRead, pathSaveMyWork);
}
