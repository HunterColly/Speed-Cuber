import 'package:SpeedCuber/classes/curent_time.dart';

class Dependencies {
  final Stopwatch stopwatch = new Stopwatch();

  final List<String> savedTimeList = List<String>();

  transformMilliSecondsToString(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');

    return '$minutesStr : $secondsStr.$hundredsStr';
  }

  transformMilliSecondsToTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    return CurrentTime(
        hundreds: hundreds % 100,
        seconds: seconds % 60,
        minutes: minutes % 60,);
  }
}
