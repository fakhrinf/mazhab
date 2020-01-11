import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mazhab/biografi.dart';
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
            Center(child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hasil Identifikasi", style: TextStyle(
                  fontSize: 24
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text("Mazhab tertinggi yang digunakan adalah", style: TextStyle(
                  fontSize: 14,
                )),
              ),
              FlatButton( 
                shape: StadiumBorder(),
                splashColor: Colors.black12,
                highlightColor: Colors.transparent,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Biografi(mazhab: widget.hasil['output'][0].getMazhab(), biografi: widget.hasil['output'][0].getBiografi()))),
                child: Text("Mazhab ${widget.hasil['output'][0].getMazhab()}", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline
                )),
              )
            ])),
            DataTable(
              columns: [
                DataColumn(label: Text("Mazhab")),
                DataColumn(label: Text("Probabilitas")),
                DataColumn(label: Text("Presentase")),
              ],
              rows: widget.hasil['output'].asMap().entries.map((MapEntry data) {
                return DataRow(
                  cells: [
                    DataCell(Text(widget.hasil['output'][data.key].getMazhab())),
                    DataCell(Text(widget.hasil['output'][data.key].getProbability())),
                    DataCell(Text("${widget.hasil['output'][data.key].getPresentation().toStringAsFixed(9)}%")),
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

