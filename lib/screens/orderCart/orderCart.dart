import 'package:OrderManagement/main.dart';
import 'package:OrderManagement/screens/orderCart/voilaAppBar.dart';
import 'package:OrderManagement/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:OrderManagement/colors.dart';

class OrderCart extends StatefulWidget {
  @override
  _OrderCartState createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  double totalPrice = 0;

  // String myText = null;

  // final DocumentReference documentReference =
  //     Firestore.instance.document("Item/dummy");

  @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     _addAllPrice();
  //   });
  // }

  // Future _addAllPrice() async {
  //   final List<DocumentSnapshot> list = await Firestore.instance
  //       .collection('Item')
  //       .getDocuments()
  //       .then((QuerySnapshot snapshot) => snapshot.documents);

  //   for (var i = 0; i < list.length; i++) {
  //     totalPrice += list[i]['price'];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: VoilaAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20, 25, 0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        DefaultTextStyle(
                          child: Container(child: Text("Total Price")),
                          style: TextStyle(color: Colors.black),
                        ),
                        StreamBuilder(
                          stream:
                              Firestore.instance.collection('Item').snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Container(child: Text("loading price"));
                            else {
                              final priceList = snapshot.data.documents;
                              for (var i = 0; i < priceList.length; i++) {
                                totalPrice += priceList[i]['price'];
                              }
                              return Container(
                                child: Text(
                                  "$totalPrice LKR",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.save,
                        color: Colors.black,
                        size: 40.0,
                      ),
                      onPressed: () {
                        print("save icon is pressed");
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: Firestore.instance.collection('Item').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Text("loading pls wait");
                    else {
                      final list = snapshot.data.documents;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            color: CardColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: Container(
                                          color: PrimaryColor,
                                        ),
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 8, 2),
                                            child: Text(
                                              list[index]['title'],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              list[index]['desc'],
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Ink(
                                            height: 30.0,
                                            width: 30.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7)),
                                              color: LightPrimaryColor,
                                            ),
                                            child: IconButton(
                                              color: Colors.black,
                                              icon: Icon(Icons.add),
                                              iconSize: 15,
                                              onPressed: () {
                                                print(list[index]['price']);
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                4, 0, 4, 0),
                                            child: Ink(
                                              height: 30.0,
                                              width: 30.0,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey[400],
                                                    width: 1.0,
                                                    style: BorderStyle.solid),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7)),
                                                color: Colors.white,
                                              ),
                                              child: Center(child: Text("1")),
                                            ),
                                          ),
                                          Ink(
                                            height: 30.0,
                                            width: 30.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7)),
                                              color: LightPrimaryColor,
                                            ),
                                            child: IconButton(
                                              color: Colors.black,
                                              icon: Icon(Icons.remove),
                                              iconSize: 15,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Container(
                                          child: Text(
                                            list[index]['price'].toString() +
                                                " LKR",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: list.length,
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Container(
          child: Row(
            children: <Widget>[
              Text(
                "Proceed to Checkout",
                style: TextStyle(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: LightPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Text(list[index]['title'])
