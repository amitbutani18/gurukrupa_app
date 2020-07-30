import 'package:flutter/material.dart';
import 'package:gurukrupa/providers/productprovider.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {
  static const routeName = '/add-item';
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();
  var _title = '';
  var _description = '';
  var _price = 0.0;
  var _verify = false;
  var _imageUrl = '';
  var _pass = 0;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _typeController = TextEditingController();
  final _imageUrlController = TextEditingController();

  void _addItem() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      // print(_type);
      print(_price);
      print(_imageUrl);
      print(_title);

      Provider.of<ProductProvider>(context, listen: false)
          .addItem(_title, _price, _imageUrl, _description);
    }
    // _typeController.clear();
    _titleController.clear();
    _imageUrlController.clear();
    _descriptionController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Item"),
      ),
      body: !_verify
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Enter Password'),
                      onChanged: (value) {
                        _pass = int.parse(value);
                      },
                      keyboardType: TextInputType.number,
                    ),
                    RaisedButton(
                      child: Text("Verify"),
                      onPressed: () {
                        setState(() {
                          if (_pass == 1818) {
                            _verify = true;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: 'Title',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onSaved: (value) {
                          _title = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _typeController,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onSaved: (value) {
                          _description = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          hintText: 'Price',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onSaved: (value) {
                          _price = double.parse(value);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _imageUrlController,
                        decoration: InputDecoration(
                          hintText: 'Image Url',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onSaved: (value) {
                          _imageUrl = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: _addItem,
                        child: Text(
                          "Add Item",
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 27, vertical: 10),
                        textColor: Colors.white,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
