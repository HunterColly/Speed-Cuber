import 'package:SpeedCuber/classes/curent_time.dart';

class Dependencies {
  final Stopwatch stopwatch = new Stopwatch();
  CurrentTime currentTime;
  List<String> savedTime = List<String>();

  Dependencies({
    this.savedTime,
  });

  Dependencies.fromMap(Map<String, dynamic> map) :
    savedTime = map['savedTime'];

  updateTitle(title){
    this.savedTime = savedTime;
  }

  Map toMap(){
    return {
      'savedTime': savedTime,
    };
  }

  transformMilliSecondsToString(int milliseconds) {
    currentTime = transformMilliSecondsToTime(stopwatch.elapsedMilliseconds);

    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString();
    String secondsMinStr = (seconds % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString();
    if (currentTime.minutes > 0) {
      return '$minutesStr:$secondsMinStr.$hundredsStr';
    } else {
      return '$secondsStr.$hundredsStr';
    }
  }

  transformMilliSecondsToTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    return CurrentTime(
      hundreds: hundreds % 100,
      seconds: seconds % 60,
      minutes: minutes % 60,
    );
  }
}
