
import 'package:get_it/get_it.dart';
    
final sl = GetIt.instance;

Future<void> InjectionContainerdartinit() async {
//example import from feature another

//   applicationInject();


//example core 

//  sl.registerLazySingleton<NetworkInfo>(
//     () => NetworkInfoImpl(
//       sl(),
//     ),
//   );

// Exmaple External

//   final firebaseAuth = FirebaseAuth.instance;
//   sl.registerLazySingleton(() => firebaseAuth);
//   FacebookAuth facebookAuth = FacebookAuth.i;
//   sl.registerLazySingleton(() => facebookAuth);

}
