class PurIn {
  final String purcodeSys;
  final String indate;
  final double inqty;
  final double uprice;
  final double amount;
  final double tax;
  final double totalamount;

  PurIn({
    required this.purcodeSys,
    required this.indate,
    required this.inqty,
    required this.uprice,
    required this.amount,
    required this.tax,
    required this.totalamount,
  });

  factory PurIn.fromJson(Map<String, dynamic> j, double Function(dynamic) toD) => PurIn(
        purcodeSys: (j['purcode_sys'] ?? j['purcodeSys'] ?? '').toString(),
        indate: (j['indate'] ?? '').toString(),
        inqty: toD(j['inqty']),
        uprice: toD(j['uprice']),
        amount: toD(j['amount']),
        tax: toD(j['tax']),
        totalamount: toD(j['totalamount']),
      );
}
