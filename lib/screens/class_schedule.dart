import 'package:flutter/material.dart';

class ClassSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Table"),
      ),
      body: Container(
        height: mediaQuery.height * 0.3,
        width: mediaQuery.width,
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 200,
            width: 600,
            padding: EdgeInsets.all(12),
            child: DataTable(
              dividerThickness: 1.8,
              columns: [
                DataColumn(
                  label: Text("Monday"),
                ),
                DataColumn(
                  label: Text("attendence"),
                ),
                DataColumn(
                  label: Text("sdfsdf"),
                ),
                DataColumn(
                  label: Text("werwer"),
                ),
                DataColumn(
                  label: Text("attendedgffnce"),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                    DataCell(
                      Text("akshs"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle kRowTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);
