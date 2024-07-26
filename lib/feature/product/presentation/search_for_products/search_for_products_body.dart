part of 'search_for_products.screen.dart';

class SearchForProductsBody extends StatelessWidget {
  const SearchForProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductsBloc, SearchProductsState>(
      builder: (context, state) {
        switch (state.requestState) {
          case RequestState.initial:
            return const SizedBox(
              width: double.infinity,
              height: double.infinity,
            );

          case RequestState.loading:
            return ListViewShimmer(
              itemCount: 5,
              itemHeight: 27.h,
            );

          case RequestState.loaded:
            if (state.result?.isEmpty ?? true) {
              return Announcement(
                message: Localization.of(context)!.noData,
                imagePath: Assets.image.empty.path,
              );
            } else {
              return AppListView(
                direction: Axis.vertical,
                seperator: 18.vertical,
                children:
                    state.result!.map((e) => ProductCard(product: e)).toList(),
              ).wrapWithSingleChildScrollView();
            }

          case RequestState.error:
            return Announcement(
              message: Localization.of(context)!.error,
              imagePath: Assets.image.error.path,
            );
        }
      },
    );
  }
}
