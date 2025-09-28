// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_project/dart_project.dart';

void main() {
  // Bank myBankAcount = Bank(99999, "password", "mhd0");

  // print(myBankAcount.myId);
  // myBankAcount.changeId(newId: 90);
  // print(myBankAcount.myId);

  var myBankAcoutn = Bank.getBankAcount();
  var yourBankAcount = Bank.getBankAcount();

  if (myBankAcoutn == yourBankAcount) {
    print("is equal");
  } else {
    print("is not equal");
  }

  // Animel animel = Animel(name: "kity");
  // Animel cat = Animel(name: "kity");
  // Animel dog = Animel(name: "kity");

  // if (cat == dog) {
  //   cat.hashCode;
  //   print("is equal");
  // } else {
  //   print("is not equal");
  // }

  // Animel animel = Animel(name: 'animel');
  Dog spark = Dog(name: "spark");
  Cat kity = Cat(name: "kity");
  Bird bird = Bird(name: "kity");

  kity.howAmI();

  howAmI(spark);
}

howAmI(Animel animal) {
  if (animal is Dog) {
    print("is a Dog");
  } else if (animal is Cat) {
    print("it is a Cat");
  } else if (animal is Bird) {
    print("it is a Bird");
  } else {
    print("error");
  }
}

abstract class Animel {
  String name;
  Animel({required this.name});

  howAmI();
}

class Cat extends Animel {
  Cat({required super.name});
  @override
  howAmI() {
    print("i am a cat");
  }
}

class Dog extends Animel {
  Dog({required super.name});

  @override
  howAmI() {
    print('i am a dog');
  }
}

class Bird extends Animel {
  Bird({required super.name});
  @override
  howAmI() {
    print('i am a bird');
  }
}

class A {
  d() {}
}

class B extends A {}
