import 'package:cubit_task/Features/home/data/models/product_model.dart';
import 'package:cubit_task/Features/home/presentation/views/widgets/cart_body.dart';
import 'package:cubit_task/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:cubit_task/Features/home/presentation/views/widgets/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int curIndex = 0;

  List<ProductModel> productsInCarts = [];
  double sumInCart = 0;
  List screens = const [
    HomeViewBody(),
    CartBody(),
    ProfileBody(),
  ];
  void changeIndex(int index) {
    curIndex = index;
    emit(BottomNavChange());
  }

  void addTocart(ProductModel product) {
    if (product.quantity > 0 && !productsInCarts.contains(product)) {
      product.quanInCart++;
      product.quantity--;
      sumInCart += product.price;
      productsInCarts.add(product);
      emit(AddItemSuccess(product.name));
    } else {
      emit(AddItemFailure());
    }
  }

  void removeFromCart(ProductModel product) {
    sumInCart -= product.price * product.quanInCart;
    product.quantity = product.quantity + product.quanInCart;
    product.quanInCart = 0;
    productsInCarts.remove(product);
    emit(RemoveItemSuccess());
  }

  plusQ(ProductModel product) {
    if (product.quantity > 0) {
      product.quantity--;
      product.quanInCart++;
      sumInCart += product.price;
      emit(PlusSuccess());
    } else {
      emit(PlusFailure());
    }
  }

  void minusQ(ProductModel product) {
    if (product.quanInCart != 0) {
      product.quantity++;
      product.quanInCart--;
      sumInCart -= product.price;
      emit(MinusSuccess());
    } else {
      emit(MinusFailure());
    }
  }
}
