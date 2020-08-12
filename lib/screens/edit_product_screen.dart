import 'package:flutter/material.dart';
import 'package:shoppingapp/provider/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-Screen';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _focusPrice = FocusNode();
  final _focusDiscription = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(price: 0.0, id: null, title: '', description: '', imageUrl: '');
  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlFocusNode.dispose();
    _focusDiscription.dispose();
    _focusPrice.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveForm() {
    _form.currentState.save();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {}
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_focusPrice);
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                        title: value,
                        price: _editedProduct.price,
                        id: null,
                        imageUrl: _editedProduct.imageUrl,
                        description: _editedProduct.description);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _focusPrice,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_focusDiscription);
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                        title: _editedProduct.title,
                        price: double.parse(value),
                        id: null,
                        imageUrl: _editedProduct.imageUrl,
                        description: _editedProduct.description);
                  },
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(labelText: 'Discription'),
                  keyboardType: TextInputType.multiline,
                  focusNode: _focusDiscription,
                  onSaved: (value) {
                    _editedProduct = Product(
                        title: _editedProduct.title,
                        price: _editedProduct.price,
                        id: null,
                        imageUrl: _editedProduct.imageUrl,
                        description: value);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(right: 10, top: 8),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: _imageUrlController.text.isEmpty
                          ? Text('Enter Image Url')
                          : FittedBox(
                              child: Image.network(_imageUrlController.text),
                              fit: BoxFit.cover,
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image Url'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNode,
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              title: _editedProduct.title,
                              price: _editedProduct.price,
                              id: null,
                              imageUrl: value,
                              description: _editedProduct.description);
                        },
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
