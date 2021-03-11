import 'dart:ui';
import 'package:projectapp/screens/focus_views/focus_ingredient_view.dart';
import 'package:projectapp/screens/search_views/widgets/card.dart';
import 'package:projectapp/screens/search_views/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/service/fetch_api.dart';
import 'package:projectapp/widgets/appBar_widget.dart';
import 'package:projectapp/widgets/loading_widget.dart';

TextEditingController _searchController = TextEditingController();

class IngredientSearch extends StatefulWidget {
  @override
  _IngredientSearchState createState() => _IngredientSearchState();
}

class _IngredientSearchState extends State<IngredientSearch> {
  var items;
  Future _getIngredients(String ingredients) async {
    try {
      var item = await FetchAPI.getIngredientsSearch(ingredients);
      setState(() {
        items = item;
      });
    } catch (e) {}
  }

  initState() {
    super.initState();
    _getIngredients(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    if (items == null) {
      return Loading();
    } else {
      return Scaffold(
          appBar: CustomAppBar(title: "What's in the fridge?"),
          body: CustomScrollView(slivers: [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              expandedHeight: 80,
              flexibleSpace: CustomTextField(
                  _searchController, 'garlic, parsley, cheese...',
                  onChanged: () {
                _getIngredients(_searchController.text);
              }),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(children: [_inspirationText(), _listBuilder()])
            ]))
          ]));
    }
  }

  Widget _inspirationText() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Text(
        'Get inspiration on recipes based on ingredients followed by commas',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _listBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomCard(items[index].image, items[index].title, onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FocusIngredients(items[index]),
                ));
          });
        });
  }
}
