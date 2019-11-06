import 'package:flutter/material.dart';
import 'package:mazhab/model/mazhab_model.dart';

class Hasil extends StatefulWidget {
  
  final Map<dynamic,List<dynamic>> hasil;

  Hasil({Key key, @required this.hasil});

  @override
  _HasilState createState() => _HasilState();
}

class _HasilState extends State<Hasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hasil")),
      body: Container(
        child: Column(
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
          ],
        ),
      ),
      
    );
  }
}