import 'package:cubit_task/Features/home/data/models/product_model.dart';
import 'package:cubit_task/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:cubit_task/core/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is PlusFailure) {
            showSnackBar("No enough quantity !", context);
          }
          if (state is MinusFailure) {
            showSnackBar("You already have 0 of this product!", context);
          }
          if (state is RemoveItemSuccess) {
            showSnackBar("Removed successfully", context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(),
                ProductsGridViewForCart(
                  products: HomeCubit.get(context).productsInCarts,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductsGridViewForCart extends StatelessWidget {
  const ProductsGridViewForCart({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1 / 1.5, // width/height
        children: List.generate(products.length, (index) {
          return ProductItemCart(model: products[index]);
        }),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.teal[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 28,
              ),
              Text(
                "Cart",
                style: TextStyle(fontSize: 28),
              ),
            ],
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Text(
                '${HomeCubit.get(context).sumInCart} \$',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProductItemCart extends StatelessWidget {
  const ProductItemCart({
    super.key,
    required this.model,
  });
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        // color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black26,
        ),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/image.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 130,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.name),
                    const SizedBox(height: 8),
                    Text("${model.price} \$"),
                    const SizedBox(height: 8),
                    Text("Q: ${model.quantity}"),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    IconButton(
                      splashColor: Colors.teal,
                      padding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        HomeCubit.get(context).removeFromCart(model);
                      },
                      icon: const Icon(
                        size: 20,
                        Icons.remove_shopping_cart_outlined,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          splashColor: Colors.teal,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            HomeCubit.get(context).minusQ(model);
                          },
                          icon: const Icon(
                            size: 20,
                            Icons.remove,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text("${model.quanInCart}"),
                        const SizedBox(width: 2),
                        IconButton(
                          splashColor: Colors.teal,
                          padding: const EdgeInsets.all(0),
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            HomeCubit.get(context).plusQ(model);
                          },
                          icon: const Icon(
                            size: 20,
                            Icons.add,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
