# Aplikasi Foosel Woodcraft Bali
Merupakan project aplikasi E-Commerce dalam bidang Woodcraft yang masih tahap pengembangan. Aplikasi ini saat ini terdiri dari 3 User Role, yang memiliki perannya masing masing, yang dapat menggunakan fitur tertentu. User dan Fitur yang saat ini tersedia :
- Penjual
  - CRUD Product
  - Filter Product Berdasarkan Typenya
  - Chatting ke User Pembeli
  - Menerima, Approve, Reject Transaksi Dari User Pembeli
  - Create, Read, Update Profil User
  - Login dan Logout
- Pembeli
  - Read Product
  - Filter Product Berdasarkan Typenya
  - Chatting ke User Penjual
  - Memesan Product, dan Read History Transaksi, Delete History Transaksi yang sudah di Approve atau di Reject.
  - Menambahkan Product yang Disuka dan Menghilangkan Product yang Disuka.
  - Create, Read, Update Profil User
  - Login dan Logout
- Guest
  -  Read Product
  -  Filter Product Berdasarkan Typenya
  -  Login

Semua Fitur yang saat ini disediakan, dapat berjalan dalam keadaan Terkoneksi Internet dan Tidak Terkoneksi Internet, ketika Aplikasi sedang Tidak Terkoneksi,
maka aplikasi dapat menampilkan data product yang disimpan pada sqlFlite, tetapi untuk melakukan Transaksi, Menambahkan Product, Login, Logout, akan menampilkan Animasi Lottie yang sesuai, dan pada penggunaan Update Product, Delete Product, Register User, Update User Otomatis Dihilangkan ketika Disconnect.

Berdasarkan fitur yang tersedia pada aplikasi ini, saya menggunakan beberapa metode dan alat dalam aplikasi ini. Metode/Alat Utama yang digunakan :
- OOP
- SOLID
- Depedency Injection
  - get_it
- Bloc&Cubit State Management
- MVVM
- Clean Code
- Rest Api (CRUD Laravel)
- Firebase
	- Firestore Firebase
	- FCM
- sqlFlite (CRUD)
- Http
- flutter_hooks
- imagePicker
- lottie
- badges
- go_router
- connectivity & internet_connection_checker
- Unit Test

## OOP
OOP(Object Oriented Programming) meruapakan paradigma pemrograman dengan konsep objek,
yang dimana setiap objek terdiri dari atribut dan metode yang digunakan untuk memanipulasi objek.

Konsep OOP :
- Class
- Object
- Encapsulation
- Inheritance
- Polymorphism
- Abstraction
- Composition
- Association
- Aggregation
- Dependency

### Class
Class adalah blueprint atau template yang mendefinisikan struktur dan perilaku objek. Class mendefinisikan atribut (variabel) yang menyimpan data dan metode (fungsi) yang digunakan untuk memanipulasi data atau melakukan operasi tertentu.
Dalam OOP, objek diciptakan dari sebuah class.
contoh class dan isinya:
```
class ClassConnectionDialog with DialogBasic, NavigasiRole, NavigasiRoleBarRead implements InterfacesClassConnectionDialog{
	@override
	void basicConnection({
	    required BuildContext context,
	    required VoidCallback onTap,
	    required bool buttonConnection,
	})async {
	    ThemeBox(context);
	    var _listener = InternetConnectionChecker().onStatusChange.listen((status){
	    if (status == InternetConnectionStatus.disconnected) {
		voidDialogBasic(
			margin: EdgeInsets.symmetric(
				horizontal: ThemeBox.defaultWidthBox30,
				vertical: MediaQuery.of(context).size.height * 0.3,
			),
			padding: EdgeInsets.only(
				left: ThemeBox.defaultWidthBox30,
				right: ThemeBox.defaultWidthBox30, 
				top: ThemeBox.defaultHeightBox30,
			),
			borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
			color: kBlackColor6,
			context: context, 
			closeIconStatus: false,
			barrierDismissible: true,
			contentDialog: (buttonConnection == false) 
			? ComponenContentDialog_ImageAndTitleTextAndText(
			    titleText: 'Koneksi Internet Terputus', 
			    image: 'asset/animations/wifi_disconnect.json',
			    text: 'penggunaan aplikasi akan dibatasi karena aplikasi dalam mode offline',
			  )
			: ComponenContentDialog_ImageAndTitleTextAndButtonRefresh(
				text: 'Koneksi Internet Terputus',
			    	mage: 'asset/animations/wifi_disconnect.json',
				onTapRefresh: () {
					navigasiRBR(context: context, value: 0);
					navigasiR();
					context.go(navigation);
				},
			    ),
			onTapCloseDialog: onTap,
		);
	    }});
	    Future.delayed(const Duration(seconds: 30),() => _listener.cancel(),); 
	}
}
```

### Object
Object adalah hasil instansiasi dari sebuah class. Ketika membuat sebuah objek dari sebuah class, objek tersebut akan memiliki atribut (variabel) dan metode (fungsi) sesuai dengan definisi class tersebut. 
dan melalui objek tersebut, kita Dapat mengakses atribut dan metode yang didefinisikan dalam class tersebut.
Singkatnya Objek merupakan cara untuk mengakses class dan isinya.

contoh : 
```
ClassConnectionDialog _connection = ClassConnectionDialog();
  _connection.basicConnection(context: context, onTap: (){Navigator.of(context).pop();}, buttonConnection: false);
```
Dalam contoh diatas, ClassConnectionDialog(); merupakan sebuh Objek.
Sedangkan ClassConnectionDialog _connection merupakan variabel yang menjadikan ClassConnectionDialog sebagai tipe data.

### Encapsulation
Encapsulation merupakan cara untuk mengatur akses data dan properti. 
Dalam konteks flutter digunakan untuk mengatur penggunaan widget serta logika yang ada didalam class, dengan tujuan untuk meningkatkan keamanan, keterbacaan, dan pemeliharaan kode.

- contoh penerapan Encapsulation dalam Bloc:
```
class BlocUploadInsertProduct extends Bloc<DataEventAddBarang, StateAddPostBarang> with SharedPref implements InterfacesUploadProduct{
	final InterfacePostDataProduct _postDataProduct = getItInstance<InterfacePostDataProduct>();
	BlocUploadInsertProduct() : super(AddPostBarang(loading: false, snackBar: false, responApi: '-')){
	    on<ButtonFormProducts>((event, emit) async{
		uploadProduct(
		    nameProduct: event.nameProduct,
		    price: event.price,
		    description: event.description,
		    type: event.type,
		    image: event.image,
		    images: event.images, 
		    context: event.context,
		);
	    });
	}

	@override
	Future<void> uploadProduct({
	    required String nameProduct, 
	    required String price, 
	    required String description, 
	    required XFile? image, 
	    required List images, 
	    required String type, 
	    required BuildContext context,
	}) async {
	    emit(AddPostBarang(loading: true, snackBar: false, responApi: '-'));
	    await sharedPref();
	    String _responPostProducts = await _postDataProduct.postDataProduct(
	    email: prefs.getString('email').toString(),
	    description: description, 
	    name: nameProduct,
	    price: price,
	    image: image,
	    images: images,
	    type: type,
	    );
	    if(_responPostProducts == "berhasil"){
	    emit(AddPostBarang(loading: false, snackBar: true, responApi: _responPostProducts));
	    _clearPrefs();
	    }else{
	    emit(AddPostBarang(loading: false, snackBar: true, responApi: _responPostProducts));
	    }
	}

	void _clearPrefs(){
	    prefs.remove('namaProduct');
	    prefs.remove('deskripsi');
	    prefs.remove('price');
	    prefs.remove('typeProduct');
	    prefs.remove('indexDropdown');
	}
}
```

- contoh penerapan Encapsulation dalam Widget:
	- splash screen widget
   		```
		class SplashScreen extends StatelessWidget{
		    SplashScreen({Key? key }) : super(key: key);
		    @override
		    Widget build(BuildContext context) {
			ThemeBox(context);
			SplashScreenUserRole().splashScreenUserRole(context: context);
			return Scaffold(
			    backgroundColor: kPrimaryColor,
			    body: Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)),
			);
		    }
		}
		```
  	- splash screen componen
		```
		class ComponenLoadingLottieBasic extends StatelessWidget {
	            final double height;
	            const ComponenLoadingLottieBasic({Key? key, required this.height}) : super(key: key);
	            @override
	            Widget build(BuildContext context) {
	                return Center(
	                    child: Lottie.asset(
	                    "asset/animations/loading_basic_lottie.json",
	                    height: height,
	                    ),
	                );
	            }
	        }
		```
Dalam kasus widget, ComponenLoadingLottieBasic merupakan detail implementasi.
Dengan menjadikan ComponenLoadingLottieBasic sebagai detail implementasi, membuat isi widget didalam ComponenLoadingLottieBasic tidak diketahui oleh class yang memanggilnya,
sehingga menciptakan batasan privat bagi ComponenLoadingLottieBasic.

### Inheritance
Inheritance berarti pewarisan, kita dapat mewariskan properti, metode yang terdapat pada class parent ke pada class child dengan menggunakan extends sebagai penghubungnya. 
Tujuan dari konsep pewarisan adalah menciptakan code induk yang reuse, yang dapat digunakan kembali disetiap child yang akan diwariskan, membuat hierarki class lebih terstruktur, mempermudah pengelolaan dan pemeliharaan code.
Terdapat beberapa jenis Inheritance salah satunya Single Inheritance, dan Multiple Inheritance. Dalam flutter tidak mendukung adanya konsep Multiple Inheritance karena untuk menghindari Diamond Problem.

Maksud dari Diamond Problem dimana kesalahan terletak karena child meng-extends lebih dari 1 subClass yang terhubung ke Induk yang sama, masalahnya terjadi ketika child mencoba untuk mengakses metode induk, yang pada akhirnya mengakibatkan child kebingungan memilih subClass yang akan digunakan sebagai penghubung untuk menggunakan metode induk.

Dari masalah tersebut maka dalam flutter kita menggunakan Mixin untuk menerapkan konsep Multiple Inheritance, tanpa menyebabkan Diamond Problem.

- contoh Single Inheritance:
```
class StateAddPostBarang{
	bool loading;
	bool snackBar;
	String responApi;
	StateAddPostBarang(this.loading, this.snackBar, this.responApi);
}

class AddPostBarang extends StateAddPostBarang{
	AddPostBarang({
		required bool loading,
		required bool snackBar,
		required String responApi,
	})
	: super(loading, snackBar, responApi);
}
```

- contoh Multiple Inheritance :
	- Induk 1 :
 		```
		mixin DialogBasic{
		      void voidDialogBasic({
		        required BuildContext context,
		        required VoidCallback onTapCloseDialog,
		        required Widget contentDialog,
		        required bool barrierDismissible,
		        required bool closeIconStatus,
		        required EdgeInsetsGeometry margin,
		        required EdgeInsetsGeometry padding,
		        required Color color,
		        required BorderRadiusGeometry borderRadius,
		      }){
		        ThemeBox(context);
		        showDialog(
		          context: context,
		          barrierDismissible: barrierDismissible,
		          builder: ((BuildContext context) => Container(
		            margin: margin,
		            padding: padding,
		            decoration: BoxDecoration(
		              color: color,
		              borderRadius: borderRadius,
		            ),
		            child: Column(
		              mainAxisAlignment: MainAxisAlignment.center,
		              children: [
		                if(closeIconStatus == true)...[
		                  Align(
		                    alignment: Alignment.topLeft,
		                    child: GestureDetector(
		                      onTap: onTapCloseDialog,
		                      child: Image.asset(
		                        'asset/icon/close_icon.png',
		                        height: ThemeBox.defaultHeightBox10,
		                        width: ThemeBox.defaultWidthBox10,
		                      ),
		                    ),
		                  ),
		                ],
		                Expanded(child: contentDialog),
		              ],
		            ),
		          )
		        ));
		      }
		}
   		```
   	- Induk 2 :
		```
		mixin NavigasiRole{
		      late String navigation = "";
		      Future<void> navigasiR() async{
		        final _tokenUser = await SharedPreferences.getInstance();
		        Map<String, dynamic> _decodeTokenUser = JwtDecoder.decode(_tokenUser.getString('token').toString());
		        if(_decodeTokenUser['roles'].toString() == "PEMBELI"){
		          navigation = RouteName.bottomNavPembeli;
		        }else if(_decodeTokenUser['roles'].toString() == "PENJUAL"){
		          navigation = RouteName.bottomNavPenjual;
		        }
		      }
		}
  		```
	- Induk 3 :
		```
		mixin NavigasiRoleBarRead{
		      Future<void> navigasiRBR({required BuildContext context, required int value}) async{
		        final _tokenUser = await SharedPreferences.getInstance();
		        Map<String, dynamic> _decodeTokenUser = JwtDecoder.decode(_tokenUser.getString('token').toString());
		        if(_decodeTokenUser['roles'].toString() == "PEMBELI"){
		          context.read<CubitBottomNavPembeli>().navigation(currentButton: value);
		        }else if(_decodeTokenUser['roles'].toString() == "PENJUAL"){
		          context.read<CubitBottomNavPenjual>().navigation(currentButton: value);
		        }
		      }
		}
  		```
  	- child :
		```
		class RefreshDialog with DialogBasic, NavigasiRole, NavigasiRoleBarRead implements InterfacesRefreshDialog{
		      @override
		      void basicRefresh({
		        required BuildContext context,
		        required VoidCallback onTap,
		      }){
		        var _listener = InternetConnectionChecker().onStatusChange.listen((status){
		          if (status == InternetConnectionStatus.disconnected) {
		            ThemeBox(context);
		            voidDialogBasic(
		              margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
		              padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
		              borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
		              color: kBlackColor6,
		              context: context, 
		              closeIconStatus: true,
		              barrierDismissible: false,
		              contentDialog: ComponenContentDialog_ImageAndTitleTextAndButtonRefresh(
		                text: 'Halaman Perlu Di Refresh',
		                image: 'asset/animations/loading_keong_lottie.json',
		                onTapRefresh: () {
		                  navigasiRBR(context: context, value: 0);
		                  navigasiR();
		                  context.go(navigation);
		                },
		              ),
		              onTapCloseDialog: onTap,
		            );
		          }
		        });
		        Future.delayed(
		          const Duration(seconds: 30),
		          () => _listener.cancel(),
		        );
		      }
		}
  		```

### Polymorphism
Polymorphism merupakan konsep yang berfungsi agar pemanggilan objek dapat dipanggil dengan fleksibel. Maksudnya disini suatu objek ketika dipanggil menggunakan tipe data dari class induk, maka varibel dari objek tersebut dapat memanggil objek lainnya yang terdapat didalam class induk. Tujuannya agar variabel menjadi fleksibel dalam melakukan perubahan objek yang akan dipanggil.

Terdapat dua jenis polimorfisme yang utama: 
 - Polimorfisme Statis (compile-time polymorphism)
	Merupakan jenis polymorism yang memiliki konsep, dimana suatu kelas induk yang memiliki lebih dari satu metode dengan nama yang sama tetapi memiliki parameter berbeda(overloading).
 - polimorfisme dinamis (runtime polymorphism)
	Merupakan jenis polymorism yang memiliki konsep, dimana kelas turunan dapat mengganti atau memodifikasi isi dari metode/prilaku dari metode induk yang diwariskan(overriding)

- contoh Polimorpism Dinamis:

	Dalam contoh ini saya mengimplementasi konsep polymorpism pada abstrak InterfacePostDataProduct, dimana pada BlocUploadInsertProduct saya menjalankan induk yaitu InterfacePostDataProduct, untuk mengupload dan memberikan respon, dan abstrak InterfacePostDataProduct juga memiliki sifat Polimorpism Dinamis dalam penggunaannya.

	- Initialisasi ViewModel BlocUploadInsertProduct()
	```
	 BlocProvider(
		create: (context){
		    setupDInjectionProduct();
		    return BlocUploadInsertProduct();
		},
	),
 	```
  
	- ViewModel BlocUploadInsertProduct()
 	```
	class BlocUploadInsertProduct extends Bloc<DataEventAddBarang, StateAddPostBarang> with SharedPref implements InterfacesUploadProduct{
		final InterfacePostDataProduct _postDataProduct = getItInstance<InterfacePostDataProduct>();
		BlocUploadInsertProduct() : super(AddPostBarang(loading: false, snackBar: false, responApi: '-')){
		    on<ButtonFormProducts>((event, emit) async{
			uploadProduct(
			    nameProduct: event.nameProduct,
			    price: event.price,
			    description: event.description,
			    type: event.type,
			    image: event.image,
			    images: event.images, 
			    context: event.context,
			);
		    });
		}
	
		@override
		Future<void> uploadProduct({
		    required String nameProduct, 
		    required String price, 
		    required String description, 
		    required XFile? image, 
		    required List images, 
		    required String type, 
		    required BuildContext context,
		}) async{
		    emit(AddPostBarang(loading: true, snackBar: false, responApi: '-'));
		    await sharedPref();
		    String _responPostProducts = await _postDataProduct.postDataProduct(
			email: prefs.getString('email').toString(),
			description: description, 
			name: nameProduct,
			price: price,
			image: image,
			images: images,
			type: type,
		    );
		    if(_responPostProducts == "berhasil"){
			emit(AddPostBarang(loading: false, snackBar: true, responApi: _responPostProducts));
			_clearPrefs();
		    }else{
			emit(AddPostBarang(loading: false, snackBar: true, responApi: _responPostProducts));
		    }
		}
	
		void _clearPrefs(){
		    prefs.remove('namaProduct');
		    prefs.remove('deskripsi');
		    prefs.remove('price');
		    prefs.remove('typeProduct');
		    prefs.remove('indexDropdown');
		}
	}
 	```
  
	- Setup Injection
   	```
	void setupDInjectionProduct(){
		if(!getItInstance.isRegistered<InterfacePostDataProduct>()){
		    getItInstance.registerFactory<InterfacePostDataProduct>(() => ApiPostProducts());
		}
	}
 	```
  
  	- Abstract
   	```
	abstract class InterfacePostDataProduct{
		Future postDataProduct({
		    bool testing = false,
		    String testingTokenPenjual = "",
		    required String email, 
		    required String name, 
		    required String price, 
		    required String description, 
		    required XFile? image, 
		    required List images, 
		    required String type,
		});
	}
 	```
  	
	- Api Post Product
	```
	class ApiPostProducts with SharedPref implements InterfacePostDataProduct{
		late String tokens;
		
		@override
		Future postDataProduct({
		    bool testing = false,
		    String testingTokenPenjual = "",
		    required String email, 
		    required String name, 
		    required String price, 
		    required String description, 
		    required XFile? image, 
		    required List images, 
		    required String type,
		}) async {
		    try {
			if(testing == false){
			    await sharedPref();
			    tokens = prefs.getString('token').toString();
			}else{
			    tokens = testingTokenPenjual;
			}
			final productPost = await http.MultipartRequest('POST', Uri.parse('${Api.baseURL}/insertProduct?'));
			for(dynamic img in images){
			    final minesTypeData = await lookupMimeType(img.path, headerBytes: [0xFF, 0xD8]);
			    productPost.files.add(await http.MultipartFile.fromPath('images[]', img.path, contentType: MediaType(minesTypeData![0], minesTypeData[1])));
			}
			if(testing == false){
			    final mineTypeData = await lookupMimeType(image!.path, headerBytes: [0xFF, 0xD8]);
			    final imageFile = await http.MultipartFile.fromPath('image', image.path, contentType: MediaType(mineTypeData![0], mineTypeData[1])).timeout(const Duration(seconds: 10)); 
			    productPost.files.add(imageFile);
			}
			String dataPrice = price.replaceAll(",", "").split('.')[0];
			productPost.fields['unit_test'] = testing.toString();
			productPost.fields['email'] = email;
			productPost.fields['name'] = name;
			productPost.fields['price'] = dataPrice;
			productPost.fields['type'] = type;
			productPost.fields['description'] = description;
			Map<String, String> headers = {
			    'Accept': 'application/json',
			    'Authorization': 'Bearer $tokens',
			    'Content-Type': 'application/json; charset=UTF-8',
			};
			productPost.headers.addAll(headers);
			final streamResponse = await productPost.send().timeout(const Duration(seconds: 10));
			final response = await http.Response.fromStream(streamResponse).timeout(const Duration(seconds: 10));
			return (response.statusCode == 200) ? "berhasil" : "gagal";
		    } catch (e) {
			return "error";
		    }
		}
	}
	```

### Abstraction
Abstract merupakan blueprint atau templete yang dapat digunakan untuk class turunannya, tujuannya agar turunan dari abstract dapat menggunakan metode yang sesuai dengan isi didalam abstract, sehingga class turunan jadi lebih rapi dan mudah untuk dikembangkan. 
Mirip seperti class biasa, perbedaannya abastract tidak dapat membuat object sehingga tidak dapat dijalankan secara langsung, jadi abstract membutuhkan class turunan untuk mengeksekusi atau menjalankan isi dari abstract.

- contoh :

	- Abstract

	```
	abstract class InterfacesSplashScreenUserRole{
		Future<void> splashScreenUserRole({required BuildContext context});
	}
	```

 	- Class SplashScreenUserRole

	```
	class SplashScreenUserRole with RoleAcces implements InterfacesSplashScreenUserRole{
		@override
		Future<void> splashScreenUserRole({required BuildContext context}) async{
		    rolesUser();
		    await Timer(
			const Duration(seconds: 2),
			(){
			    if(tokens != 'null'){
				return (role == "PENJUAL")
				? context.go(RouteName.bottomNavPenjual) 
				: (role == "PEMBELI")
				? context.go(RouteName.bottomNavPembeli)
				: context.go(RouteName.homeGuest);
			    }else{
				return context.go(RouteName.homeGuest); 
			    }      // (prefs.get("token") != null) ? Get.offNamed(RouteName.bottomNavPembeli) : Get.offNamed(RouteName.login);
			}
		    );
		}
	}
 	```

### Composition
Composition merupakan sebuah objek yang dibuat dari berbagai komponen komponen yang lebih kecil yang dirancang agar reuseability.

- contoh menggunakan mixin:

	Ini merupakan penerapan composition dalam pembuatan class RefreshDialog, dimana fitur ini digunakan untuk menampilkan dialog refresh. Dalam pembuatan fitur ini, dibuat dengan menggunakan kombinasi dari beberapa komponen dalam bentuk mixin yaitu DialogBasic, NavigasiRole, NavigasiRoleBarRead.

	- Mixin DialogBasic
	```
	mixin DialogBasic{
		void voidDialogBasic({
		    required BuildContext context,
		    required VoidCallback onTapCloseDialog,
		    required Widget contentDialog,
		    required bool barrierDismissible,
		    required bool closeIconStatus,
		    required EdgeInsetsGeometry margin,
		    required EdgeInsetsGeometry padding,
		    required Color color,
		    required BorderRadiusGeometry borderRadius,
		}){
		    ThemeBox(context);
		    showDialog(
			context: context,
			barrierDismissible: barrierDismissible,
			builder: ((BuildContext context) => Container(
			    margin: margin,
			    padding: padding,
			    decoration: BoxDecoration(
				color: color,
				borderRadius: borderRadius,
			    ),
			    child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
				    if(closeIconStatus == true)...[
					Align(
					    alignment: Alignment.topLeft,
					    child: GestureDetector(
						onTap: onTapCloseDialog,
						child: Image.asset(
						    'asset/icon/close_icon.png',
						    height: ThemeBox.defaultHeightBox10,
						    width: ThemeBox.defaultWidthBox10,   
						),
					    ),
					),
				    ],
				    Expanded(child: contentDialog),
				],
			    ),
			)),
		    );
		}
	}
 	```
	
  	- Mixin NavigationRole
	```
	mixin NavigasiRole{
		late String navigation = "";
		Future<void> navigasiR() async{
		    final _tokenUser = await SharedPreferences.getInstance();
		    Map<String, dynamic> _decodeTokenUser = JwtDecoder.decode(_tokenUser.getString('token').toString());
		    if(_decodeTokenUser['roles'].toString() == "PEMBELI"){
			navigation = RouteName.bottomNavPembeli;
		    }else if(_decodeTokenUser['roles'].toString() == "PENJUAL"){
			navigation = RouteName.bottomNavPenjual;
		    }
		}
	}
 	```
	
	- Mixin NavigasiRoleBarRead
	```
	mixin NavigasiRoleBarRead{
		Future<void> navigasiRBR({required BuildContext context, required int value}) async{
		    final _tokenUser = await SharedPreferences.getInstance();
		    Map<String, dynamic> _decodeTokenUser = JwtDecoder.decode(_tokenUser.getString('token').toString());
		    if(_decodeTokenUser['roles'].toString() == "PEMBELI"){
			context.read<CubitBottomNavPembeli>().navigation(currentButton: value);
		    }else if(_decodeTokenUser['roles'].toString() == "PENJUAL"){
			context.read<CubitBottomNavPenjual>().navigation(currentButton: value);
		    }
		}
	}
	```

	- Class RefreshDialog
	```
	class RefreshDialog with DialogBasic, NavigasiRole, NavigasiRoleBarRead implements InterfacesRefreshDialog{
		@override
		void basicRefresh({
		    required BuildContext context,
		    required VoidCallback onTap,
		}){
		    var _listener = InternetConnectionChecker().onStatusChange.listen((status){
			if (status == InternetConnectionStatus.disconnected) {
			    ThemeBox(context);
			    voidDialogBasic(
				margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
				padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
				borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
				color: kBlackColor6,
				context: context, 
				closeIconStatus: true,
				barrierDismissible: false,
				contentDialog: ComponenContentDialog_ImageAndTitleTextAndButtonRefresh(
				text: 'Halaman Perlu Di Refresh',
				image: 'asset/animations/loading_keong_lottie.json',
				onTapRefresh: () {
				    navigasiRBR(context: context, value: 0);
				    navigasiR();
				    context.go(navigation);
				},
				),
				onTapCloseDialog: onTap,
			    );
			}
		    });
		    Future.delayed(
			const Duration(seconds: 30),
			() => _listener.cancel(),
		    );
		}
	}
 	```
 
- contoh menggunakan widget:

	Dalam code widget ini saya menerapkan Composition untuk menampilkan informasi text didalam class ini. Dimana itu semua terdiri dari ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular, ComponenContainerHarga, ComponenTextDetail, yang menghasilkan isi dari Container yang bertujuan menampilkan informasi text detail dari product.
	- Componen 1
	```
	class ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular extends StatelessWidget {
		late String title, content;
		ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular({Key? key, required this.title, required this.content}) : super(key: key);
		
		@override
		Widget build(BuildContext context) {
			return Column(
			  crossAxisAlignment: CrossAxisAlignment.start,
			  children: [
			    Text(title, style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: semiBold)),
			    Text(content, style: grayTextStyle2.copyWith(fontSize: defaultFont12, fontWeight: regular)),
			  ],
			);
		}
	}
 	```

 	- Componen 2
	```
	class ComponenContainerHarga extends StatelessWidget {
		late String titleHarga, harga, titleItem, jumlahItem, titleTotalHarga, jumlahTotalHarga;
		ComponenContainerHarga({Key? key,
		    this.titleItem = "-",
		    this.jumlahItem = "-",
		    this.titleTotalHarga = "-",
		    this.jumlahTotalHarga = "-",
		    required this.titleHarga,
		    required this.harga,
		}) : super(key: key);
		
		@override
		Widget build(BuildContext context) {
		    ThemeBox(context);
		    return Container(
			margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox20, bottom: ThemeBox.defaultHeightBox30),
			padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox16, horizontal: ThemeBox.defaultWidthBox16),                          
			decoration: BoxDecoration(
			    color: kBlackColor4,
			    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius4)
			),
			child: Column(
			    children: [
				Row(
				    children: [
					Text(titleHarga, style: whiteTextStyle.copyWith(fontSize: defaultFont14, fontWeight: regular)),
					Expanded(
					    child: Text(formatCurrency.format(double.parse(harga.toString()).toInt()), 
						style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16), 
						overflow: TextOverflow.fade, textAlign: TextAlign.end,
					    ),
					),
				    ],
				),
				if(titleItem != "-" && jumlahItem != "-")...[
				    Row(
					children: [
					    Text(titleItem, style: whiteTextStyle.copyWith(fontSize: defaultFont14, fontWeight: regular)),
					    Expanded(
						child: Text(jumlahItem, 
						    style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16), 
						    overflow: TextOverflow.fade, textAlign: TextAlign.end,
						),
					    ),
					],
				    ),
				],
				if(titleTotalHarga != "-" && jumlahTotalHarga != "-")...[
				    Row(
					children: [
					    Text(titleTotalHarga, style: whiteTextStyle.copyWith(fontSize: defaultFont14, fontWeight: regular)),
					    Expanded(
						child: Text(formatCurrency.format(double.parse(jumlahTotalHarga.toString()).toInt()),
						    style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16),
						    textAlign: TextAlign.end, overflow: TextOverflow.fade,
						),
					    ),
					],
				    ),
				]
			    ],
			),
		    );
		}
	}
	```

 	- Componen 3
	```
	class ComponenTextDetail extends StatelessWidget {
		String title, data;
		ComponenTextDetail({Key? key, required this.title, required this.data}) : super(key: key);
		
		@override
		Widget build(BuildContext context) {
			return Column(
			  crossAxisAlignment: CrossAxisAlignment.start,
			  children: [
			    Text(title, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14)),
			    Padding(
			      padding: EdgeInsets.only(bottom: ThemeBox.defaultHeightBox30),
			      child: Text(data, style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont14)),
			    ),
			  ],
			);
		}
	}
 	```

	- Class DetailProductGuest
 	```
	class DetailProductGuest extends HookWidget{
	DetailProductGuest({Key? key}) : super(key: key);
	
		@override
		Widget build(BuildContext context) {
			ThemeBox(context);
			Size size = MediaQuery.of(context).size;
			final listImageProduct = useState([]);
			final loading = useState(true);
			return Scaffold(
			  backgroundColor: kGreyColor6,
			  body: BlocConsumer<CubitDetailProductConnect, DataStateProducts>(
			    listener: (context, state){
			      if(state.loading == false){
				for(int i = 0 ; i < state.dataProducts.galleries!.length ; i++){
				  listImageProduct.value.add(state.dataProducts.galleries![i].url.toString());
				}
				loading.value = state.loading;
			      }
			    },
			    builder: (context, state){
			      return (loading.value == false)
			      ? Column(
				  crossAxisAlignment: CrossAxisAlignment.start,
				  children: [
				    HeaderDetailProduct(
				      context: context,
				      guestUser: true,
				      onPressedBack: () {
					context.go(RouteName.homeGuest);
				      },
				      onPressedChart: () {}, 
				      icon: 'asset/icon/cart_Icon4.png',// harus dari cart
				    ),
				    ComponenCarouselSliderImage(sizeWidth: size.width, imageProduct: listImageProduct.value, connect: true),
				    Expanded(
				      child: Container(
					margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox17),
					padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox30, left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, bottom: ThemeBox.defaultHeightBox30),
					decoration: BoxDecoration(
					  color: kPrimaryColor,
					  borderRadius: BorderRadius.only(topLeft: Radius.circular(ThemeBox.defaultRadius24), topRight: Radius.circular(ThemeBox.defaultRadius24))
					),
					child: SingleChildScrollView(
					  physics: BouncingScrollPhysics(),
					  child: Column(
					    crossAxisAlignment: CrossAxisAlignment.start,
					    children: [
					      ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular(
						title: state.dataProducts.name.toString(), 
						content: state.dataProducts.category!.name.toString(),
					      ),
					      ComponenContainerHarga(titleHarga: "Price starts from", harga: state.dataProducts.price.toString()),
					      ComponenTextDetail(title: "Description", data: state.dataProducts.description.toString()),
					      ComponenTextDetail(title: "Email Penjual", data: state.dataProducts.email.toString()),
					      // ComponenSmallHorizontal(titleImage: "Fimiliar Product"),
					    ],
					  ),
					),
				      ),
				    ),
				  ],
				)
			      : ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200);
			    }
			  ),
			);
		}
	}
	```

### Association
Association merupakan hubungan dari berbagai kompenen yang saling melengkapi, dengan tujuan untuk menciptakan suatu fitur atau sistem yang saling terhubung.
Association biasanya digunakan dalam hubungan antara user role seperti antara user penjual dan pembeli yang saling melengkapi pada suatu system.
Dalam kasus ini saya menerapkan Association kedalam pembuatan suatu page tampilan dan pembuatan suatu objek yang menggunakan class dengan berbagai metode. 
- Dalam contoh widget saya akan membuat tampilan Detail Product, yang berisi header, informasi gambar, dan informasi text.
- Dalam contoh bloc saya akan membuat class yang bertujuan untuk pemrosessan logika dalam menampilkan list product yang menyimpan list product didalam penyimpanan local secara bersamaan.

- contoh Widget :
	Dalam contoh ini saya menghasilkan page detail product yang terdiri dari 3 bagian yaitu bagian header, bagian informasi gambar, dan bagian informasi text. Maka dalam code tersebut saya mengasosiasikan beberapa komponen untuk membuat fitur detail product yang utuh yaitu : HeaderDetailProduct, ComponenCarouselSliderImage, Expanded(child: Continer(...)).
	- Class Componen 1
	```
	class HeaderDetailProduct extends StatelessWidget {
		final bool guestUser;
		final VoidCallback onPressedChart, onPressedBack;
		final String icon;
		const HeaderDetailProduct({Key? key,
			required this. guestUser,
			required this. onPressedChart,
			required this. onPressedBack,
			required this. icon,
		}) : super(key: key);
		
		@override
		Widget build(BuildContext context) {
			return Container(
				height: ThemeBox.defaultHeightBox62,
				color: kGreyColor6,
				child: Row(
				  mainAxisAlignment: MainAxisAlignment.spaceBetween,
				  crossAxisAlignment: CrossAxisAlignment.center,
				  children: [ 
				    CompenenGetBackBasic2(onPressedBack: onPressedBack),
				    IconButton(
				      onPressed: onPressedChart,
				      icon: (guestUser == false)
				      ? Image.asset(
					  icon,
					  height: ThemeBox.defaultHeightBox22,
					  width: ThemeBox.defaultWidthBox20,
					)
				      : Text(""),
				    ),
				  ]
				),
			);
		}
	}
 	```
	- Class Componen 2
	```
	class ComponenCarouselSliderImage extends HookWidget {
	late double sizeWidth;
	late List imageProduct;
	late bool connect;
	ComponenCarouselSliderImage({Key? key, 
		required this.sizeWidth, 
		required this.imageProduct,
		required this.connect,
	}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		final currentIndex = useState<int>(0);
		final index = useState<int>(-1);
		ThemeBox(context);
		return Container(
			color: kGreyColor6,
			child: Column(children: [
			    CarouselSlider(
			      items: (connect == true)
			      ? imageProduct.map(
				  (imageProduct) => ClipRRect(
				    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10), // Mengatur borderRadius menjadi setengah dari lebar/tinggi
				    child: Image.network(
				      "${Api.linkURL}/${imageProduct.toString()}",
				      width: sizeWidth,
				      height: ThemeBox.defaultHeightBox340,
				      fit: BoxFit.cover,
				    )
				  ),
				).toList()
			      : imageProduct.map(
				  (imageProduct) => ClipRRect(
				    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10), // Mengatur borderRadius menjadi setengah dari lebar/tinggi
				    child: Image.asset(
				      imageProduct,
				      width: sizeWidth,
				      height: ThemeBox.defaultHeightBox340,
				      fit: BoxFit.cover,
				    )
				  ),
				).toList(),
			      options: CarouselOptions(
				initialPage: 0,
				enlargeCenterPage: true,
				onPageChanged: ((i, reason){
				  currentIndex.value = i;//untuk memberikan nilai index pada currentIndex, digunakan untuk nilai index dari gambar
				  index.value = -1;
				})
			      ),
			    ),
			    Row(
			      mainAxisAlignment: MainAxisAlignment.center,
			      children: imageProduct.map(//??
				(e) {
				  index.value++;
				  return Container(
				    margin: EdgeInsets.only(right: ThemeBox.defaultWidthBox4),
				    width: (currentIndex.value == index.value) ? ThemeBox.defaultWidthBox16 : ThemeBox.defaultWidthBox4,
				    height: ThemeBox.defaultHeightBox4,
				    decoration: BoxDecoration(
				      borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
				      color: (currentIndex.value == index.value) ? kPurpleColor : kGreyColor5,
				    ),
				  );
				}
			      ).toList(),
			    ),
			  ],),
			);
		}
	}
 	```
	- Class DetailProductGuest
	```
	class DetailProductGuest extends HookWidget{
	DetailProductGuest({Key? key}) : super(key: key);
	
		@override
		Widget build(BuildContext context) {
			ThemeBox(context);
			Size size = MediaQuery.of(context).size;
			final listImageProduct = useState([]);
			final loading = useState(true);
			return Scaffold(
				backgroundColor: kGreyColor6,
				body: BlocConsumer<CubitDetailProductConnect, DataStateProducts>(
				  listener: (context, state){
				    if(state.loading == false){
				      for(int i = 0 ; i < state.dataProducts.galleries!.length ; i++){
					listImageProduct.value.add(state.dataProducts.galleries![i].url.toString());
				      }
				      loading.value = state.loading;
				    }
				  },
				  builder: (context, state){
				    return (loading.value == false)
				    ? Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
					  HeaderDetailProduct(
					    guestUser: true,
					    onPressedBack: () {
					      context.go(RouteName.homeGuest);
					    },
					    onPressedChart: () {}, 
					    icon: 'asset/icon/cart_Icon4.png',// harus dari cart
					  ),
					  ComponenCarouselSliderImage(sizeWidth: size.width, imageProduct: listImageProduct.value, connect: true),
					  Expanded(
					    child: Container(
					      margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox17),
					      padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox30, left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, bottom: ThemeBox.defaultHeightBox30),
					      decoration: BoxDecoration(
						color: kPrimaryColor,
						borderRadius: BorderRadius.only(topLeft: Radius.circular(ThemeBox.defaultRadius24), topRight: Radius.circular(ThemeBox.defaultRadius24))
					      ),
					      child: SingleChildScrollView(
						physics: BouncingScrollPhysics(),
						child: Column(
						  crossAxisAlignment: CrossAxisAlignment.start,
						  children: [
						    ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular(
						      title: state.dataProducts.name.toString(), 
						      content: state.dataProducts.category!.name.toString(),
						    ),
						    ComponenContainerHarga(titleHarga: "Price starts from", harga: state.dataProducts.price.toString()),
						    ComponenTextDetail(title: "Description", data: state.dataProducts.description.toString()),
						    ComponenTextDetail(title: "Email Penjual", data: state.dataProducts.email.toString()),
						    // ComponenSmallHorizontal(titleImage: "Fimiliar Product"),
						  ],
						),
					      ),
					    ),
					  ),
					],
				      )
				    : ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200);
				  }
				),
			);
		}
	}
	```

- contoh bloc :
	Dalam contoh Association pada Bloc ini saya menggunakan abstrak InterfaceGetDataProduct, InterfaceInsertDataProductsLocal, InterfaceDeleteDataProductLocal yang diimplementasikan seperti komponen, dimana penerapan Association terletak pada hubungan :
	- InterfaceGetDataProduct yang saya gunakan untuk menciptakan metode getDataAllProduct yang digunakan untuk menampilkan data, dan scrollControlAllProduct yang digunakan untuk scroll data ketika ditampilkan.
	- Komposisi InterfaceInsertDataProductsLocal dan InterfaceDeleteDataProductLocal saya gunakan untuk menciptakan metode saveLocalDataAllProduct yang berfungsi untuk menyimpan data terbaru didalam local.
	
	Jadi dalam contoh ini saya menggunakan abstract InterfaceInsertDataProductsLocal dan InterfaceDeleteDataProductLocal dalam implementasi Composition dan hasil dari metode nya saya Association dengan abstract InterfaceGetDataProduct.
	- Initialisasi
	```
	BlocProvider(
		lazy: false,
		create: (context){
			setupDInjectionProductLocal();
			setupDInjectionProduct();
			return BlocAllProductConnect();
		},
	),
 	```
 	- Class BlocAllProductConnect
	```
	ScrollController _scrollController = ScrollController();
	late List _dataList = [];
	late bool _loadingScrolling = false, _loadingApi = true;
	class BlocAllProductConnect extends Bloc<DataEventAllProduct,DataStateProductBasic> implements InterfacesAllProductConnect{
	final InterfaceGetDataProduct _dataGetProduct = getItInstance<InterfaceGetDataProduct>();
	final InterfaceInsertDataProductsLocal _dataInsertProductLocal = getItInstance<InterfaceInsertDataProductsLocal>();
	final InterfaceDeleteDataProductLocal _dataDeleteProductLocal = getItInstance<InterfaceDeleteDataProductLocal>();
	BlocAllProductConnect() : super(
	DataProductBasic(
		scrollControl: _scrollController,
		getData: _dataList,
		loadingScroll: _loadingScrolling,
		loadingApi: _loadingApi,
	),
	){
		on<Product>((event, emit) async{
			await getDataAllProduct(pages: event.pages);
			await saveLocalDataAllProduct(); 
			scrollControlAllProduct(pages: event.pages);
		});
	}
	
		@override
		Future<void> getDataAllProduct({required int pages}) async {
			_loadingScrolling = false;
			_dataList = await _dataGetProduct.getDataProduct(pages: pages);
			_loadingApi = false;
			_emitState();
		}
	
		@override
		Future<void> saveLocalDataAllProduct() async{
			await _dataDeleteProductLocal.deleteDataProductLocal();
			if(_dataList.length <= 10){
				for(int i = 0; i < _dataList.length; i++) {
				  await _dataInsertProductLocal.insertDataLocal(
				    description: _dataList[i].description.toString(),
				    tokenId: _dataList[i].tokenId.toString(),
				    name: _dataList[i].name.toString(),
				    email: _dataList[i].email.toString(),
				    nameCategory: _dataList[i].category!.name.toString(),
				    price: _dataList[i].price.toString(),
				    imagePath: "${Api.linkURL}/${_dataList[i].urlImage.toString()}",
				  );
				}
			}  
		}
	
		@override
		void scrollControlAllProduct({required int pages}) {
			_scrollController.addListener(() async {
				if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && _loadingScrolling == false){
				  _loadingScrolling = true;
				  pages = pages + 4;
				  _dataList = await _dataGetProduct.getDataProduct(pages: pages);
				  _loadingApi = false;
				  _emitState();
				  await Future.delayed(
				    Duration(milliseconds: 3000),
				    () => _loadingScrolling = false,
				  );
				  _emitState();
				}
			});
		}
	
		void _emitState(){
			emit(
				DataProductBasic(
				  scrollControl: _scrollController,
				  getData: _dataList,
				  loadingScroll: _loadingScrolling,
				  loadingApi: _loadingApi,
				),
			);
		}
	}
 	```
 	- Injection 1
	```
	void setupDInjectionProduct(){
		if(!getItInstance.isRegistered<InterfaceGetDataProduct>()){
			getItInstance.registerFactory<InterfaceGetDataProduct>(() => ApiGetProducts());
		}
	}
 	```
 	- Abstract Service 1
	```
	abstract class InterfaceGetDataProduct{
		Future getDataProduct({
			bool testing = false,
			String testingToken = "",
			required int pages
		});
		Future tokenNull({
			bool testing = false,
			required int pages,
		});
		Future tokenNotNull({
			bool testing = false,
			required String tokens,
			required int pages,
		});
		Future rolePenjual({
			bool testing = false,
			required int pages,
			required Map<String, String>? headers
		});
		Future rolePembeli({
			bool testing = false,
			required int pages,
			required Map<String, String>? headers
		});
		Future getDataProductUsers({
			bool testing = false,
			required Map<String, dynamic> parameterApi,
			required Map<String, String>? headers,
			required String link,
		});
	}
 	```
 	- Api Service
	```
	class ApiGetProducts with SharedPref implements InterfaceGetDataProduct{
		late List dataProducts = [];
		late String tokens;
	
		@override
		Future getDataProduct({
			bool testing = false,
			String testingToken = "",
			required int pages
		}) async{
			try {
				if(testing == false){
				  await sharedPref();
				  tokens = prefs.getString('token').toString();
				}else{
				  (testingToken == "") ? tokens = 'null' : tokens = testingToken;
				}
				if(tokens == 'null'){
				  if(testing == false){
				    return await tokenNull(pages: pages);
				  }else{
				    await tokenNull(pages: pages);
				    return "berhasil";
				  }  
				}else{
				  if(testing == false){
				    return await tokenNotNull(pages: pages, tokens: tokens); 
				  }else{
				    await tokenNotNull(pages: pages, tokens: tokens);
				    return "berhasil";
				  }
				}
			}catch (e) {
				throw Exception('data error');
			}
		}
		
		Future tokenNull({
			bool testing = false,
			required int pages,
		}) async{
			try{
				Map<String, String> headers = {
				  'Content-Type': 'application/json; charset=UTF-8',
				};
				Map<String, String> parameterApi = {
				  'page' : '1',
				  'limit' : pages.toString(),
				};
				await getDataProductUsers(
				  parameterApi: parameterApi, 
				  link: 'products', 
				  headers: headers,
				);
				return (testing == false) ? dataProducts : "berhasil";
			}catch (e) {
				throw Exception('data error');
			}
		}
		
		Future tokenNotNull({
			bool testing = false,
			required String tokens,
			required int pages,
		}) async{
			try{
				Map<String, dynamic> decodeTokenUser = await JwtDecoder.decode(tokens);
				String role = decodeTokenUser['roles'].toString();
				Map<String, String> headers = {
				  'Authorization': 'Bearer $tokens',
				  'Content-Type': 'application/json; charset=UTF-8',
				};
				if(role == "PENJUAL"){
				  await rolePenjual(
				    pages: pages,
				    headers: headers,
				  );
				}else{
				  await rolePembeli(
				    pages: pages,
				    headers: headers,
				  );
				}
				return (testing == false) ? dataProducts : "berhasil";
			}catch (e) {
				throw Exception('data error');
			}
		}
		
		Future rolePenjual({
			bool testing = false,
			required int pages,
			required Map<String, String>? headers
		}) async{
			try{
				Map<String, String> parameterApi = {
				  'page' : '1',
				  'limit' : pages.toString(),
				};
				await getDataProductUsers(
				  parameterApi: parameterApi, 
				  link: 'productsPenjual',
				  headers: headers,
				);
				return (testing == false) ? dataProducts : "berhasil";
			}catch (e) {
				throw Exception('data error');
			}
		}
		
		Future rolePembeli({
			bool testing = false,
			required int pages,
			required Map<String, String>? headers
		}) async{
			try{
				Map<String, String> parameterApi = {
				  'page' : '1',
				  'limit' : pages.toString(),
				};
				await getDataProductUsers(
				  parameterApi: parameterApi,
				  link: 'productsPembeli',
				  headers: headers,
				);
				return (testing == false) ? dataProducts : "berhasil";
			}catch (e) {
				throw Exception('data error');
			}
		}
		
		Future getDataProductUsers({
			bool testing = false,
			required Map<String, dynamic> parameterApi,
			required Map<String, String>? headers,
			required String link,
		}) async{
			try{    
				String? parameterString = await Uri(queryParameters: parameterApi).query;
				final responseProducts = await Api.client.get(
				  Uri.parse('${Api.baseURL}/$link?' + parameterString),
				  headers: headers,
				).timeout(const Duration(seconds: 10));
				if(responseProducts.statusCode == 200){
				  final parse = await json.decode(responseProducts.body);
				  Products productsDataModel = await Products.fromJson(parse);
				  dataProducts.clear();
				  dataProducts.addAll(productsDataModel.data!.data.toList());
				}else{
				  throw Exception('data gagal');
				}
				return (testing == false) ? dataProducts : "berhasil";
			}catch (e) {
				throw Exception('data error');
			}
		}
	}
	```
 	- Injection 2
	```
	void setupDInjectionProductLocal(){
		if(!getItInstance.isRegistered<InterfaceInsertDataProductsLocal>()){
			getItInstance.registerFactory<InterfaceInsertDataProductsLocal>(() => HelperProducts());
		}
		if(!getItInstance.isRegistered<InterfaceDeleteDataProductLocal>()){
			getItInstance.registerFactory<InterfaceDeleteDataProductLocal>(() => HelperProducts());
		}
	}
	```
 	- Abstract Helper 1
	```
	abstract class InterfaceInsertDataProductsLocal{
		Future<int> insertDataLocal({
			required String tokenId,
			required String email,
			required String name,
			required String description,
			required String nameCategory,
			required String price,
			required String imagePath
		});
	}
	```
 	- Abstract Helper 2
  	```
	abstract class InterfaceDeleteDataProductLocal{
		Future<int> deleteDataProductLocal();
	}
	```
	- Api Helper
	```
	class HelperProducts implements 
	InterfaceGetDataProductLocal, 
	InterfaceInsertDataProductsLocal, 
	InterfaceDeleteDataProductLocal{
		@override
		Future<int> insertDataLocal({
		required String tokenId,
		required String email,
		required String name,
		required String description, 
		required String nameCategory, 
		required String price,
		required String imagePath
			}) async {
			final db = await SqlProductsTabel.db();
			final dataInsert = {
				'tokenId': tokenId,
				'email': email,
				'name': name,
				'description': description, 
				'nameCategory': nameCategory, 
				'price': price,
				'imagePath': imagePath
			};
			return await db.insert('products', dataInsert);
		}
		
		@override
		Future<List<Map<String, dynamic>>> getDataProductLocal() async {
			final dbGet = await SqlProductsTabel.db();
			return await dbGet.query('products');
		}
		
		@override
		Future<List<Map<String, dynamic>>> getDataProductWhereIdLocal({required String tokenId}) async{
			final dbGet = await SqlProductsTabel.db();
			return await dbGet.query('products', where: "tokenId = '$tokenId'");
		}
		
		@override
		Future<int> deleteDataProductLocal() async{
			final db = await SqlProductsTabel.db();
			return await db.delete('products');
		}
	}
	```
 
### Aggregation
Aggregation merupakan konsep yang menggunakan komponen dengan lebih Optimal. Seperti konsep Composition, komponen yang dibuat harus reuse sehingga dapat menciptakan suatu objek, yang dimana secara bersamaan komponen kompenen tersebut dapat dijalankan atau di Asosiasikan pada objek yang lebih besar bersamaan dengan objek yang dihasilkan dari Composition tadi.

Konsep Agregation merupakan pemanfaatan suatu komponen yang bersifat reuse secara optimal dengan cara menggabungkan konsep asossiation dengan konsep composition, sehingga menciptakan objek yang lebih kompleks.

- contoh :
	Dalam contoh ini, NavigasiRole, NavigasiRoleBarRead merupakan function yang digunakan sebagai komponen untuk membuat RefreshDialog dengan menggunakan konsep Komposition. RefreshDialog di jalankan pada DetailBodyDisconnectProductPenjual, secara bersamaan NavigasiRole, NavigasiRoleBarRead juga dijalankan pada DetailBodyDisconnectProductPenjual. Maka penerapan konsep Aggregation terletak pada penggunaan komponen NavigasiRole dan NavigasiRoleBarRead.
	- Mixin NavigasiRole
	```
	mixin NavigasiRole{
		late String navigation = "";
		Future<void> navigasiR() async{
			final _tokenUser = await SharedPreferences.getInstance();
			Map<String, dynamic> _decodeTokenUser = JwtDecoder.decode(_tokenUser.getString('token').toString());
			if(_decodeTokenUser['roles'].toString() == "PEMBELI"){
				navigation = RouteName.bottomNavPembeli;
			}else if(_decodeTokenUser['roles'].toString() == "PENJUAL"){
				navigation = RouteName.bottomNavPenjual;
			}
		}
	}
	```
	- Mixin NavigasiRoleBarRead
	```
	mixin NavigasiRoleBarRead{
		Future<void> navigasiRBR({required BuildContext context, required int value}) async{
			final _tokenUser = await SharedPreferences.getInstance();
			Map<String, dynamic> _decodeTokenUser = JwtDecoder.decode(_tokenUser.getString('token').toString());
			if(_decodeTokenUser['roles'].toString() == "PEMBELI"){
				context.read<CubitBottomNavPembeli>().navigation(currentButton: value);
			}else if(_decodeTokenUser['roles'].toString() == "PENJUAL"){
				context.read<CubitBottomNavPenjual>().navigation(currentButton: value);
			}
		}
	}
	```
	- Class RefreshDialog
	```
	class RefreshDialog with DialogBasic, NavigasiRole, NavigasiRoleBarRead implements InterfacesRefreshDialog{
		@override
		void basicRefresh({
			required BuildContext context,
			required VoidCallback onTap,
		}){
			var _listener = InternetConnectionChecker().onStatusChange.listen((status){
			if (status == InternetConnectionStatus.disconnected) {
			  ThemeBox(context);
			  voidDialogBasic(
			    margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
			    padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
			    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
			    color: kBlackColor6,
			    context: context, 
			    closeIconStatus: true,
			    barrierDismissible: false,
			    contentDialog: ComponenContentDialog_ImageAndTitleTextAndButtonRefresh(
			      text: 'Halaman Perlu Di Refresh',
			      image: 'asset/animations/loading_keong_lottie.json',
			      onTapRefresh: () {
				navigasiRBR(context: context, value: 0);
				navigasiR();
				context.go(navigation);
			      },
			    ),
			    onTapCloseDialog: onTap,
			  );
			}
		});
		Future.delayed(
			const Duration(seconds: 30),
			() => _listener.cancel(),
			);
		}
	}
	```
 	- Class DetailBodyDisconnectProductPenjual
	```
	class DetailBodyDisconnectProductPenjual extends StatelessWidget with NavigasiRole, NavigasiRoleBarRead{
		DetailBodyDisconnectProductPenjual({Key? key}) : super(key: key);
		
		void listener({
			required BuildContext context,
			required String navigation,
			required bool loading,
		}){
			if(loading == true){
				RefreshDialog().basicRefresh(context: context, onTap: () => context.go(navigation));
			}
		}
		
		@override
		Widget build(BuildContext context) {
			ThemeBox(context);
			Size size = MediaQuery.of(context).size;
			
			navigationRole(BuildContext context){
				return BlocBuilder<CubitDetailProdukNavPenjual, DataStateDetailProdukNavPenjual>(
				  builder: (context, state){
				    (state.jenisDetail == "AllProduct")
				    ? navigasiRBR(context: context, value: 0)
				    : navigasiRBR(context: context, value: 2);
				    return SizedBox();
				  }
				);
			}
			navigasiR();
			
			Widget contentDisconnect({
				required String name,
				required String category,
				required String harga,
				required String description,
			}){
				return Column(
				  crossAxisAlignment: CrossAxisAlignment.start,
				  children: [
				    HeaderDetailProduct(
				      guestUser: true, 
				      onPressedBack: () => context.go(navigation), 
				      onPressedChart: () => context.go(RouteName.cartDetail),
				      icon: 'asset/icon/cart_Icon4.png',
				    ),
				    ComponenCarouselSliderImage(sizeWidth: size.width, imageProduct: ["asset/image/disconnect_image.jpg"], connect: false),
				    Expanded(
				      child: Container(
					margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox17),
					padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox30, left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, bottom: ThemeBox.defaultHeightBox30),
					decoration: BoxDecoration(
					  color: kPrimaryColor,
					  borderRadius: BorderRadius.only(topLeft: Radius.circular(ThemeBox.defaultRadius24), topRight: Radius.circular(ThemeBox.defaultRadius24))
					),
					child: SingleChildScrollView(
					  physics: BouncingScrollPhysics(),
					  child: Column(
					    crossAxisAlignment: CrossAxisAlignment.start,
					    children: [
					      ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular(
						title: name,
						content: category,
					      ),
					      ComponenContainerHarga(titleHarga: "Harga", harga: harga),
					      ComponenTextDetail(title: "Description", data: description),
					      // ComponenSmallHorizontal(titleImage: "Fimiliar Product"),
					    ],
					  ),
					),
				      ),
				    ),
				  ],
				);
			}
		
			return BlocBuilder<CubitDetailProdukNavPenjual, DataStateDetailProdukNavPenjual>(
			builder: (context1, state1) => (state1.jenisDetail == "AllProduct")
			? BlocConsumer<CubitDetailProductsDisconnect, DataStateProductBasic>(
			  listener: (context2, state2) => listener(
			    context: context2,
			    loading: state2.loadingApi, 
			    navigation: navigation,
			  ),
			  builder: (context3, state3) => (state3.getData.toString() != "[]")
			  ? contentDisconnect(
			      name: state3.getData[0]['name'].toString(),
			      category: state3.getData[0]['nameCategory'].toString(), 
			      description: state3.getData[0]['description'].toString(),
			      harga: state3.getData[0]['price'].toString(),
			    )
			  : Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)),
			)
			: BlocConsumer<CubitGetLike, DataStateGetLike>(
				  listener: (context4, state4) => listener(
				    context: context4,
				    loading: state4.loadingLike, 
				    navigation: navigation,
				  ),
				  builder: (context5, state5) => (state5.getData.toString() != "[]")
				  ? contentDisconnect(
				      name: state5.getData[0]['name'].toString(),
				      category: state5.getData[0]['nameCategory'].toString(), 
				      description: state5.getData[0]['description'].toString(),
				      harga: state5.getData[0]['price'].toString(),
				    )
				  : Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)),
				),
			);
		}
	}
	```

### Dependency
Dependency merupakan konsep yang bertujuan untuk mengelola ketergantungan pada kode, agar menghindari terjadinya spaghetti code.
Spageti Code merupakan karakteristik code yang seperti spaghetti, yaitu saling terhubung, tapi hubungan antar codenya tidak teratur, sulit dipahami, sulit dipelihara, dan sulit diperbaiki karena strukturnya yang rumit dan tidak teratur, karena codenya saling terhubung, dengan keterhubungan yang random.
Cara dasar untuk mengelola ketergantungan, adalah penggunaan konsep Abstract yang optimal, tetapi dalam code ini, saya menggunakan Dependency Injection untuk menerapkan konsep Dependency.
Intinya Dependency Injection juga menggunakan Abstract sebagai basicnya untuk menerapkan konsep Dependency. Pengertian dan contoh Dependency Injection akan saya jelaskan secara terpisah didalam konsep SOLID.

## SOLID
SOLID merupakan pedoman yang digunakan untuk menerapkan konsep konsep OOP.

- Single Responsibility Principle (SRP)
	Merupakan konsep penggunaan class yang bertujuan untuk mengatur tanggung jawab suatu class menjadi lebih spesifik, jadi dalam konsep ini suatu class hanya boleh memiliki 1 tanggung jawab, dengan tujuan agar code lebih mudah dikembangkan, dirawat dan ditesting.

- Open/Closed Principle (OCP)
	Merupakan konsep yang digunakan untuk mengatur seuatu entitas, dimana suatu entitas diharuskan memiliki sifat yang terbuka untuk pengembangan, tetapi tertutup untuk modifikasi. Maksudnya suatu entitas bersifat reuse dimana entitas hanya dapat diwariskan untuk menambahkan tanggung jawab baru, atau membuat entitas dengan tanggung jawab yang baru untuk mengganti entitas yang lama. Tujuan dari konsep ini adalah mempermudah pengembangan, karena kita tidak perlu merubah yang sudah ada, kita hanya perlu membuat entitas baru untuk ditambahkan ke entitas yang membutuhkan atau entitas baru tersebut juga dapat digunakan untuk mengganti entitas yang lama, tanpa mempengaruhi keseluruhan code. 
	
	Salah satu cara untuk menerapkan konsep Open/Closed Principle dengan menggunakan teknik Strategy Design Pattern. Teknik Strategy Design Patterns merupakan teknik yang bekerja dengan cara, merubah berbagai tanggung jawab menjadi komponen komponen kecil(Strategy) yang memiliki sifat reuse, dimana nantinya komponen2 tersebut bisa digunakan sebagai opsi tanggung jawab yang bisa dipilih atau dijalankan bersamaan oleh suatu entitas yang membutuhkan. Dengan cara ini entitas bisa bersifat Fleksible, tanpa harus mempengaruhi keseluruhan code.

- Liskov Substitution Principle (LSP)
	Merupakan prinsip yang memiliki konsep, warisan yang diterima child harus sesuai dengan karakteristik yang diwariskan oleh induk, dalam artian apapun metode ataupun properti kontrak dari induk harus diikuti oleh child. Dimana konsep ini dkhususkan untuk mengoptimalkan penggunaan Concretions, didalam konteks pewarisan pada Abstract.

- Interface Segregation Principle (ISP)
	Merupakan prinsip yang memiliki konsep, dimana Abstract harus membuat Interface yang efisien, yang benar benar dibutuhkan oleh Concretions yang dituju, jadi nanti Concretions tidak terpaksa menerapkan isi interface yang sebenarnya tidak dibutuhkan.

- Dependency Inversion Principle (DIP)
	Merupakan konsep yang memiliki prinsip, High-Level Modules tidak boleh tergantung pada Low-Level Modules, dan berlaku sebaliknya, dimana High-Level Modules dan Low-Level Modules harus bergantung pada Abstraction.
	
	Dependency Inversion Principle merupakan pedoman dari Dependency pada OOP, yang berarti dalam menerapkan konsep Dependency yang efektive kita bisa menggunakan prinsip Depedency Inversion Principle. Dalam code saya, dalam menerapkan Dependency Inversion Principle saya menggunakan teknik Depedency Injection.
	
	Dependency Injection merupakan teknik yang bertujuan menerapkan konsep Dependency pada OOP, yang juga memiliki prinsip dari Depedency Inversion Principle, dengan cara Injection.

- contoh : Saya akan memberikan contoh code yang mewakili konsep SOLID
	- Initialisasi 
	```
	BlocProvider(
		create: (context){
			setupDInjectionProduct();
			return CubitDetailProductConnect();
		},
	),
 	```
 	- class CubitDetailProductConnect
	```
	late Datum _dataList = Datum();
	late bool _loading = true;
	class CubitDetailProductConnect extends Cubit<DataStateProducts> implements InterfacesCubitDetailProductConnect{
	final InterfaceGetDataDetailProduct _dataGetDetailProduct = getItInstance<InterfaceGetDataDetailProduct>();
	CubitDetailProductConnect() : super(DataProducts(loading: _loading, dataProducts: _dataList, jenisDetail: true));
		@override
		Future<void> getDetailProductConnect({bool jenisDetail = true, required String idProduct}) async{
			Future.delayed(Duration(milliseconds: 3000));
			emit(DataProducts(loading: _loading, dataProducts: _dataList, jenisDetail: jenisDetail));
			_dataList = await _dataGetDetailProduct.getDataDetailProduct(tokenId: idProduct);
			_loading = await _dataGetDetailProduct.loadingGetDataDetailProduct();
			if(_loading == false){ 
				emit(DataProducts(loading: _loading, dataProducts: _dataList, jenisDetail: jenisDetail));
			}
		}
	}
	```
	- Injection
	```
	void setupDInjectionProduct(){
		if(!getItInstance.isRegistered<InterfaceGetDataDetailProduct>()){
			getItInstance.registerLazySingleton<InterfaceGetDataDetailProduct>(() => ApiGetDetailProducts());
		}
	}
	```
 	- Abstract
	```
	abstract class InterfaceGetDataDetailProduct{
		Future getDataDetailProduct({
			bool testing = false, 
			String testingToken = "",
			required String tokenId,
		});
		Future tokenNull({
			bool testing = false, 
			required String tokenId,
		});
		Future tokenNotNull({
			bool testing = false,
			required String tokens,
			required String tokenId
		});
		Future rolePenjual({
			bool testing = false,
			required Map<String, String>? headers,
			required String tokenId,
		});
		Future rolePembeli({
			bool testing = false,
			required Map<String, String>? headers,
			required String tokenId,
		});
		Future getDataProductUsers({
			bool testing = false,
			required Map<String, dynamic> parameterApi,
			required Map<String, String>? headers,
			required String link,
		});
		bool loadingGetDataDetailProduct();
	}
	```
	- ApiGetDetailProducts
	```
	class ApiGetDetailProducts with SharedPref implements InterfaceGetDataDetailProduct{
	late Datum? dataProducts = Datum();
	late bool loading = true;
	late String tokens;
	
		@override
		Future getDataDetailProduct({
			bool testing = false,
			String testingToken = "",
			required String tokenId
		}) async{
			try {
				if(testing == false){
					await sharedPref();
					tokens = prefs.getString('token').toString();
				}else{
					(testingToken == "") ? tokens = 'null' : tokens = testingToken;
				}
				if(tokens == 'null'){
					if(testing == false){
						return await tokenNull(tokenId: tokenId);
					}else{
						await tokenNull(tokenId: tokenId);
						return "berhasil";
					}  
				}else{
					if(testing == false){
						return await tokenNotNull(tokens: tokens, tokenId: tokenId); 
					}else{
						await tokenNotNull(tokens: tokens, tokenId: tokenId);
						return "berhasil";
					}
				}
			}catch (e) {
				throw Exception('data error');
			}
		}
	
		Future tokenNull({
			bool testing = false,
			required String tokenId,
		}) async{
			try{
				Map<String, String> headers = {
					'Content-Type': 'application/json; charset=UTF-8',
				};
				Map<String, String> parameterApi = {
					'token_id' : tokenId,
				};
				await getDataProductUsers(
					parameterApi: parameterApi,
					link: 'detailGuest', 
					headers: headers,
				);
				return (testing == false) ? dataProducts : "berhasil";
			}catch (e) {
				throw Exception('data error');
			}
		}
	
		Future tokenNotNull({
			bool testing = false,
			required String tokens,
			required String tokenId
		}) async{
			try{
				Map<String, dynamic> decodeTokenUser = await JwtDecoder.decode(tokens);
				String role = decodeTokenUser['roles'].toString();
				Map<String, String> headers = {
					'Authorization': 'Bearer $tokens',
					'Content-Type': 'application/json; charset=UTF-8',
				};
				if(role == "PENJUAL"){
					await rolePenjual(
					  headers: headers, 
					  tokenId: tokenId,
					);
				}else{
					await rolePembeli(
					  headers: headers,
					  tokenId: tokenId,
					);
				}
				return (testing == false) ? dataProducts : "berhasil";
			}catch (e) {
				throw Exception('data error');
			}
		}
	
		Future rolePenjual({
			bool testing = false,
			required Map<String, String>? headers,
			required String tokenId,
		}) async{
			try{
				Map<String, String> parameterApi = {
					'token_id' : tokenId,
				};
				await getDataProductUsers(
					parameterApi: parameterApi,
					link: 'detailPenjual',
					headers: headers,
				);
				return (testing == false) ? dataProducts : "berhasil";
			}catch (e) {
				throw Exception('data error');
			}
		}
	
		Future rolePembeli({
			bool testing = false,
			required Map<String, String>? headers,
			required String tokenId,
		}) async{
			try{
				Map<String, String> parameterApi = {
					'token_id' : tokenId,
				};
				await getDataProductUsers(
					parameterApi: parameterApi,
					link: 'detailPembeli',
					headers: headers,
				);
				return (testing == false) ? dataProducts : "berhasil";
			}catch (e) {
				throw Exception('data error');
			}
		}
	
		Future getDataProductUsers({
			bool testing = false,
			required Map<String, dynamic> parameterApi,
			required Map<String, String>? headers,
			required String link,
		}) async{
			try{
				String? parameterString = await Uri(queryParameters: parameterApi).query;
				final responseDetailProducts = await Api.client.get(
				Uri.parse('${Api.baseURL}/$link?' + parameterString),
				headers: headers,
				).timeout(const Duration(seconds: 10));
				if(responseDetailProducts.statusCode == 200){
					final parse = await json.decode(responseDetailProducts.body);
					DetailProducts detailProductsDataModel = DetailProducts.fromJson(parse);
					dataProducts = detailProductsDataModel.data!.data[0];
					loading = false;
					return (testing == false) ? dataProducts : "berhasil";
				}else{
					throw Exception('data gagal');
				}
			}catch (e) {
				throw Exception('data error');
			}
		}
	
		@override
		bool loadingGetDataDetailProduct() {
			return loading;
		}
	}
	```

Dalam contoh diatas penerapan SOLID-nya terletak pada : 
- Single Responsibility Principle, CubitDetailProductConnect menerapkan SRP karena hanya memiliki 1 tanggung jawab pada suatu class, yaitu getDetailProductConnect, yang digunakan untuk menampilkan detail product connect.
- Open/Closed Principle, Dalam perspektive OCP saya menerapkannya, pada penggunaan Depedency Injection dan dalam pembuatan ApiGetDetailProducts dengan teknik Strategy Design Pattern.
	- Dalam penggunaan Depedency Injection, saya menerapkannya pada setupDInjectionProduct() dan pemanggilan Abstractnya pada CubitDetailProductConnect.
Dimana ketika kita ingin merubah class yang ingin kita ambil. Kita tinggal merubah abstract dan class nya pada setupDInjectionProduct() dengan class yang baru, yang nantinya kita sesuaikan pemanggilannya pada Interface yang terdapat didalam CubitDetailProductConnect, tanpa mempengaruhi code CubitDetailProductConnect dan merubah code yang lama, begitupun ketika kita ingin menambahkan class baru, kita tinggal daftarkan didalam setupDInjectionProduct(), dan tambahkan Abstract dialam CubitDetailProductConnect. dengan begitu kita telah memberikan komponen opsi yang dapat dipilih atau digunakan secara bersamaan pada class CubitDetailProductConnect, tanpa mempengaruhi class tersebut.

	- Dalam penggunaan Strategy Design Pattern, saya menerapkannya pada class ApiGetDetailProducts, dimana tujuan dari kelas tersebut adalah menampilkan detail product berdasarkan user role yang telah login. Terdapat user role Penjual dan Pembeli yang memiliki token, dan user role Guest yang tidak memiliki token. Maka cara yang saya lakukan adalah membagikan tanggung jawab menjadi bagian yang lebih spesifik dan saya membuat masing2 objek komponen dari setiap tanggung jawab tersebut yang bersifat reuse. komponen2 tersebut menghasilkan opsi yang bisa dipilih atau dijalankan secara bersamaan pada objek yang membutuhkan. komponen2 dalam code ini :
	     - tokenNotNull yang memiliki opsi
	        - rolePenjual (user penjual)
	        - rolePembeli (user pembeli)
	    - tokenNull (user guest)
	    - getDataProductUsers yang bisa diakses oleh rolePenjual, rolePembeli, tokenNull.

	GetDataDetailProduct merupakan metode utama yang dapat dipanggil oleh code yang terInjeksi, yang berfungsi untuk memilih opsi user role untuk menampilkan data detail product. Dengan demikian strategi code ini akan lebih mudah dikembangkan, karena kita bisa menambahkan user role baru menjadi sebuah komponen / mengurangi komponen user role tanpa mempengaruhi code lainnya.

- Liskov Substitution Principle dalam code ini diterapkan pada hubungan antara InterfaceGetDataDetailProduct sebagai Abstract dengan ApiGetDetailProducts sebagai Concretions. dimana ApiGetDetailProducts sudah menerapkan setiap metode yang terdapat didalam class abstract yang diwariskan.

- Interface Segregation Principle dalam code ini juga diterapkan pada hubungan antara InterfaceGetDataDetailProduct sebagai Abstract dengan ApiGetDetailProducts sebagai Concretions. dimana InterfaceGetDataDetailProduct sudah membuat interface yang efisien yang dibutuhkan oleh ApiGetDetailProducts.

- Dependency OOP/Dependency Inversion Principle/Dependency Injection, seperti yang telah saya jelaskan sebelumnya konsep ini memiliki inti mengelola ketergantungan, dalam contoh ini, penerapannya terletak pada implementasi DI menggunakan Get_It, sesuai dengan prinsip DIP code ini dibagi menjadi 3 bagian :
	- High-Level Modules yaitu CubitDetailProductConnect, code yang berfungsi untuk mengelola logic untuk menampilkan Detail Product.
	- Low-Level Modules yaitu ApiGetDetailProducts, code yang berfungsi untuk mengambil data dari API berdasarkan user role yang telah dideteksi.
	- Abstract yaitu InterfaceGetDataDetailProduct yang menggunakan Get_It untuk meng-Injeksi ApiGetDetailProducts ke CubitDetailProductConnect. Dengan demikian ketergantungan dapat dikelola, dengan Abstract sebagai Basicnya.

## Pola Arsitektur Perangkat Lunak
Pola Arsitektur Perangkat Lunak sederhananya pola dari penggunaan data yang diinputkan pada sebuah aplikasi sehingga menghasilkan output. Ketika kita menggunakan sebuah aplikasi, data akan kita inputkan pada sebuah view yang ditampilkan pada aplikasi, setelah diinputkan di view dan dieksekusi, data tersebut akan diperoses, diperosesnya bisa membutuhkan data dari penyimpanan atau data juga bisa disimpan, sehingga menghasikan output yang telah tersedia, cara dari menerima input, memproses dan menghasilkan output data tersebutlah yang bisa dikatakan pola arsitektur. Karena cara dari mengeksekusi data tersebut, berupa pola yang dirancang untuk mengatur pemrosesan data pada sebuah perangkat lunak.

Intinya Pola Arsitektur Perangkat lunak merupakan cara dari View-Proses-Model berintraksi dalam mengolah data.

Model-View-ViewModel merupakan salah satu pola atau cara yang bisa digunakan untuk mengolah data, konsep dari MVVM adalah :

- View, untuk menerima data dari user atau menampilkan data yang diterima dari View Model. Data yang diterima dari user bisa diterima lebih dahulu oleh properti yang berhubungan dengan Value baru diproses ke View Model, atau bisa juga langsung diterima dan diperoses oleh View Model. View biasanya berupa tampilan UI yang bisa menampilkan data atau meng inputkan data.

- ViewModel merupakan proses yang berisi logic yang bertujuan untuk mengolah data, sesuai dengan tujuan dari logic tersebut, dalam ViewModel data bisa disimpan, atau ditampilkan atau bisa berlaku keduanya, yang jelas cara dari data tersebut disimpan atau ditampilkan adalah, dengan merubah properti yang terhubung pada View atau Model sebelum ditampilkan atau disimpan, sehingga poperti yang terhubung pada View misalnya, dapat merubah bagian tampilan data yang dibutuhkan.

	Data yang diproses dalam ViewModel juga bisa saja membutuhkan data dari Model untuk menghasilkan output yang tepat. Intinya ViewModel bertujuan untuk menyediakan hubungan antara View dan Model, dan juga menyediakan data yang bisa dieksekusi oleh properti yang terhubung oleh View atau Model. ViewModel biasanya berupa Class yang berisi Metode yang menyediakan Logic2 tertentu.

- Model biasanya berhubungan dengan data, karena dalam projek saya kali ini menggunaakan service untuk mengakses data pada API, jadi saya menggunakan model untuk merepresentasikan dan memetakan ketika saya Get data. Jadi dari apa yang saya terapkan sekarang, maka model itu biasanya berupa data yang telah dipetakan atau di representasikan berdasarkan Json yang dipanggil.

# Demonstrasi Foosel
## Guest Foosel
https://drive.google.com/file/d/1Ru7iKpDtzgzigK7eSQqUNVjSVakSfUer/view?usp=sharing

Dalam demo vidio guest, mendemonstrasikan halaman yang dapat diakses oleh user guest atau user yang belum login.
Dalam demonstrasi ini saya juga melakukan demo aplikasi Connect dan demo aplikasi Disconnect.

## Login,Register,Update User Foosel
https://drive.google.com/file/d/1D6w-tFDq7pgMKpiBviEUVewinhxAVyye/view?usp=sharing

Dalam demo vidio ini, mendemonstrasikan fitur login, registrasi user, update user.
Dalam demonstrasi ini saya juga melakukan demo aplikasi Connect dan demo aplikasi Disconnect.
Mendemonstasikan form login, form register dan form update user, untuk mengetahui respon aplikasi ketika form dikosongkan atau berisi data yang salah.

## CRUD Product Foosel
https://drive.google.com/file/d/19YQfYqYdKWaXldmwEfDKRNGesAEnEGk8/view?usp=sharing

Dalam demo vidio ini, mendemonstrasikan fitur yang berfungsi untuk menambahkan product, menampilkan product, mengupdate product, delete product, pada user role penjual.
Dalam demonstrasi ini saya juga melakukan demo aplikasi Connect dan demo aplikasi Disconnect.

## Like Foosel
https://drive.google.com/file/d/1ELuL8m9xWST5OnEKSbrPRH8LmhFs3IB6/view?usp=sharing

Dalam demo vidio ini, mendemonstrasikan fitur Like atau Menyukai Product pada user role pembeli.
Dalam demonstrasi ini saya juga melakukan demo aplikasi Connect dan demo aplikasi Disconnect.

## Cart Foosel
https://drive.google.com/file/d/1OwHddnOwGTdPRCKJsNdqK6sVz2TszQem/view?usp=sharing

Dalam demo vidio ini, mendemonstrasikan fitur cart. fitur ini memiliki fungsi untuk melakukan transaksi product antara user penjual dengan user pembeli.
Dalam demonstrasi ini saya juga melakukan demo aplikasi Connect dan demo aplikasi Disconnect.

## Chat Foosel
https://drive.google.com/file/d/1xMBeK5Siq8RaF3U_SEd_UIbBbqtsfDLI/view?usp=sharing

Dalam demo vidio ini, mendemonstrasikan fitur chat, fitur ini memiliki fungsi untuk melakukan chatting, antara user penjual dengan user pembeli.
Dalam demonstrasi ini saya juga melakukan demo aplikasi Connect dan demo aplikasi Disconnect.

## Mikro Foosel
https://drive.google.com/file/d/1SdSe8ORga_SlkonhbphqnpSu1Fln4uGo/view?usp=sharing

Dalam demo vidio ini, mendemonstrasikan aplikasi foosel ketika dijalankan dalam device dengan ukuran kecil, jadi disini saya perkecil ukuran aplikasi, agar bisa diketahui keadaan aplikasi ketika dijalankan dalam kondisi mikro.
Dalam demonstrasi ini saya juga melakukan demo aplikasi Connect dan demo aplikasi Disconnect.

## Unit Test Service
https://drive.google.com/file/d/14SzNIelIwTp_RcwHrr8b74zGDblITsLl/view?usp=sharing

Dalam demo vidio ini, mendemonstrasikan unit test, dimana pada unit test saat ini, hanya mengetest service, yang berisi proses menghubungkan api dengan aplikasi, dalam testing ini, saya mengetest akses user role guest, user role pembeli, user role penjual secara bergantian. Sehingga dalam testing hanya yang usernya sedang diakses yang dapat di unit test, karena user yang sedang diakses, memiliki token yang dapat digunakan pada unit test, dan ketika logout token yang lama otomatis dihapus. Saya menggunakan 1 emulator, karena laptop akan terasa lebih berat jika lebih dari 1 emulator, sehingga dapat mengganggu proses pembuatan demonstrasi vidio.

## Demo Gambar
https://drive.google.com/drive/folders/1jgklyukgEzzTqqn6JrCZTyDhV6u5zT4H?usp=drive_link

Dalam link google drive saya, terdapat 6 folder yang berisi screenshot dari fitur fitur yang telah didemo pada vidio. Jadi jika anda ingin melihat demo dalam bentuk gambar, untuk saat ini saya hanya dapat memberikan link yang berisi gambar dari fitur yang telah di demonstrasi pada vidio sebelumnya. Karena banyaknya gambar yang harus saya jelaskan, maka untuk saat ini demo gambarnya hanya sebatas ini. Kedepannya dipengembangan yang sudah lengkap saya akan jelaskan demo gambarnya.

# Kekurangan Aplikasi
- Laravel+Flutter Websockets untuk realtime data popular
- Notive transaksi
- Web untuk user admin
- Fitur update yang dipisah antara update gambar dan update text
- Filter transaksi berdasarkan approvalnya
- Tampilan list transaksi produk yang sama dijadikan satu ketika masih pending
- Searching product secara keseluruhan
- Aplikasi hanya berfungsi ketika aplikasi connect dan disconnect, masih belum bisa berfungsi dengan baik ketika aplikasi dalam koneksi yang buruk
- Fitur chating masih belum bisa mengirim dan menerima data gambar
- Versi ios
- Belum menyediakan penyimpanan gambar dalam local, dimana gambar yang disimpan masih berupa link yang butuh akses internet
- Hanya diUnit test pada service, penerapan Unit Test masih belum menyeluruh
- Untuk saat ini testing hanya sebatas Unit Test 
- Sistem registrasi yang terintegrasi dengan email Gmail, menggunakan dependensi google_sign_in.
- Transaksi saat ini hanya bisa melalui COD, karena saya belum menyediakan pilihan pengiriman uang pada aplikasi.
- Design yang menurut saya masih bisa dikembangkan dan diperbagus, seperti menambahkan mode landscape dan mode portrait dengan desain yang berbeda, menambahkan design yang berbeda untuk device tablet dan desktop, dan masih banyak lagi.
- Fitur maps untuk menampilkan peta antara lokasi penjual dan pembeli.
