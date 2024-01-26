class DataStateGetLike{
  late bool loadingLike;
  late dynamic getData;
  DataStateGetLike({required this.loadingLike, required this.getData});
}

class DataGetLike extends DataStateGetLike{
  DataGetLike({required bool loadingLike, required dynamic getData})
  : super(loadingLike: loadingLike, getData: getData);
}

class DataStateLike{
  late bool statusLike, loadingLike;
  DataStateLike({required this.statusLike, required this.loadingLike});
}

class DataLike extends DataStateLike{
  DataLike({required bool statusLike, required bool loadingLike}) 
  : super(statusLike: statusLike, loadingLike: loadingLike);
}