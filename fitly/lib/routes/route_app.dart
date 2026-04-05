import 'package:fitly/models/cart_model/cart_model.dart';
import 'package:fitly/models/category_model/product_model.dart';
import 'package:fitly/routes/route_key.dart';
import 'package:fitly/screens/account_screen/account_screen/account_screen.dart';
import 'package:fitly/screens/account_screen/account_screen/bloc/account_bloc.dart';
import 'package:fitly/screens/account_screen/profile_screen/bloc/profile_bloc.dart';
import 'package:fitly/screens/account_screen/profile_screen/profile_screen.dart';
import 'package:fitly/screens/auth_screen/login_screen/bloc/login_bloc.dart';
import 'package:fitly/screens/auth_screen/login_screen/login_screen.dart';
import 'package:fitly/screens/auth_screen/register_screen/bloc/register_bloc.dart';
import 'package:fitly/screens/auth_screen/register_screen/register_screen.dart';
import 'package:fitly/screens/auth_screen/splash_screen/bloc/splash_bloc.dart';
import 'package:fitly/screens/auth_screen/splash_screen/splash_screen.dart';
import 'package:fitly/screens/market_screen/cart_summary/bloc/cart_bloc.dart';
import 'package:fitly/screens/market_screen/cart_summary/cart_summary.dart';
import 'package:fitly/screens/market_screen/market_screen/bloc/market_bloc.dart';
import 'package:fitly/screens/market_screen/market_screen/market_screen.dart';
import 'package:fitly/screens/market_screen/product_information/bloc/product_bloc.dart';
import 'package:fitly/screens/market_screen/product_information/product_screen.dart';
import 'package:fitly/screens/meal_screen/bloc/meal_bloc.dart';
import 'package:fitly/screens/meal_screen/meal_screen.dart';
import 'package:fitly/screens/navigation_bottom_selector.dart';
import 'package:fitly/screens/process_screen/allergies_screen/allergies_screen.dart';
import 'package:fitly/screens/process_screen/allergies_screen/bloc/allergies_bloc.dart';
import 'package:fitly/screens/process_screen/customize_meal_screen/bloc/customize_meal_bloc.dart';
import 'package:fitly/screens/process_screen/customize_meal_screen/customize_meal_screen.dart';
import 'package:fitly/screens/process_screen/display_meal_screen/bloc/display_meal_bloc.dart';
import 'package:fitly/screens/process_screen/display_meal_screen/display_meal_screen.dart';
import 'package:fitly/screens/process_screen/gender_screen/bloc/gender_bloc.dart';
import 'package:fitly/screens/process_screen/gender_screen/gender_screen.dart';
import 'package:fitly/screens/process_screen/goal_screen/bloc/goal_bloc.dart';
import 'package:fitly/screens/process_screen/goal_screen/goal_screen.dart';
import 'package:fitly/screens/process_screen/plan_screen/bloc/plan_bloc.dart';
import 'package:fitly/screens/process_screen/plan_screen/plan_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouteApp {
  static final routers = GoRouter(
    initialLocation: RouteKey.splashScreen,

    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationBottomSelector(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteKey.mealScreen,
                builder: (context, state) => BlocProvider(
                  create: (context) => MealBloc(),
                  child: const MealScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteKey.marketScreen,
                builder: (context, state) => BlocProvider(
                  create: (context) => MarketBloc()..add(LoadCategoryEvent()),
                  child: MarketScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteKey.accountScreen,
                builder: (context, state) => BlocProvider(
                  create: (context) => AccountBloc()..add(LoadedDataEvent()),
                  child: const AccountScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RouteKey.splashScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashBloc()..add(AppearLogoEvent()),
          child: SplashScreen(),
        ),
      ),
      GoRoute(
        path: RouteKey.genderScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => GenderBloc(),
          child: const GenderScreen(),
        ),
      ),
      GoRoute(
        path: RouteKey.goalScreen,
        builder: (context, state) {
          final String gender = state.extra as String;
          return BlocProvider(
            create: (context) => GoalBloc(),
            child: GoalScreen(gender: gender),
          );
        },
      ),
      GoRoute(
        path: RouteKey.allergiesScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AllergiesBloc(),
            child: const AllergiesScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteKey.planScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => PlanBloc(),
            child: const PlanScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteKey.customizeMealScreen,
        builder: (context, state) {
          final String type = state.extra as String;
          return BlocProvider(
            create: (context) => CustomizeMealBloc()..add(LoadDataEvent()),
            child: CustomizeMealScreen(type: type),
          );
        },
      ),
      GoRoute(
        path: RouteKey.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginBloc(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: RouteKey.registerScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterBloc(),
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: RouteKey.profileScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ProfileBloc()..add(LoadDataProfileEvent()),
          child: ProfileScreen(),
        ),
      ),
      GoRoute(
        path: RouteKey.productScreen,
        builder: (context, state) {
          final ProductModel product = state.extra as ProductModel;
          return BlocProvider(
            create: (context) => ProductBloc(),
            child: ProductScreen(product: product),
          );
        },
      ),
      GoRoute(
        path: RouteKey.cartSummaryScreen,
        builder: (context, state) {
          final List<CartModel> cart = state.extra as List<CartModel>;
          return BlocProvider(
            create: (context) => CartBloc(),
            child: CartSummary(cart: cart),
          );
        },
      ),
      GoRoute(
        path: RouteKey.displayMealScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => DisplayMealBloc()..add(LoadedMealEvent()),
            child: DisplayMealScreen(),
          );
        },
      ),
    ],
  );
}
