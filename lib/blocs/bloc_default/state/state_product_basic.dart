class DataStateProductBasic{
  dynamic scrollControl, getData;
  bool loadingScroll, loadingApi;
  DataStateProductBasic(this.scrollControl, this.getData, this.loadingScroll, this.loadingApi);
}

class DataProductBasic extends DataStateProductBasic{
  DataProductBasic(
    {
      required dynamic scrollControl, 
      required dynamic getData,
      required bool loadingScroll,
      required bool loadingApi,
    }
  ) 
  : super(scrollControl, getData, loadingScroll, loadingApi);
}