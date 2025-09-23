// ignore_for_file: public_member_api_docs, sort_constructors_first
Future<void> wait() async {
  await Future.delayed(Duration(seconds: 2));
  print("finish waiting");
}

class Humen {
  String name;
  String? address;
  int number;
  Humen(this.number, {required this.name, this.address});

  void work() {
    print("the humen did not do anything");
  }
}

class Docotr extends Humen {
  int? id;
  Docotr(super.number, {required super.name, super.address, this.id});

  @override
  void work() {
    print("i am a docotor");
  }

  void spishalWork() {
    print("i am a dentest");
  }
}

class Dentest extends Docotr {
  Dentest(super.number, {required super.name, super.address});

  void spishalWork() {
    print('i do not have to work i am rish');
  }
}

class Worker extends Humen implements Dentest {
  int? id;
  Worker(super.number, {required super.name, super.address, this.id});

  void spishalWork() {
    print('THIS IS WORKER');
  }
}

class Animel {
  String name;
  Animel({required this.name});
}

class Dog extends Animel {
  Dog({required super.name});
}

void main() async {
  wait();
  Humen mhd = Humen(0944444, name: "mhd");
  Docotr ahmad = Docotr(0988888, name: "ahmd");
  Dentest amar = Dentest(0988888, name: "ahmd");

  Humen mosab = Docotr(095555555, name: "mosab", id: 5);
  // Docotr zied = Humen();
  // Dog spark = Animel(name: "");

  mosab.work();
  // print(mosab.id);
  // mosab.spishalWork();

  print(mhd.address);
  mhd.work();
  ahmad.work();
  amar.work();
  amar.spishalWork();

  // int second_result = 5;
  // // second_result = 0.5;
  // int? first_result;
  // first_result = 4;

  // const int number = 6;
  // final String name;
  // name = "ahmad";

  // print(number.runtimeType);

  // num salary = 1000;
  // salary = 0.5;

  // print(salary.runtimeType);

  // var temp = "var data";
  // print("the tybe ${temp.runtimeType}");
  // temp = "it must to be string";
  // print("the tybe ${temp}");

  // var address;
  // address = "mazie";
  // print(" address is ${address.runtimeType}");
  // address = 5;
  // print(" address is ${address.runtimeType}");

  // dynamic tempData;
  // print(tempData.runtimeType);
  // //
  // print(name);
  // print(first_result ?? 5 + second_result);

  // // if(){}
  // first_result == second_result ? print(true) : print(false);
  // var temprery;

  // //! || && ??
  // if (temprery == Null) {
  //   print("");
  // }
  // print(temprery ?? "");

  // List<int> numbers = [5, 7, 10, -1];

  // int numbers_result = 1;
  // // numbers.contains(0);
  // numbers.forEach((element) {
  //   element == 0 ? print(0) : numbers_result = numbers_result * element;
  // });

  // if (numbers_result > 0) {
  //   print(1);
  // } else if (numbers_result < 0) {
  //   print(-1);
  // }
  // List phoneNumber = [
  //   09555,
  //   445036,
  //   {'user': "mhd"},
  // ];
  // // numbers.addAll(phoneNumber);
  // numbers.clear();
  // print("${phoneNumber[2]["user"]}");

  // Map<String, dynamic> user = {
  //   "user_name": "mhd",
  //   "user_number": 096666666,
  //   "user_address": ["mazie", "paramke"],
  //   "is_the_user_work": false,
  // };

  // print(user['user_address'][1]);
  // print(user.values.elementAt(0));
  // print(user.keys.elementAt(0));
}
