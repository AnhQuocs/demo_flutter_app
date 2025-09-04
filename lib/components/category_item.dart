import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String category;
  final String date;
  final String price;

  const CategoryItem({
    Key? key,
    required this.icon,
    required this.color,
    required this.category,
    required this.date,
    required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: Colors.grey.withOpacity(0.15),
              width: 1
          )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: color,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),

                SizedBox(width: 10,),

                Text(
                  category,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),

            SizedBox(
              height: 44,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "-$priceđ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                  ),

                  Text(
                    date,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}