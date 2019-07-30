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
          (row) => DataRow(cells: [
                DataCell(
                  Text(row[0]),
                ),
                DataCell(
                  Text(row[1]),
                ),
                DataCell(
                  Text(row[2]),
                ),
              ]),
        )
        .toList();
  }
}
