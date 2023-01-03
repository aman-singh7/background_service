import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class ExpenseModel {
  ExpenseModel({
    required this.amount,
  });

  @HiveField(0)
  num amount;
}
