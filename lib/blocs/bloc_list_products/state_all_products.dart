class DataRefreshProduct{
  dynamic refresh;
  DataRefreshProduct(this.refresh);
}

class RefreshDataProduct extends DataRefreshProduct{
  RefreshDataProduct(dynamic refreshData) : super(refreshData);
}





// class DataStateAllProduct{
//   dynamic scrollControl;
//   List dataProducts, dataProductsPopular;
//   bool loading, loadingApi, loadingApiPopular;
//   DataStateAllProduct(this.dataProducts, this.loading, this.scrollControl, this.loadingApi, this.dataProductsPopular, this.loadingApiPopular);
// }

// class DataAllProduct extends DataStateAllProduct{
//   DataAllProduct(List dataProducts, bool loading, dynamic scrollControl, bool loadingApi, List dataProductsPopular, bool loadingApiPopular) 
//   : super(dataProducts, loading, scrollControl, loadingApi, dataProductsPopular, loadingApiPopular);
// }

// class DataStateAllProductInitial{
//   dynamic scrollControl;
//   List getData;
//   bool loadingScroll, loadingApi;
//   DataStateAllProductInitial(this.scrollControl, this.getData, this.loadingScroll, this.loadingApi);
// }

// class DataAllProductInitial extends DataStateAllProductInitial{
//   DataAllProductInitial(
//     {
//       required dynamic scrollControl, 
//       required List getData,
//       required bool loadingScroll,
//       required bool loadingApi,
//     }
//   ) 
//   : super(scrollControl, getData, loadingScroll, loadingApi);
// }

// class DataStateAllProduct{
//   dynamic scrollControl;
//   List dataList;
//   bool loading;
//   DataStateAllProduct(this.scrollControl, this.dataList, this.loading);
// }

// class DataAllProduct extends DataStateAllProduct{
//   DataAllProduct(
//     {
//       required dynamic scrollControl, 
//       required List dataList,
//       required bool loading,
//     }
//   ) 
//   : super(scrollControl, dataList, loading);
// }
