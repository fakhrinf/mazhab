import 'package:mazhab/model/mazhab_model.dart';
import 'package:mazhab/model/ciriciri_model.dart';
import 'package:mazhab/model/cirimazhab_model.dart';

class NaiveBayes {
  
  static Future<Map<dynamic, dynamic>> calculate(List<int> ciriciri_id) async {

    var selected_mazhab = new List<dynamic>();
    List<MazhabModel> mazhab = await MazhabModel.getAllMazhab();
    List<CiriciriModel> ciriciri = await CiriciriModel.getCiriCiri();

    var n = 1.0;
    var m = ciriciri.length;
    var x = mazhab.length;
    var pvj = 1/x;
    var nc = new List<dynamic>();
    var p = new List<dynamic>();
    var pfinal = new List<dynamic>();
    var prfinal = new List<dynamic>();
    var ncc = new List<dynamic>();
    var colection_mazhab_id = new List<dynamic>();
    var ii = 0;

    if(mazhab.length != 0) {
      for (var mi = 0; mi < mazhab.length; mi++) {
        colection_mazhab_id.add(mazhab[mi].id);
        pfinal.add(1.0);
        ncc.add(0);

        for (var i = 0; i < ciriciri_id.length; i++) {
          List<CiriMazhabModel> pivot = await CiriMazhabModel.getCiriMazhab_byid(ciriciri_id[i], mazhab[mi].id);
          if(pivot.length != 0) {
            nc.add({mi: 1.0}); 
            ncc[mi] += 1;
          }else{
            nc.add({mi: 0.0}); 
          }
          var c = ((nc[ii][mi] + (m*pvj)) / (n+m)).toStringAsFixed(6);
          p.add({mi: double.parse(c)});
          pfinal[mi] = pfinal[mi] * p[ii][mi];
          ii++;
        }

        pfinal[mi] = (pvj * pfinal[mi]).toStringAsFixed(9);
        List<CiriMazhabModel> nn = await CiriMazhabModel.getCiriMazhab_byid(0, mazhab[mi].id);
        double y = (1/nn.length) * 100;
        double x = y * ncc[mi];
        prfinal.add(x);
      }
      
      final maxFinal = pfinal[0];
      print("MAX FINAL: $maxFinal");
      print("FINAL: $pfinal");
      print("FINAL: $prfinal");
    }

    return {'pfinal': pfinal, 'prfinal': prfinal};
  }

}