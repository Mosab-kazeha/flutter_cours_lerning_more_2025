// ignore_for_file: public_member_api_docs, sort_constructors_first


// ? Bussines Rule
 class Human extends Creature{

  String _name="";
  String jop;

  Human({required this.jop,required super.birthDate});
  
// ? Opimize for this nesty code
  set name(String name){
    if (name.contains(RegExp(r"[0-9]"))) {
      throw Exception("Please Enter Valid Name");
    }else {
      if (name.startsWith(RegExp(r"[a-z]"))) {
      String  x= name[0];
       _name= name.replaceFirst(x, x.toUpperCase());
      }else{
        _name=name;
      }
    
    }
  }

  String get name => _name;

 void putThePrefixOfName(){
    if (jop=="Doctor"&&name.isEmpty) {
      _name= "Dr."+_name;
    }
  }


}



class Creature {
  DateTime birthDate;
  Creature({
    required this.birthDate,
  });



 int age(){
    return (DateTime.now().difference(birthDate).inDays/365).floor();
  }
}


class Cat extends Creature {
  String name;
  Cat({
    required super.birthDate,
    required this.name,
  });

}
