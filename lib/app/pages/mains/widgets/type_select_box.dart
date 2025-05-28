import 'package:flutter/material.dart';
// import 'package:qr_forwarder/common/models/product.dart';
import 'package:qr_forwarder/common/models/server_product.dart';

class TypeSelectBox extends StatefulWidget {
  final String title;
  final bool isPrinterConnected;
  final Function(ServerProduct)? onProductSelected;
  final ServerProduct? selectedProduct;
  final List<ServerProduct> products; // 서버에서 받은 제품 목록

  const TypeSelectBox({
    super.key,
    required this.title,
    required this.products,
    this.isPrinterConnected = false,
    this.onProductSelected,
    this.selectedProduct,
  });

  @override
  State<TypeSelectBox> createState() => _TypeSelectBoxState();
}

class _TypeSelectBoxState extends State<TypeSelectBox> {
  ServerProduct? selectedProduct;

  @override
  void initState() {
    super.initState();
    selectedProduct = widget.selectedProduct;
  }

  @override
  void didUpdateWidget(TypeSelectBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedProduct != oldWidget.selectedProduct) {
      selectedProduct = widget.selectedProduct;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(widget.title),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButton<ServerProduct>(
            isExpanded: true,
            hint: const Text('봉투종류'),
            value: selectedProduct,
            items: widget.products.map((product) {
              return DropdownMenuItem(
                value: product,
                child: Text('${product.prodType} ${product.amount}${product.unit}'),
              );
            }).toList(),
            onChanged: (ServerProduct? value) {
              if (value != null) {
                setState(() {
                  selectedProduct = value;
                });
                widget.onProductSelected?.call(value);
              }
            },
          ),
        ),
      ],
    );
  }
}
