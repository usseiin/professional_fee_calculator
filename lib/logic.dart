import 'dart:developer';

import 'package:professional_fee_calculator/model/professional.dart';

double calculateFee(Map<dynamic, double> feeScale, double sum) {
  var balance = sum;
  var fee = 0.0;
  var isStop = false;
  while (balance > 0 || !isStop) {
    for (var i = 0; i < feeScale.length; i++) {
      final key = feeScale.keys.toList()[i];
      final percent = feeScale[key];
      if (key is num) {
        var amount = (key as int) * 1000000;
        if (balance >= amount) {
          var s = amount * (percent! / 100);
          fee += s;
          // log("percentage value ($percent of $amount): $s => $fee");
          balance -= amount;
        } else {
          var s = balance * (percent! / 100);
          fee += s;
          // log("percentage value ($percent of $balance): $s => $fee");
          balance = 0;
          isStop = true;
          break;
        }
      } else {
        var amount = balance;
        var s = amount * (percent! / 100);
        fee += s;
        // log("percentage value ($percent of $amount): $s => $fee");
        balance = 0;
        break;
      }
    }
    isStop = true;
  }

  return fee;
}

double calculateReinburstment(double fee, int rate) {
  final reinburstment = ((rate / 100) * (fee * .01));
  return reinburstment;
}

const sum = 460807043.60;
String calculateProjectProfessionalFee(
  double sum,
  List<Professional> profs, {
  bool includeReinburstMent = true,
  bool includeContigency = true,
  bool includeVat = true,
}) {
  // const sum = 409783330.27;

  var fee = 0.0;

  for (var prof in profs) {
    final a = calculateFee(prof.scaleOfFee, sum);
    log("fee: $a");

    var r = 0.0;
    if (includeReinburstMent) {
      r = calculateReinburstment(sum, prof.reinburstmentRateInPercent);
      log("rein: $r");
    }
    fee += a + r;
  }

  var vat = 0.0;
  if (includeVat) {
    vat = addVat(fee);
    log("VAT: $vat");
  }

  fee = fee + vat;

  return fee.toStringAsFixed(2);
}

double addVat(double fee) {
  return 0.075 * fee;
}
