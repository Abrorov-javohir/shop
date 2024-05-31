import 'package:flutter/material.dart';
import 'package:shop1/models/product.dart';
import 'package:shop1/models/users.dart';
import 'package:shop1/services/users_http_services.dart';
import 'package:shop1/views/screens/categories_screen.dart';
import 'package:shop1/views/screens/products_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<List<Users>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = UserService().fetchUsers(); // Fetch users instead of products
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: FutureBuilder<List<Users>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available'));
          }

          List<Users> products = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              Users product = products[index];
              return GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text(product.name),
                  subtitle: Text('\$${product.password}'),
                ),
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6.0,
        color: Colors.blue,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.category),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesScreen(),
                  ),
                );
              },
            ),
            // Placeholder onPressed function for the "User" IconButton
            // Decide what action should be performed when this button is pressed
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.white,
              onPressed: () {
                // Decide what action should be performed when this button is pressed
              },
            ),
          ],
        ),
      ),
    );
  }
}
