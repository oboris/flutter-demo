import 'package:demo_flutter/person.dart';
import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Next Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 10,
                child: ListView(children: buildListItems()),
              ),
              Expanded(
                child: RawMaterialButton(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  fillColor: Color(0xffFF0000),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Return to Home',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  List<Widget> buildListItems() {
    List<IPerson> persons = [
      PersonAddress('name1', 'address1'),
      PersonAddress('name1', 'address1'),
      PersonAddress('name1', 'address1'),
      PersonInfo('name1', 'info1'),
      PersonAddress('name1', 'address1'),
      PersonAddress('name1', 'address1'),
      PersonInfo('name1', 'info1'),
      PersonInfo('name1', 'info1'),
    ];

    return persons.map((item) {
      switch (item.getType()) {
        case 1:
          return buildAddressItem(
              (item as PersonAddress).name, (item as PersonAddress).address);
        case 2:
          return buildInfoItem(
              (item as PersonInfo).name, (item as PersonInfo).info);
      }
    }).toList();
  }

  Widget buildAddressItem(String name, String address) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(backgroundColor: Colors.green),
          ),
          Text(
            address,
            style: TextStyle(backgroundColor: Colors.cyan),
          ),
        ],
      ),
    );
  }

  Widget buildInfoItem(String name, String info) {
    return Card(
      child: Column(
        children: [
          Text(name),
          Text(info),
        ],
      ),
    );
  }
}
