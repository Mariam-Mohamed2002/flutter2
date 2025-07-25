import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.weekend, 'label': 'Sofas'},
    {'icon': Icons.wardrobe, 'label': 'wardrobe'},
    {'icon': Icons.desk, 'label': 'Desk'},
    {'icon': Icons.chair_alt, 'label': 'Dresser'},
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'FinnNavian',
      'desc':
          'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
      'price': 248,
      'image': 'https://i.imgur.com/R3Xx5T8.png',
      'isFavorite': true,
    },
    {
      'name': 'FinnNavian',
      'desc': 'Scandinavian small sized single chair',
      'price': 150,
      'image': 'https://i.imgur.com/x6oZAvX.png',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEB3B),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.imgur.com/BoN9kdC.png'), // صورة الشخص
                    radius: 24,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, Mariam',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('What do you want to buy?',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.menu, size: 28),
                ],
              ),
            ),

            // Search
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.amber),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),

            // Categories
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories.map((cat) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Icon(cat['icon'], size: 32),
                        SizedBox(height: 6),
                        Text(cat['label']),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            // Product List
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final item = products[index];
                    return Card(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Image.network(
                            item['image'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['name'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text(
                                  item['desc'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$${item['price']}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.amber)),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.amber),
                                      onPressed: () {},
                                      child: Text('Add to cart'),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              item['isFavorite']
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  item['isFavorite'] ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
