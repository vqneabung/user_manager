// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../network/auth/auth_client.dart' as _i974;
import '../network/network_module.dart' as _i200;
import '../network/store/category_client.dart' as _i263;
import '../network/store/order_client.dart' as _i745;
import '../network/store/product_client.dart' as _i699;
import '../repositories/auth_repository.dart' as _i1002;
import '../repositories/category_repository.dart' as _i38;
import '../repositories/order_repository.dart' as _i344;
import '../repositories/product_repository.dart' as _i400;
import '../repositories/unit_of_work.dart' as _i990;
import '../services/auth_service.dart' as _i745;
import '../viewmodels/auth/login_view_model.dart' as _i563;
import '../viewmodels/chatbot/chatbot_view_model.dart' as _i469;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<_i469.ChatbotViewModel>(() => _i469.ChatbotViewModel());
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i974.AuthClient>(
      () => networkModule.authClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i263.CategoryClient>(
      () => networkModule.categoryClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i745.OrderClient>(
      () => networkModule.orderClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i699.ProductClient>(
      () => networkModule.productClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i344.OrderRepository>(
      () => _i344.OrderRepositoryImpl(orderClient: gh<_i745.OrderClient>()),
    );
    gh.lazySingleton<_i400.ProductRepository>(
      () =>
          _i400.ProductRepositoryImpl(productClient: gh<_i699.ProductClient>()),
    );
    gh.lazySingleton<_i38.CategoryRepository>(
      () => _i38.CategoryRepositoryImpl(
        categoryClient: gh<_i263.CategoryClient>(),
      ),
    );
    gh.lazySingleton<_i1002.AuthRepository>(
      () => _i1002.AuthRepositoryImpl(authClient: gh<_i974.AuthClient>()),
    );
    gh.lazySingleton<_i990.UnitOfWork>(
      () => _i990.UnitOfWork(
        categoryRepository: gh<_i38.CategoryRepository>(),
        productRepository: gh<_i400.ProductRepository>(),
        orderRepository: gh<_i344.OrderRepository>(),
      ),
    );
    gh.lazySingleton<_i745.AuthService>(
      () => _i745.AuthServiceImpl(authRepository: gh<_i1002.AuthRepository>()),
    );
    gh.factory<_i563.LoginViewModel>(
      () => _i563.LoginViewModel(gh<_i745.AuthService>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i200.NetworkModule {}
