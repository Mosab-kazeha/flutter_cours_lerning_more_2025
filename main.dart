import 'hume_class.dart';


// ! Homework
// ? OOP: Inhertince , Polymaraphism , Abstraction
// ? List , Map 
// Future , Async, Await , 


void main() {
// ? instance        // ? Constructer that return an Object
  Human person = Human(jop: "Doctor",birthDate: DateTime(2000));
  // try {
  person.name="ahmad";
    
  // } catch (e) {
  //   print(e);
  // }
  person.putThePrefixOfName();
  print(person.name);
  print(person.age());

  Cat cat = Cat(birthDate: DateTime(1999), name: "Kitty");
  print(cat.age());


  Creature creature = Cat(birthDate: DateTime(1000), name: "Test");
  print((creature as Cat).name);

}
