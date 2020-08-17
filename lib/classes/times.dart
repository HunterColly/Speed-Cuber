class Times{
  String time;

  Times({
    this.time,
  });

  Times.fromMap(Map<String, dynamic> map) :
    time = map['time'];

  updateTitle(title){
    this.time = time;
  }

  Map toMap(){
    return {
      'time': time,
    };
  }
}