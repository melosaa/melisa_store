import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melisa_store/blocs/product_detail/bloc/product_detail_bloc.dart';

@RoutePage()
class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: BlocProvider(
        create: (context) => ProductDetailBloc()..add(FetchProductsEvent(id)),
        child: SingleChildScrollView(
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              if (state is ProductDetailLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProductDetailFail) {
                return Center(child: Text(state.errorMessage));
              } else if (state is ProductDetailSucces) {
                return _renderProductDetail(state: state);
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class _renderProductDetail extends StatelessWidget {
  _renderProductDetail({super.key, required this.state});
  ProductDetailSucces state;
  @override
  Widget build(BuildContext context) {
    return Text(state.product.title);
  }
}
