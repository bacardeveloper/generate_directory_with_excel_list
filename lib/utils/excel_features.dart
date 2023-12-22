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
    for (var cell in rowTable) {
      int column = cell!.columnIndex;
      String value = cell.value.toString();
      bool containOrNot = organizedData.containsKey(column);
      bool emptyOrNot = verifyDataInCellEmpty(value);

      if (emptyOrNot == false) {
        if (containOrNot) {
          organizedData[column]?.add(value);
        } else {
          organizedData[column] = [];
          organizedData[column]?.add(value);
        }
      }
    }
  }
  return organizedData;
}

bool verifyDataInCellEmpty(String cellData) => cellData.trim().isEmpty;
