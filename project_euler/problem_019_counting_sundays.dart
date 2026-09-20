// Problem 19: how many Sundays fell on the first of the month during the
// twentieth century (1 Jan 1901 to 31 Dec 2000)? Dart's DateTime knows
// the calendar, so just count.
int countSundays(int fromYear, int toYear) {
  var n = 0;
  for (var y = fromYear; y <= toYear; y++) {
    for (var m = 1; m <= 12; m++) {
      if (DateTime.utc(y, m, 1).weekday == DateTime.sunday) n++;
    }
  }
  return n;
}
