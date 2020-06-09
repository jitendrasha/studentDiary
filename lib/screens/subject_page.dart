import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutterapp/bloc/pdf/bloc.dart';
import 'package:flutterapp/models/subjects_model.dart' show Subject;
import 'package:flutterapp/screens/pdf_screen.dart';
import 'package:flutterapp/services/user_repository.dart';

class SubjectPage extends StatelessWidget {
  final Subject subject;

  SubjectPage({Key key, @required this.subject}) : super(key: key);

  var _chartSize = const Size(90.0, 90.0);

  double value = 50.0;
  Color labelColor = Colors.blue[200];
  @override
  Widget build(BuildContext context) {
    print(subject.attendence);
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.subName),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Attendance",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                shadowColor: Colors.grey[200].withOpacity(.2),
                elevation: 12,
                child: Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Attendance",
                        style: TextStyle(fontSize: 20),
                      ),
                      AnimatedCircularChart(
//                        key: _chartKey,
                        size: _chartSize,
                        duration: Duration(seconds: 1),
                        initialChartData: [
                          CircularStackEntry(
                            <CircularSegmentEntry>[
                              new CircularSegmentEntry(
                                subject.attendence?.toDouble() ?? 0,
                                Colors.green,
                                rankKey: 'percentage',
                              ),
                            ],
                          ),
                        ],
                        chartType: CircularChartType.Radial,
                        edgeStyle: SegmentEdgeStyle.round,
                        percentageValues: true,
                        holeLabel: '${subject.attendence ?? 0}%',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Sallybus",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => PdfViewerBloc(
                            RepositoryProvider.of<UserRepository>(context))
                          ..add(LoadPdf(subject.sallybusPdf)),
                        child: PDFViewerScreen(),
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  shadowColor: Colors.grey[200].withOpacity(.2),
                  elevation: 12,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/pdf.png"),
                      alignment: Alignment.centerRight,
                      fit: BoxFit.fitHeight,
                    )),
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.centerLeft,
                    height: 100,
                    child: Text(
                      "Sallybus",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Suggested books",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              if (subject.books != null)
                ...subject.books
                    .map(
                      (e) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        shadowColor: Colors.grey[200].withOpacity(.2),
                        elevation: 12,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(e.image),
                                alignment: Alignment.centerRight,
                                fit: BoxFit.cover,
                              )),
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.centerLeft,
                          height: 100,
                          child: Text(
                            e.name,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    )
                    .toList()
              else
                Align(
                  alignment: Alignment.center,
                  child: Text("No Book Found"),
                ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Teachers",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              subject.teacherDetails != null
                  ? ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://png.pngtree.com/png-clipart/20190520/original/pngtree-vector-users-icon-png-image_4144740.jpg"),
                      ),
                      title: Text("${subject.teacherDetails['name'] ?? ''}"),
                    )
                  : Center(
                      child: Text("No Teacher Assigned "),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
