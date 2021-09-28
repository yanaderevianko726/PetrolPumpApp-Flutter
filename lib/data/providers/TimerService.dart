import 'dart:async';

Timer setTimerWithDuration(int secondInt, Function callback){
  Timer timer = Timer.periodic(
    Duration(seconds: secondInt), (Timer timer) {
      callback();
    },
  );
  return timer;
}