import 'dart:io';
import 'package:excel/excel.dart';
import '../utils/excel_features.dart';

class FileCtrl {
  FileCtrl();

  readExcelFile(String pathFile) {
    var bytes = File(pathFile).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    List<String> listNameSheet = listOfSheet(excel);
    Map<int, List<String>> dataStore = storeData(excel, listNameSheet[0]);
    return dataStore;
  }

  createFolderParent(String directoryName) async {
    var newDirectory = await Directory(directoryName).create(recursive: true);
    print(newDirectory.path);
  }
}

final fileCtrl = FileCtrl();
