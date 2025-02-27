import 'package:medicine_manager/functions/time/date_to_string.dart';

void main() {
  String currentDate = '09/12/2024';

  DateTime thisDAte = parseDate(currentDate);

  print(formatDate(thisDAte));
}
