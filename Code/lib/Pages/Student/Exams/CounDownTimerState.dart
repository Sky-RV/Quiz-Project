import 'dart:async';
import 'package:get/get.dart';

class CountDownTimerState extends GetxController{

  var SCount = 10;
  late Timer _timer;

  void StateTimerStart(){

    _timer = Timer.periodic(Duration(minutes: 9, seconds: 59), (timer) {

      if(SCount > 0){
        SCount--;
        update();
      }
      else{
        _timer.cancel();
      }
    }
    );
  }

  // user can set count down seconds, from TextField
  void setnumber(var num){

    SCount = int.parse(num);
    update();

  }

  // pause the timer
  void Pause(){
    _timer.cancel();
    update();
  }

  // reset count value to 10
  void reset(){
    _timer.cancel();
    SCount = 10 ;
    update();
  }

}