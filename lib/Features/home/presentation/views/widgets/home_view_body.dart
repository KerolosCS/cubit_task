import 'package:cubit_task/Features/home/data/models/product_model.dart';
import 'package:cubit_task/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:cubit_task/core/constants.dart';
import 'package:cubit_task/core/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            const SizedBox(height: 16),
            BlocListener<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is AddItemSuccess) {
                  showSnackBar(
                      "Added ${state.productName} Succesfully", context);
                }
                if (state is AddItemFailure) {
                  showSnackBar("The product in your cart or No Enough Quantity", context);
                }
              },
              child: ProductsGridView(products: products),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
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
        childAspectRatio: 1.08 / 1.5, // width/height
        children: List.generate(
          products.length,
          (index) => ProductItem(model: products[index]),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
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
            width: 110,
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
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(model.name),
                    const SizedBox(height: 8),
                    Text("${model.price} \$"),
                    const SizedBox(height: 8),
                    Text("Q : ${model.quantity}"),
                  ],
                ),
                const Spacer(),
                IconButton(
                  splashColor: Colors.teal,
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    HomeCubit.get(context).addTocart(model);
                  },
                  icon: const Icon(
                    Icons.add_shopping_cart_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.teal[200],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home,
            size: 28,
          ),
          Text(
            "Home",
            style: TextStyle(fontSize: 28),
          ),
        ],
      ),
    );
  }
}
