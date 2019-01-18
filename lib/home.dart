import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';
import 'app.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
    );
  }

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);
      
    if(products == null || products.isEmpty){
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString()
    );

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18/11,
              child: Image.asset(
                product.assetName,
                fit: BoxFit.fitWidth,
                package: product.assetPackage,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      product == null ? '' : product.name,
                      style: theme.textTheme.button,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      product == null ? '' : formatter.format(product.price),
                      style: theme.textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
