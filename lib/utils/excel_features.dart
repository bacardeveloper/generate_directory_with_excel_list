import 'package:excel/excel.dart';

List<String> listOfSheet(Excel excelDecode) {
  List<String> listSheet = [];
  for (var sheet in excelDecode.tables.keys) {
    listSheet.add(sheet);
  }
  return listSheet;
}

Map<int, List<String>> storeData(Excel excelDecode, String sheetName) {
  Map<int, List<String>> organizedData = {};

  for (var rowTable in excelDecode.tables[sheetName]!.rows) {
    for (int columnIndex = 0; columnIndex < rowTable.length; columnIndex++) {
      var cell = rowTable[columnIndex];
      String value = cell?.value?.toString() ??
          ""; // Utilisez une chaîne vide comme valeur par défaut
      bool emptyOrNot = verifyDataInCellEmpty(value);

      if (emptyOrNot == false) {
        if (organizedData.containsKey(columnIndex)) {
          organizedData[columnIndex]!.add(value);
        } else {
          organizedData[columnIndex] = [value];
        }
      }
    }
  }

  return organizedData;
}

bool verifyDataInCellEmpty(String cellData) => cellData.trim().isEmpty;
