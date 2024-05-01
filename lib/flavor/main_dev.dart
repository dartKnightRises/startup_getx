import '../main.dart';
import 'env.dart';

void main(){
  Constants.setEnvironment(Environment.dev);
  mainDelegate();
}