Future<void> main() async {
//   await Hive.initFlutter();
//   await Hive.openBox('listBox');
//   await Hive.openBox<Person>('generic');
//   runApp(MaterialApp(home: Home()));
// }

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     dataSet();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar());
//   }

//   void dataSet() {
//     var listBox = Hive.box('listBox');

//     List myList = ['The name', 10];
//     listBox.put('list', myList);

//     var data = listBox.getAt(0);
//     print(data[0]);

//     ///
//     data[0] = 'My name';
//     listBox.put('list', data);
//      var repleaced = listBox.getAt(0);
//     print(repleaced[0]);
//     ///
 
//   }
// }

// class Person {
//   final String name;
//   final int age;

//   Person({required this.name, required this.age});
// }