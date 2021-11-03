import 'dart:math';

class Calcouator{
  final int height;
  final int weight;

  Calcouator(this.height, this.weight);

  double _bmi;
  String calcoulatBMI(){
   _bmi =weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getRes(){
    if (_bmi>=25){
      return 'over Weight';
    }else if (_bmi>=18){
      return 'Normal Weight';
    }else{
      return 'Under Weight';
    }
  }
  String getinterpitation(){
    if (_bmi>=25){
      return 'You have a higher than normal body weight. try to exercise more!';
    }else if (_bmi>=18){
      return 'You have a Normal body weight . Good Job.';
    }else{
      return 'You have a lower than normal weight. You can eat a bit more .';
    }
  }
}