part of 'search_for_products.screen.dart';

class SearchForProductsAppBar extends StatefulWidget {
  const SearchForProductsAppBar({
    super.key,
  });

  @override
  State<SearchForProductsAppBar> createState() =>
      _SearchForProductsAppBarState();
}

class _SearchForProductsAppBarState extends State<SearchForProductsAppBar> {
  Timer? timer;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          iconSize: 18.sf,
          color: AppColor.primary,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        AppTextInput(
          controller: searchController,
          textInputType: TextInputType.text,
          state: InputState.normal,
          placeholder: Localization.of(context)!.searchProducPlaceholder,
          variant: TextInputVariant.unstyled,
          autoFocus: true,
          onChanged: (keyword) {
            if (timer?.isActive ?? false) timer?.cancel();
            if (keyword.isNotEmpty) {
              timer = Timer(
                const Duration(milliseconds: 500),
                () {
                  context
                      .read<SearchProductsBloc>()
                      .add(SubmitSearchData(keyword));
                },
              );
            }
          },
        ).wrapWithExpanded(),
      ],
    );
  }
}
