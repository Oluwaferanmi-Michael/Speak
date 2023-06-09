import 'dart:developer' as devtools show log;


extension Log on Object {
  void log() => devtools.log(toString());
}


extension FullPath on String{
  String get fullPath => 'assets/images/$this';
}

extension IdParameter on String {
  Map<String, String> get param =>  {
    'id' : this
  };
}