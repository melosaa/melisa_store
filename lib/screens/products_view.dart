import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
    return Padding(
      padding: EdgeInsets.all(20.0),
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
              child: Image.network(state.product.image),
              height: 375,
              width: 238,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                state.product.title,
                style: const TextStyle(
                    color: Color.fromARGB(255, 34, 50, 99),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 160),
              Icon(CupertinoIcons.heart),
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
              Container(
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
              Container(
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
              Container(
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
            ],
          )
        ],
      ),
    );
  }
}
