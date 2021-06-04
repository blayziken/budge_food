import 'package:budge_food/provider/Basket.dart';
import 'package:budge_food/widgets/materialDialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CampusOrderScreen extends StatefulWidget {
  static const routeName = 'campus-order-screen';

  String campusName;

  CampusOrderScreen({this.campusName});

  @override
  _CampusOrderScreenState createState() => _CampusOrderScreenState();
}

class _CampusOrderScreenState extends State<CampusOrderScreen> {
  List<FoodItemWidget> foodList = [];

  addFoodItem() {
    foodList.add(FoodItemWidget());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white10,
          child: Column(
            children: [
              CampusOrderImage(widget: widget),
              Column(
                children: [
                  Text(
                    '${widget.campusName}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '(Order Details)',
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              FoodListView(foodList: foodList),
              Expanded(
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      child: Container(
                        width: size.width * 0.3,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Add Item',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        addFoodItem();
                      },
                    ),
                    Spacer(),
                    TextButton(
                      child: Container(
                        width: size.width * 0.3,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        List order = [];
                        int totalAmount = 0;

                        for (var i = 0; i < foodList.length; i++) {
                          totalAmount += int.parse(foodList[i]._selectedValue2);
                          order.add([
                            foodList[i].myController.text,
                            foodList[i]._selectedValue2
                          ]);
                        }

                        print(order.length);
                        print(order);

                        doneOrderMaterialDialog(
                          context,
                          cancelFunction: () {
                            order.clear();
                            Navigator.pop(context);
                            print(order);
                          },
                          addToBasketFunction: () {
                            BasketItem _addFoodItem = BasketItem(
                              foodName: widget.campusName,
                              shop: widget.campusName,
                              price: totalAmount.toString(),
                              foodOrSnacks: 'food',
                              imageName: widget.campusName.toLowerCase(),
                              foodOrder: order,
                            );

                            Provider.of<Basket>(context, listen: false)
                                .addToBasket(_addFoodItem);

                            print(
                                'Items in basket: ${Provider.of<Basket>(context, listen: false).getLength()}');

                            Navigator.pushReplacementNamed(
                                context, 'home-screen');
                          },
                        );
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodItemWidget extends StatefulWidget {
  String _itemName;
  String _selectedValue2 = "50";
  final myController = TextEditingController();

  @override
  _FoodItemWidgetState createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
  @override
  void dispose() {
    widget.myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildName() {
      return TextFormField(
        controller: widget.myController,
        style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
//        decoration: InputDecoration(
//          enabledBorder: OutlineInputBorder(
//            borderSide: BorderSide(
////          color: Colors.green,
//              width: 3,
//            ),
//          ),
//        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name required';
          }
          return null;
        },
        onSaved: (String value) {
          widget.myController.text = value;
          widget._itemName = value;
        },
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: 50, width: 250, child: _buildName()),
//          SizedBox(width: 10),
          Spacer(),
          Container(
            width: 60,
            height: 50,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DropdownButton(
                      underline: SizedBox(),
//                      iconSize: 14,
                      value: widget._selectedValue2,
                      items: ['50', '100', '150', '200', '250', '300', '350']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          widget._selectedValue2 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
class FoodListView extends StatelessWidget {
  const FoodListView({
    Key key,
    @required this.foodList,
  }) : super(key: key);

  final List<FoodItemWidget> foodList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 6,
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 40, right: 30),
        height: size.height * 0.45,
        width: size.height * 0.45,
//                  color: Colors.teal,
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: foodList.length,
                  itemBuilder: (_, index) => foodList[index]),
            )
          ],
        ),
      ),
    );
  }
}

class CampusOrderImage extends StatelessWidget {
  const CampusOrderImage({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final CampusOrderScreen widget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 0,
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 20),
//                  height: 250,
        height: size.height * 0.3,
//                  width: 330,
        width: size.width * 0.85,
        decoration: BoxDecoration(
//                    color: Colors.blue,
          image: DecorationImage(
              image: AssetImage(
                  'images/food/${widget.campusName.toLowerCase()}.png'),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}

//Center(
////                child: FloatingActionButton(
////                    child: Icon(
////                      Icons.add,
////                      size: 40,
////                    ),
////                    onPressed: () {
////                      addFoodItem();
////                    }),
//child: Row(
//children: [
//Container(
//width: 50,
//height: 10,
//color: Colors.orange,
//),
//Container(
//width: 50,
//height: 10,
//color: Colors.orange,
//),
//],
//),
//),
