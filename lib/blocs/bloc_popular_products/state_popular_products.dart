class DataStatePopularProduct{
  dynamic scrollControl, getData;
  bool loadingScroll, loadingApi;
  DataStatePopularProduct(this.scrollControl, this.getData, this.loadingScroll, this.loadingApi);
}

class DataPopularProduct extends DataStatePopularProduct{
  DataPopularProduct(
    {
      required dynamic scrollControl, 
      required dynamic getData,
      required bool loadingScroll,
      required bool loadingApi,
    }
  ) 
  : super(scrollControl, getData, loadingScroll, loadingApi);
}

class DataRefreshPopularProduct{
  dynamic refresh;
  DataRefreshPopularProduct(this.refresh);
}

class RefreshDataPopularProduct extends DataRefreshPopularProduct{
  RefreshDataPopularProduct(dynamic refreshData) : super(refreshData);
}