import 'package:dartz/dartz.dart';
import 'package:request_api_console/services/cart_service.dart';
import 'package:request_api_console/models/product.dart';
import 'package:request_api_console/services/product_services.dart';
import 'package:request_api_console/services/user_services.dart';

void main() async {
  final productService = ProductService();
  final userService = UserService();
  final cartService = CartService();

  print("----------Datos del producto con id 1----------");
  await showProduct(productService, 1);
  print("----------Datos de un usuario con id 2-----------");
  await showUser(userService, 2);
  print("-----------Carrito con id 1----------");

  await showCart(cartService, userService, productService, 1);
}

Future<void> showProduct(ProductService service, int id) async {
  final result = await service.getProduct(id);
  result.fold((error) => print("❌ Error: $error"), (product) {
    print("🛍️ Producto: ${product.title}");
    print("💲 Precio: \$${product.price}");
    print("📄 Descripción: ${product.description}");
    print("🌟 Rating: (${product.rating.count} reviews)");
  });
}

Future<void> showUser(UserService service, int id) async {
  final result = await service.getUser(id);
  result.fold((error) => print("❌ Error: $error"), (user) {
    print("✏️ Nombre: ${user.name.firstname}");
    print("✏️ Apellido: ${user.name.lastname}");
    print("👤 Username: ${user.username}");
    print("✉️ Email: ${user.email}");
    print("📌 Dirección: ${user.address.city} - ${user.address.street} - ${user.address.zipcode}");
    print("📞 Celular: ${user.phone}");
  });
}

Future<void> showCart(
  CartService cartService,
  UserService userService,
  ProductService productService,
  int cartId,
) async {
  final cartResult = await cartService.getCartById(cartId);
  cartResult.fold((error) => print("❌ Error al obtener carrito: $error"), (
    cart,
  ) async {
    final userResult = await userService.getUser(cart.userId);
    userResult.fold(
      (err) => print("❌ Error al obtener usuario: $err"),
      (user) => print(
        "🧑 Usuario: ${user.name.firstname} ${user.name.lastname} (${user.email})",
      ),
    );

    final futures =
        cart.products.map((prod) async {
          final result = await productService.getProduct(prod.productId);
          return {'result': result, 'quantity': prod.quantity};
        }).toList();

    final productResults = await Future.wait(futures);

    for (final data in productResults) {
      final result = data['result'] as Either<String, ProductModel>;
      final quantity = data['quantity'] as int;

      result.fold(
        (err) => print("❌ Producto no encontrado"),
        (product) => print(
          "🛍️ ${product.title} 🧾 Cantidad: $quantity 💰 Total: \$${(product.price * quantity).toStringAsFixed(2)}",
        ),
      );
    }
  });
}
