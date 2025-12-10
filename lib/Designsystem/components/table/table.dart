import 'package:flutter/material.dart';

class GTTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;

  const GTTable({Key? key, required this.columns, required this.rows})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: columns, rows: rows),
    );
  }
}
