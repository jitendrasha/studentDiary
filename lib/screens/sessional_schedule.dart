import 'package:flutter/material.dart';

class SessionalSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sessional"),
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
            child: Table(
          border: TableBorder.all(color: Colors.black, width: 2),
          children: [
            TableRow(
              children: [
                TableCell(child: Opacity(opacity: 0)),
                TableCell(child: Text("9:10-10:00")),
                TableCell(child: Text("10:s- 10:50")),
                TableCell(child: Text("10:50-11:40")),
                TableCell(child: Text("11:40-12:30")),
                TableCell(child: Text("12:30-1:20")),
                TableCell(child: Text("Lunch")),
                TableCell(child: Text("1:20-2:00")),
                TableCell(child: Text("2:0-2:2:50")),
                TableCell(child: Text("2:50-3:40")),
                 TableCell(child: Text("3:40-4:30")),
              
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Text("Monday")),
                TableCell(child: Text("C++")),
                TableCell(child: Text("JAVA")),
                TableCell(child: Text("JAVA")),
                TableCell(child: Text("C")),
                TableCell(child: Text("DATA")),
                TableCell(child: Text("HR")),
                TableCell(child: Text("aptitude  classs")),
                TableCell(child: Text("")),
                TableCell(child: Text("aptitude  classs")),
                 TableCell(child: Text("2:50-3:40")),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Text("Wednesday")),
                TableCell(child: Text("AI")),
                TableCell(child: Text("WEbinar")),
                TableCell(child: Text("WEbinar")),
                TableCell(child: Text("PYTHON")),
                TableCell(child: Text("MINI Project")),
                TableCell(child: Text("HR")),
                TableCell(child: Text("aptitude  classs")),
                TableCell(child: Text("")),
                TableCell(child: Text("aptitude  classs")),
                TableCell(child: Text("2:50-3:40")),
            
              ], 
            ),
            TableRow(
              children: [
                TableCell(child: Text("THursday")),
                TableCell(child: Text("DS")),
                TableCell(child: Text("DS")),
                TableCell(child: Text("INterview")),
                TableCell(child: Text("HR")),
                TableCell(child: Text("aptitude  classs")),
                TableCell(child: Text("HR")),
                TableCell(child: Text("aptitude  classs")),
                TableCell(child: Text("")),
                TableCell(child: Text("aptitude  classs")),
                 TableCell(child: Text("2:50-3:40")),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Text("friday")),
                TableCell(child: Text("C")),
                TableCell(child: Text("opps")),
                TableCell(child: Text("c++")),
                TableCell(child: Text("c++")),
                TableCell(child: Text("love")),
                TableCell(child: Text("HR")),
                TableCell(child: Text("aptitude  classs")),
                TableCell(child: Text("")),
                TableCell(child: Text("aptitude  classs")),
                 TableCell(child: Text("2:50-3:40")),
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
