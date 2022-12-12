import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RupiahConverter {
  static String rupiah({required int value, required bool withRp}){
    final String hasil = NumberFormat("#,###").format(value).replaceAll(",", ".");
    return !withRp?hasil: "Rp $hasil";
  }


}
