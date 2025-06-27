# 🛒 Petición API Console

Este proyecto es una aplicación de consola en Dart que consume la API pública [Fake Store API](https://fakestoreapi.com/), y permite visualizar datos de productos, usuarios y carritos de compra directamente en la terminal.

---

## 🚀 Objetivo

Demostrar habilidades en:

- Consumo de API externa.
- Creación de modelos de datos inmutables.
- Manejo de errores con `Either` (librería `dartz`).
- Impresión de datos de forma legible en la consola.

---

## 📦 Estructura del Proyecto

```bash
├── bin/
│ └── peticion_api_console.dart # Archivo principal (main)
├── lib/
│ ├── core/
│ │ └── config/environment.dart # Configuración base (URL base)
│ ├── models/
│ │ ├── cart.dart # Modelo de carrito
│ │ ├── product.dart # Modelo de producto
│ │ └── user.dart # Modelo de usuario
│ └── services/
│ ├── cart_service.dart # Servicio para carritos
│ ├── product_services.dart # Servicio para productos
│ └── user_services.dart # Servicio para usuarios
```


## 📚Tecnologias usas
- Dart
- http – Para consumo de API REST
- dartz – Para manejo funcional de errores (Either)
- Fake Store API – API pública para pruebas
## 🧪 Ejemplo de consola
```bash
----------Datos del producto con id 1----------

🛍️ Producto: Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops
💲 Precio: $109.95
📄 Descripción: Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday
🌟 Rating: Instance of 'Rating' (120 reviews)

----------Datos de un usuario con id 2-----------

✏️ Nombre: david
✏️ Apellido: morrison
👤 Username: mor_2314
✉️ Email: morrison@gmail.com
📌 Dirección: Instance of 'Address'
📞 Celular: 1-570-236-7033

-----------Carrito con id 1----------

🧑 Usuario: john doe (john@gmail.com)
🛍️ Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops 🧾 Cantidad: 4 💰 Total: $439.80
🛍️ Mens Casual Premium Slim Fit T-Shirts  🧾 Cantidad: 1 💰 Total: $22.30
🛍️ Mens Cotton Jacket 🧾 Cantidad: 6 💰 Total: $335.94
```
