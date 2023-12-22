import 'package:archive_tool/controllers/file_controller.dart';

void generateMainFolder(Map dataStoreRead, String pathSaveMyWork) {
  dataStoreRead.forEach((key, value) {
    fileCtrl.createFolderParent("$pathSaveMyWork\\${value[0]}");
    String pathParent = "$pathSaveMyWork\\${value[0]}";
    value.removeAt(0);
    value.forEach((elt) => fileCtrl.createFolderParent("$pathParent\\$elt"));
  });
}
