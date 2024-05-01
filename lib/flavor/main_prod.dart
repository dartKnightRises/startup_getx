import 'env.dart';
import '../main.dart';

void main(){
  Constants.setEnvironment(Environment.prod);
  mainDelegate();
}