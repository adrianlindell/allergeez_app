import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tflite/tflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      MyHomeBar(),
    );
  }
}

class MyHomeBar extends StatefulWidget {
  MyHomeBar({Key key}) : super(key: key);

  @override
  _MyHomeBar createState() => _MyHomeBar();

}

class _MyHomeBar extends State<MyHomeBar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MyAllergenList(

    ),
    MyCamera(

    ),
    MyProfilePage(
      
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class MyUserInfo extends StatefulWidget {
  MyUserInfo({Key key}) : super(key: key);

  @override
  _MyUserInfoState createState() => _MyUserInfoState();
}

class _MyUserInfoState extends State<MyUserInfo> {
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      height: 75,
      color: Colors.amber[100],
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Welcome, Sarah Johnson! Age: 22',
        style: TextStyle(fontSize: 20)
        ),
    );
  }
}

class MyChecklist extends StatefulWidget {
  MyChecklist({Key key}) : super(key: key);

  @override
  _MyChecklistState createState() => _MyChecklistState();
}

class _MyChecklistState extends State<MyChecklist> {
  Map<String, bool> values = {
    'Peanuts': false,
    'Tree nuts': false,
    'Dairy': false,
    'Eggs': false,
    'Fish': false,
    'Soy': false,
    'Shellfish': false,
    'Seafood': false,
    'Gluten': false,
    'Sesame seeds': false,
    'Wheat': false
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('My Allergies')),
      body: new ListView(
        children: values.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: values[key],
            onChanged: (bool value) {
              setState(() {
                values[key] = value;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

class MyProfilePage extends StatefulWidget {
  MyProfilePage({Key key}) : super(key: key);

    @override
    _MyProfilePageState createState() => _MyProfilePageState();

}

class _MyProfilePageState extends State<MyProfilePage> {
  final List<String> entries = <String>['Peanuts', 'Tree Nuts', 'Dairy', 'Eggs', 'Soy', 'Seafood', 'Shellfish', 'Gluten', 'Sesame Seed', 'Wheat'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            MyUserInfo(),
            Container(
              height: 500,
              color: Colors.teal,
              child: MyChecklist(),
            ),
            MyContact(),
            MyAlert(),
          ],
        ),
      ),
    );
  }
}

class MyAllergenList extends StatefulWidget {
  MyAllergenList({Key key}) : super(key: key);

    @override
    _MyAllergenListState createState() => _MyAllergenListState();

}

class _MyAllergenListState extends State<MyAllergenList> {
  final List<int> colorCodes = <int>[500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500];
  static const TextStyle optionStyle = TextStyle(fontSize:20);

  List<Widget> items = [
      GestureDetector(
          child: ListTile(
          leading: Icon(Icons.all_inclusive, size: 25),
          title: Text('Peanuts', style: optionStyle),
          tileColor: Colors.amber[100],
          onTap: () => launch('https://www.mayoclinic.org/diseases-conditions/peanut-allergy/symptoms-causes/syc-20376175')
        ),
      ),
      GestureDetector(
          child: ListTile(
          leading: Icon(Icons.eco, size: 25),
          title: Text('Tree Nuts', style: optionStyle),
          tileColor: Colors.amber[50],
          onTap: () => launch('https://www.healthline.com/health/allergies/understanding-tree-nut-allergies#outlook')
        ),
      ),
      GestureDetector(
          child: ListTile(
          leading: Icon(Icons.cake, size: 25),
          title: Text('Dairy', style: optionStyle),
          tileColor: Colors.amber[100],
          onTap: () => launch('https://www.hopkinsmedicine.org/health/wellness-and-prevention/milk-allergy-diet')
        ),
      ),
      GestureDetector(
          child: ListTile(
          leading: Icon(Icons.brightness_high, size: 25),
          title: Text('Eggs', style: optionStyle),
          tileColor: Colors.amber[50],
          onTap: () => launch('https://www.mayoclinic.org/diseases-conditions/egg-allergy/symptoms-causes/syc-20372115')
        ),
      ),
      GestureDetector(
          child: ListTile(
          leading: Icon(Icons.sports_rugby, size: 25),
          title: Text('Soy', style: optionStyle),
          tileColor: Colors.amber[100],
          onTap: () => launch('https://www.hopkinsmedicine.org/health/wellness-and-prevention/soy-allergy-diet')
        ),
      ),
      GestureDetector(
          child: ListTile(
          leading: Icon(Icons.set_meal, size: 25),
          title: Text('Seafood', style: optionStyle),
          tileColor: Colors.amber[50],
          onTap: () => launch('https://www.webmd.com/allergies/news/20040713/seafood-allergies-common-adults#1')
        ),
      ),
      GestureDetector(
          child: ListTile(
          leading: Icon(Icons.local_dining, size: 25),
          title: Text('Shellfish', style: optionStyle),
          tileColor: Colors.amber[100],
          onTap: () => launch('https://www.mayoclinic.org/diseases-conditions/shellfish-allergy/symptoms-causes/syc-20377503')
      ),
      ),
      GestureDetector(
        child: ListTile(
        leading: Icon(Icons.spa, size: 25),
        title: Text('Gluten', style: optionStyle),
        tileColor: Colors.amber[50],
        onTap: () => launch('https://www.medicalnewstoday.com/articles/312898')
      ),
      ),
      GestureDetector(
        child: ListTile(
        leading: Icon(Icons.hdr_weak, size: 25),
        title: Text('Sesame Seeds', style: optionStyle),
        tileColor: Colors.amber[100],
        onTap: () => launch('https://www.healthline.com/health/allergies/understanding-sesame-allergies')
      ),
      ),
        GestureDetector(
        child: ListTile(
        leading: Icon(Icons.grass, size: 25),
        title: Text('Wheat', style: optionStyle),
        tileColor: Colors.amber[50],
        onTap: () => launch('https://www.hopkinsmedicine.org/health/wellness-and-prevention/wheat-allergy-diet')
      ),
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List of Allergens")),
      body: Column(
        children: items,
      ),
    );
  }

}

class MyCamera extends StatefulWidget {
  @override
  _MyCameraState createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Scanner'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

class MyAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        color: Colors.deepOrange[400],
        child: Text('Show Disclaimer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Disclaimer"),
    content: Text("This app is strictly for identifying common allergens that may appear in a dish. Always consult dieticians or medical professionals first. Please thoroughly check the ingredients of the food you consume, especially if you’re severely allergic to any food type."),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class MyContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        color: Colors.deepOrange[400],
        child: Text('Contact Us', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        onPressed: () {
          showContactDialog(context);
        },
      ),
    );
  }
}

showContactDialog(BuildContext context) {
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Email Us"),
    onPressed:  () {},
  );
  AlertDialog alert = AlertDialog(
    title: Text("Contact Us"),
    content: Text("If you have any questions or concerns, please contact us through the email address below.\nnguye47c@mtholyoke.edu"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
