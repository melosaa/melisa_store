import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:melisa_store/blocs/bloc/selected_products_bloc.dart';
import 'package:melisa_store/blocs/bloc/selected_products_event.dart';
import 'package:melisa_store/blocs/product_detail/bloc/product_detail_bloc.dart';

@RoutePage()
class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ProductDetailBloc()..add(FetchProductsEvent(id)),
          ),
          BlocProvider(
            create: (context) => SelectedProductsBloc(),
          ),
        ],
        child: SingleChildScrollView(
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              if (state is ProductDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductDetailFail) {
                return Center(child: Text(state.errorMessage));
              } else if (state is ProductDetailSucces) {
                return _renderProductDetail(state: state);
              }
              return const SizedBox();
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   state.product.title,
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
          Center(
            child: Container(
              color: const Color.fromARGB(255, 246, 246, 246),
              height: 370,
              width: 238,
              child: Image.network(state.product.image),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  state.product.title,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 34, 50, 99),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(CupertinoIcons.heart),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          RatingBar.builder(
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 255, 200, 52),
                  ),
              onRatingUpdate: (rating) {}),
          const SizedBox(
            height: 8,
          ),
          Text(
            " \$${state.product.price.toString()}",
            style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 88, 199, 255)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  print("tıklandı");
                  final bloc = BlocProvider.of<SelectedProductsBloc>(context);
                  bloc.add(SelectedProducts("S"));
                },
                child: Container(
                  width: 60,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade200)),
                  child: const CircleAvatar(
                    radius: 68,
                    backgroundColor: Colors.white,
                    child: Text("S"),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("tıklandı");
                  final bloc = BlocProvider.of<SelectedProductsBloc>(context);
                  bloc.add(SelectedProducts("M"));
                },
                child: Container(
                  width: 60,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade200)),
                  child: const CircleAvatar(
                    radius: 68,
                    backgroundColor: Colors.white,
                    child: Text("M"),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("tıklandı");
                  final bloc = BlocProvider.of<SelectedProductsBloc>(context);
                  bloc.add(SelectedProducts("L"));
                },
                child: Container(
                  width: 60,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade200)),
                  child: const CircleAvatar(
                    radius: 68,
                    backgroundColor: Colors.white,
                    child: Text("L"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
