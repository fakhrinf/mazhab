import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mazhab/model/cirimazhab_model.dart';
import 'package:mazhab/model/mazhab_model.dart';
import 'package:mazhab/model/penjelasanciri_model.dart';

class Hasil extends StatefulWidget {
  
  final Map<dynamic,List<dynamic>> hasil;
  final List<PenjelasanCiriModel> penjelasan;

  Hasil({Key key, @required this.hasil, @required this.penjelasan});

  @override
  _HasilState createState() => _HasilState();
}

class _HasilState extends State<Hasil> {

  List<CiriMazhabModel> cirimazhab;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.penjelasan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hasil")),
      body: Container(
        child: ListView(
          children: <Widget>[
            Table(
              columnWidths: {
                0 : FlexColumnWidth(2),
                1 : FlexColumnWidth(2.5),
                2 : FlexColumnWidth(3),
                // 3 : FlexColumnWidth(1),
              },
              border: TableBorder.all(color: Colors.black87, width: 1),
              children: [TableRow(
                  children: [
                    TableCell(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("Mazhab")),
                    ), verticalAlignment: TableCellVerticalAlignment.middle,),
                    TableCell(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("Probabilitas")),
                    ), verticalAlignment: TableCellVerticalAlignment.middle,),
                    TableCell(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("Presentase Kepercayaan")),
                    ), verticalAlignment: TableCellVerticalAlignment.middle,),
                    // TableCell(child: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Center(child: Text("Urutan")),
                    // ), verticalAlignment: TableCellVerticalAlignment.middle,),
                  ]
                )],
            ),
            Table(
              columnWidths: {
                0 : FlexColumnWidth(2),
                1 : FlexColumnWidth(2.5),
                2 : FlexColumnWidth(3),
                // 3 : FlexColumnWidth(1),
              },
              border: TableBorder.all(color: Colors.black87, width: 1),
              children: widget.hasil['mazhab'].asMap().entries.map((MapEntry data) {
                MazhabModel mz = widget.hasil['mazhab'][data.key];
                return TableRow(
                  children: [
                    TableCell(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(mz.mazhab),
                    )),
                    TableCell(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(widget.hasil['pfinal'][data.key].toString())),
                    )),
                    TableCell(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("${widget.hasil['prfinal'][data.key].toStringAsFixed(9)}%")),
                    )),
                    // TableCell(child: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text("${data.key+1}"),
                    // )),
                  ]
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("* Presentasi kepercayaan digunakan jika terdapat mazhab dengan nilai probabilitas yang sama", style: TextStyle(fontSize: 12, color: Colors.black45)),
            ),
            Divider(height: 10, color: Colors.black45),
            Container(child: Text("Penjelasan ciri-ciri terpilih", style: TextStyle(color: Colors.black87, fontSize: 24)), alignment: Alignment.center),
            Divider(height: 30, color: Colors.transparent),
            Table(
              columnWidths: {
                0 : FlexColumnWidth(10),
                1 : FlexColumnWidth(2.5),
              },
              border: TableBorder.all(color: Colors.black87, width: 1),
              children: [
                TableRow(children: [
                  TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("Ciri-ciri"))),
                  TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("Mazhab")))
                ]),
              ],
            ),
            penjelasanTable()
          ],
        ),
      ),
    );
  }

  Widget penjelasanTable() {
    return Column(children: 
      widget.penjelasan.map((pnj) {
          return Column(
            children: <Widget>[
              Table(
                border: TableBorder.all(color: Colors.black87, width: 1),
                children: [TableRow(children: [
                  TableCell(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(pnj.category, style: TextStyle(fontWeight: FontWeight.bold),)),
                  ))])
                ]),
              Table(
                columnWidths: {
                  0 : FlexColumnWidth(10),
                  1 : FlexColumnWidth(2.5),
                },
                border: TableBorder.all(color: Colors.black87, width: 1),
                children:               
                pnj.penjelasan.map((dt) {

                  return TableRow(children: [
                    TableCell(child: Padding(padding: EdgeInsets.all(8), child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(dt.ciri),
                        Divider(height: 20, color: Colors.black87,),
                        Html(data: (dt.penjelasan == null) ? "-" : dt.penjelasan, defaultTextStyle: TextStyle(color: Colors.black54))
                      ],
                    ))),
                    TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text(dt.mazhab)))
                  ]);
                }).toList()
              )
            ],
          );
      }).toList()
    );
  }
}

