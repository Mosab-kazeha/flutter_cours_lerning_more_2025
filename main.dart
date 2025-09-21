import 'fake_data.dart';

void main() {
  List<String> name = ['ahmad', 'mhd', 'abd'];

  print(name.length);

  try {
    print(name[3]);
  } catch (e) {
    print(e);
  }

  print(name.last);
  List<String> newName = ['mosab', 'zied'];
  print(name);
  name.addAll(newName);
  print(name);
  name.add('hamed');
  print(name);
  name.remove('mosab');
  print("list name after the remove $name");
  // name.clear();
  // print("list name after the clear $name");
  print(name.removeAt(0));
  print(name);
  print(name.isNotEmpty);
  print('----------');
  print(name.elementAt(2));
  print(name[2]);

  List<int> index = [1, 4, 5, -1];
  int result = 1;

  index.forEach((value) {
    result = result * value;
  });
  if (result >= 0) {
    print(1);
  } else {
    print(-1);
  }
  print(result);

  Map<String, dynamic> user = {
    "id": 1,
    "name": "ahmad",
    "number": 09666666,
    "address": "mazie",
  };
  print(user.isEmpty);
  print(user.isNotEmpty);
  print(user);
  print(user.keys);
  print(user.values);
  print(user.values.elementAt(2));
  print(user.values.contains('ahmad'));
  print(name.contains('zied'));

  Map<String, dynamic> nestedMap = {
    'names': ['ahmad', "mhd", "abd", "mustafa"],
    "index": 0,
    'users_data': {
      "user": [
        {"name": "mhd", "job": "eng"},
        {"name": "ahmad", "job": "docotr"},
      ],
    },
  };
  print(nestedMap.values.elementAt(1));
  print(nestedMap.values.elementAt(0)[2]);
  print(nestedMap.values.elementAt(2).values.elementAt(0)[0].keys.elementAt(1));

  List nestedList = [
    "data",
    [0, 1, 2, 3, 4, 5],
    {
      "name": "ahmad",
      "lastName": "kosa",
      "data_conect": [
        'fasbook',
        "whatsApp",
        "phone_number",
        {
          "github_reposetriy": ["ferst", 'second'],
        },
      ],
    },
  ];
  print(nestedList[1].elementAt(5));
  print(nestedList[2].values.elementAt(2)[3].values.elementAt(0)[1]);
  print(fakeData.values.elementAt(16)[0].values.elementAt(2));
}
