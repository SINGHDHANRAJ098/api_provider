// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';
// import '../widgets/product_item_tile.dart';
//
// class CartsScreen extends StatelessWidget {
//   const CartsScreen({super.key});
//
//   void _fetchData(BuildContext context) {
//     final provider = context.read<CartProvider>();
//
//     if (provider.carts.isEmpty && !provider.isLoading) {
//       Future.microtask(() => provider.loadCart());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _fetchData(context);
//
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//         title: Text(
//           "Cart List",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//
//       body: Consumer<CartProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           if (provider.errorMessage != null) {
//             return Center(child: Text(provider.errorMessage!));
//           }
//
//           return ListView.builder(
//             itemCount: provider.carts.length,
//             itemBuilder: (context, index) {
//               final cart = provider.carts[index];
//
//               return Card(
//                 margin: const EdgeInsets.all(10),
//                 child: ExpansionTile(
//                   title: Text("Cart ${cart.id} — User ${cart.userId}"),
//                   subtitle: Text(
//                     "Products: ${cart.totalProducts} | Qty: ${cart.totalQuantity}",
//                   ),
//                   children: cart.products
//                       .map((p) => ProductItemTile(product: p))
//                       .toList(),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//

//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';
//
// class CartsScreen extends StatelessWidget {
//   const CartsScreen({super.key});
//
//   void _fetchData(BuildContext context) {
//     final provider = context.read<CartProvider>();
//
//     if (provider.carts.isEmpty && !provider.isLoading) {
//       Future.microtask(() => provider.loadCart());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _fetchData(context);
//
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//         title: const Text(
//           "Cart List",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//
//       body: Consumer<CartProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           if (provider.errorMessage != null) {
//             return Center(child: Text(provider.errorMessage!));
//           }
//
//           return ListView.builder(
//             padding: const EdgeInsets.only(top: 10, bottom: 10),
//             itemCount: provider.carts.length,
//             itemBuilder: (context, index) {
//               final cart = provider.carts[index];
//
//               return Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.08),
//                       blurRadius: 12,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//
//                 child: ExpansionTile(
//                   tilePadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 6,
//                   ),
//
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.deepPurple.shade100,
//                     child: Text(
//                       cart.id.toString(),
//                       style: const TextStyle(
//                         color: Colors.deepPurple,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//
//                   title: Text(
//                     "Cart #${cart.id}",
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//
//                   subtitle: Padding(
//                     padding: const EdgeInsets.only(top: 4),
//                     child: Row(
//                       children: [
//                         Chip(
//                           label: Text("User ${cart.userId}"),
//                           backgroundColor: Colors.grey.shade200,
//                         ),
//                         const SizedBox(width: 6),
//                         Chip(
//                           label: Text("Items: ${cart.totalQuantity}"),
//                           backgroundColor: Colors.deepPurple.shade50,
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   childrenPadding: const EdgeInsets.all(12),
//
//                   children: [
//                     ...cart.products.map((p) {
//                       return Container(
//                         margin: const EdgeInsets.only(bottom: 10),
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade50,
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(color: Colors.grey.shade300),
//                         ),
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.network(
//                                 p.thumbnail,
//                                 height: 55,
//                                 width: 55,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//
//                             const SizedBox(width: 12),
//
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     p.title,
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//
//                                   const SizedBox(height: 4),
//
//                                   Text(
//                                     "Qty: ${p.quantity} × ₹${p.price}",
//                                     style: TextStyle(
//                                       color: Colors.grey.shade600,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   "₹${p.total}",
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                                 Text(
//                                   "₹${p.discountedTotal}",
//                                   style: const TextStyle(
//                                     color: Colors.green,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//
//                     const SizedBox(height: 6),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Chip(
//                           backgroundColor: Colors.red.shade50,
//                           label: Text(
//                             "Total: ₹${cart.total}",
//                             style: const TextStyle(
//                               color: Colors.red,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Chip(
//                           backgroundColor: Colors.green.shade50,
//                           label: Text(
//                             "Payable: ₹${cart.discountedTotal}",
//                             style: const TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ecom/providers/select_image_provider.dart';
import 'package:provider_ecom/screens/image_detail_screen.dart';
import '../providers/cart_provider.dart';

class CartsScreen extends StatelessWidget {
  CartsScreen({super.key});

  void _fetchData(BuildContext context) {
    final provider = context.read<CartProvider>();
    if (provider.carts.isEmpty && !provider.isLoading) {
      Future.microtask(() => provider.loadCart());
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchData(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "Cart List",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: Consumer<CartProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: provider.carts.length,
            itemBuilder: (context, index) {
              final cart = provider.carts[index];

              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 10),
                  title: Text(
                    "Cart ${cart.id}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      "User: ${cart.userId}  |  Items: ${cart.totalQuantity}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),

                  childrenPadding: EdgeInsets.all(12),

                  children: [
                    ...cart.products.map((p) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey.shade300),
                        ),

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<SelectImageProvider>()
                                    .selectProduct(p);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ImageDetailScreen(),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  p.thumbnail,
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            SizedBox(width: 14),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Quantity: ${p.quantity}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Price: ${p.price}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${p.total}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "${p.discountedTotal}",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
