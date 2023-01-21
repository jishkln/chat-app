import 'package:intl/intl.dart';

String duTimeLineFormat(DateTime dt) {
  var now = DateTime.now();
  var differnce = now.difference(dt);
  if (differnce.inMinutes < 60) {
    return "${differnce.inMinutes} m ago";
  } else if (differnce.inHours < 24) {
    return "${differnce.inHours} h ago";
  } else if (differnce.inDays < 30) {
    return "${differnce.inDays} d ago";
  } else if (differnce.inDays < 365) {
    final dtFormat = DateFormat("MM-dd");
    return dtFormat.format(dt);
  } else {
    final dtFormat = DateFormat("yyyy-MM-dd");
    var str = dtFormat.format(dt);
    return str;
  }
}
