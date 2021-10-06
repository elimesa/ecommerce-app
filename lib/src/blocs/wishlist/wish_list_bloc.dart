import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/src/models/product.dart';
import 'package:ecommerce_app/src/models/wish_list.dart';
import 'package:equatable/equatable.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListLoading());

  @override
  Stream<WishListState> mapEventToState(
    WishListEvent event,
  ) async* {
    if (event is StartWishList) {
      yield* _mapStartWishListToState();
    } else if (event is AddWishListProduct) {
      yield* _mapAddWishListProductToState(event, state);
    } else if (event is RemoveWishListProduct) {
      yield* _mapRemoveWishListProductToState(event, state);
    }
  }

  Stream<WishListState> _mapStartWishListToState() async* {
    yield WishListLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield const WishListLoaded();
    } catch (_) {}
  }

  Stream<WishListState> _mapAddWishListProductToState(
    AddWishListProduct event,
    WishListState state,
  ) async* {
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<WishListState> _mapRemoveWishListProductToState(
    RemoveWishListProduct event,
    WishListState state,
  ) async* {
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
