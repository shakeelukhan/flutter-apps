import 'package:flutter/material.dart';

class DataTableHelper {
  List<String> tableHeaders = List<String>();
  List<List<String>> tableRows = List<List<String>>();

  List<DataColumn> setDataTableHeaders(List<String> tableHeaders) {
    this.tableHeaders = tableHeaders;
  }

  List<DataColumn> getDataTableHeaders() {
    return tableHeaders
        .map((header) => DataColumn(
              label: Text(header),
              numeric: false,
            ))
        .toList();
  }

  List<DataRow> getDataTableRows() {
    return tableRows
        .map(
          (row) => DataRow(
            cells: row.map((cell) => DataCell(Text(cell))).toList(),
          ),
        )
        .toList();
  }
}
