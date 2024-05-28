import 'package:flutter/material.dart';

class HeaderViewWidget extends StatelessWidget {
  const HeaderViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'images/img.png',
        ),
        fit: BoxFit.fill,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'What would you like to find',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 228, 228, 228),
              contentPadding: const EdgeInsets.only(top: 5),
              prefixIcon: const Icon(
                Icons.search,
                size: 20,
                color: Color.fromARGB(255, 146, 146, 146),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              hintText: "Search",
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 131, 131, 131),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
