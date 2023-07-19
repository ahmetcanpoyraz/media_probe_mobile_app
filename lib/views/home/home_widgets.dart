part of 'home_view.dart';

Widget searchTextField(HomeViewModel viewModel) {
  return TextField(
    onChanged: (String s) {
      viewModel.onChangeTextForm(s);
    },
    autofocus: true,
    cursorColor: Colors.white,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    textInputAction: TextInputAction.search,
    decoration: const InputDecoration(
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      hintText: 'Search',
      hintStyle: TextStyle(
        color: Colors.white60,
        fontSize: 20,
      ),
    ),
  );
}

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({
    super.key,
    required this.viewModel,
    required this.list,
  });
  final HomeViewModel viewModel;
  final List<Results>? list;

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 20.h),
      itemCount: list?.length ?? 0,
      itemBuilder: (context, index) {
        return InkWell(
          key: const Key("goDetailPageButton"),
          onTap: () {
            viewModel.goToDetail(list![index]);
          },
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomCachedNetworkImage(
                  size: 70.h,
                  imageUrl: list![index].media!.isNotEmpty
                      ? list![index].media![0].mediaMetadata!.last.url ??
                          "https://media.istockphoto.com/id/1410391090/photo/crystal-globe-putting-on-moss.webp?b=1&s=612x612&w=0&k=20&c=CksdIKZkvwKrOzoCk1VdBzbWK5nP0LXmddXvpaQO5tA="
                      : "https://media.istockphoto.com/id/1410391090/photo/crystal-globe-putting-on-moss.webp?b=1&s=612x612&w=0&k=20&c=CksdIKZkvwKrOzoCk1VdBzbWK5nP0LXmddXvpaQO5tA=",
                ),
              ),
              Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list![index].title!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list![index].section!,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                list![index].type!,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: ColorConstants.instance.kDarkGrey,
                                  ),
                                  Text(
                                    list![index].publishedDate!,
                                    style: Theme.of(context).textTheme.displaySmall,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
              const Expanded(flex: 2, child: Icon(Icons.chevron_right)),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20.h,
        );
      },
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.viewModel,
  });
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorConstants.instance.kGreen,
        title: !viewModel.searchBoolean
            ? Text(
                "NY Times Most Popular",
                style: Theme.of(context).textTheme.displayLarge!,
              )
            : searchTextField(viewModel),
        leading: Icon(
          Icons.menu,
          size: 28.h,
        ),
        actions: !viewModel.searchBoolean
            ? [
                IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 28.h,
                    ),
                    onPressed: () {
                      viewModel.changeSearchBoolean(true);
                      viewModel.clearSearchList();
                    }),
                Icon(
                  Icons.more_vert,
                  size: 28.h,
                ),
              ]
            : [
                IconButton(
                    icon: Icon(
                      Icons.clear,
                      size: 28.h,
                    ),
                    onPressed: () {
                      viewModel.changeSearchBoolean(false);
                    })
              ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0.sp);
}
