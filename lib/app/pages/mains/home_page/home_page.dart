import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_forwarder/app/pages/mains/widgets/common_button_widget.dart';
import 'package:qr_forwarder/app/pages/mains/widgets/common_input_widget.dart';
import 'package:qr_forwarder/app/pages/mains/widgets/type_select_box.dart';
import 'package:qr_forwarder/app/controller/home_page_controller.dart';
import 'package:qr_forwarder/common/api_services/socket_connect_service.dart';
import 'package:qr_forwarder/common/models/server_product.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // List<Product> prods = [];  // 제거
  String? selectedBagType;
  late HomePageController controller;

  late TabController _tabController;
  late List<TabItemController> tabControllers;
  int tabCount = 6; // 초기 탭 개수

  List<Tab> get tabs => List.generate(
        tabCount,
        (index) => Tab(text: 'QR 마킹기 라인 ${index + 1}'),
      );

  @override
  void initState() {
    super.initState();
    controller = HomePageController(
      printerIpController: TextEditingController(),
      printerPortController: TextEditingController(),
    );

    // 제품 목록 요청
    controller.requestGetProductList(0); // 첫 번째 탭에 대해 요청

    // 1. 탭 컨트롤러 리스트 생성 및 HomePageController에 등록
    tabControllers = List.generate(
      tabCount,
      (index) {
        final tabController = TabItemController(
          lineDescController: TextEditingController(),
          bagAmountController: TextEditingController(),
          currentBagAmountController: TextEditingController(),
          addToBagAmountController: TextEditingController(),
          printerIpController: TextEditingController(),
          printerPortController: TextEditingController(),
          homePageController: controller,
          tabIndex: index,
        );
        controller.addTab(tabController);
        return tabController;
      },
    );

    // 2. 반드시 tabControllers 생성 후 _tabController 초기화!
    _tabController = TabController(length: tabCount, vsync: this);

    controller.addListener(() => setState(() {}));
    // controller.fetchFirstQrs();
  }

  void _addTab() {
    setState(() {
      final newController = TabItemController(
        lineDescController: TextEditingController(),
        bagAmountController: TextEditingController(),
        currentBagAmountController: TextEditingController(),
        addToBagAmountController: TextEditingController(),
        printerIpController: TextEditingController(),
        printerPortController: TextEditingController(),
        homePageController: controller,
        tabIndex: tabCount,
      );
      tabControllers.add(newController);
      controller.addTab(newController); // HomePageController에도 반드시 추가!
      tabCount++;

      // 항상 tabCount, tabControllers 변경 후 _tabController 재생성
      final oldIndex = _tabController.index;
      _tabController.dispose();
      _tabController = TabController(
        length: tabCount,
        vsync: this,
        initialIndex: oldIndex < tabCount - 1 ? oldIndex : tabCount - 1,
      );
    });
  }

  void _removeTab() {
    if (tabCount > 1) {
      setState(() {
        final currentIndex = _tabController.index;

        final controllerToRemove = tabControllers.last;
        controllerToRemove.lineDescController.dispose();
        controllerToRemove.bagAmountController.dispose();
        controllerToRemove.currentBagAmountController.dispose();
        controllerToRemove.printerIpController.dispose();
        controllerToRemove.printerPortController.dispose();

        tabControllers.removeLast();
        controller.removeTab(tabControllers.length); // HomePageController에서도 같이 삭제!
        tabCount--;

        // 항상 tabCount, tabControllers 변경 후 _tabController 재생성
        _tabController.dispose();
        _tabController = TabController(
          length: tabCount,
          vsync: this,
          initialIndex: currentIndex >= tabCount ? tabCount - 1 : currentIndex,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Row(
            children: [
              Expanded(
                child: TabBar(
                  controller: _tabController,
                  tabs: tabs,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _addTab,
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: _removeTab,
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          tabCount,
          (index) => TabItemView(
            controller: tabControllers[index],
            tabIndex: index,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in tabControllers) {
      controller.lineDescController.dispose();
      controller.bagAmountController.dispose();
      controller.currentBagAmountController.dispose();
      controller.addToBagAmountController.dispose();
      controller.printerIpController.dispose();
      controller.printerPortController.dispose();
    }
    _tabController.dispose();
    controller.dispose();
    super.dispose();
  }
}

// 각 탭의 컨트롤러
class TabItemController extends ChangeNotifier {
  final TextEditingController lineDescController;
  final TextEditingController bagAmountController;
  final TextEditingController currentBagAmountController;
  final TextEditingController addToBagAmountController;
  final TextEditingController printerIpController;
  final TextEditingController printerPortController;
  final HomePageController homePageController;
  ServerProduct? selectedProduct;
  int currentCount = 0;
  final int tabIndex;

  // 각 탭별 연결 상태와 서비스 관리
  SocketConnectService? socketConnectService;
  bool isPrinterConnected = false;

  TabItemController({
    required this.lineDescController,
    required this.bagAmountController,
    required this.currentBagAmountController,
    required this.addToBagAmountController,
    required this.printerIpController,
    required this.printerPortController,
    required this.homePageController,
    required this.tabIndex,
  });

  Future<void> connectPrinter() async {
    final ip = printerIpController.text;
    final portText = printerPortController.text;
    try {
      final port = int.parse(portText);
      debugPrint('프린터 연결 시도: IP = $ip, Port = $port');

      socketConnectService =
          SocketConnectService(ipAddress: ip, port: port, homePageController: homePageController);
      await socketConnectService!.connect(ip, port);

      isPrinterConnected = true;
      homePageController.notifyListeners(); // UI 업데이트를 위해
    } catch (e) {
      debugPrint('Error connecting to printer: $e');
      isPrinterConnected = false;
      homePageController.notifyListeners();
    }
  }

  void disconnectPrinter() {
    socketConnectService?.disconnect();
    socketConnectService = null;
    isPrinterConnected = false;
    homePageController.notifyListeners();
  }

  void increaseCount() {
    currentCount++;
    final amount = int.tryParse(bagAmountController.text);
    homePageController.amountCount = homePageController.amountCount - 1;
    print("amount 값은 = ${homePageController.amountCount.toString()}");
    if (homePageController.amountCount == 2 &&
        amount != null &&
        homePageController.isReturnToken == false) {
      print("retry qrcodes!!!");
      homePageController.resendQrcodes(
        amount,
        tabIndex,
      );
      homePageController.amountCount = homePageController.amountCount + amount;
    }
    notifyListeners();
  }

  void resetCount() {
    currentCount = 0;
    notifyListeners();
  }
}

// 각 탭의 뷰
class TabItemView extends StatefulWidget {
  final TabItemController controller;
  final int tabIndex;

  const TabItemView({
    Key? key,
    required this.controller,
    required this.tabIndex,
  }) : super(key: key);

  @override
  State<TabItemView> createState() => _TabItemViewState();
}

class _TabItemViewState extends State<TabItemView> {
  late VoidCallback _homePageListener;
  late VoidCallback _tabItemListener;

  @override
  void initState() {
    super.initState();
    // 리스너 함수 정의
    _homePageListener = () {
      if (mounted) setState(() {});
    };
    _tabItemListener = () {
      if (mounted) setState(() {});
    };

    // 리스너 등록
    widget.controller.homePageController.addListener(_homePageListener);
    widget.controller.addListener(_tabItemListener);
  }

  @override
  void dispose() {
    // 리스너 제거
    widget.controller.homePageController.removeListener(_homePageListener);
    widget.controller.removeListener(_tabItemListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'QR 마킹기 라인 ${widget.tabIndex + 1}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 16),
          TypeSelectBox(
            title: "봉투 종류",
            products: widget.controller.homePageController.serverProducts,
            selectedProduct: widget.controller.selectedProduct,
            onProductSelected: (product) {
              setState(() {
                widget.controller.selectedProduct = product;
              });
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(
                flex: 5,
                child: CommonInputWidget(
                  title: '생산요청수량',
                  controller: widget.controller.bagAmountController,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                flex: 1,
                child: CommonButtonWidget(
                  title: '생산 요청',
                  onTap: () {
                    final amount = int.tryParse(widget.controller.bagAmountController.text);
                    if (amount != null) {
                      widget.controller.homePageController.fetchQrcodes(
                        amount,
                        widget.tabIndex,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Flexible(
                flex: 5,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        '생산 수량',
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    '${widget.controller.currentCount}',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(
                flex: 5,
                child: CommonInputWidget(
                  title: '추가수량',
                  controller: widget.controller.addToBagAmountController,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                flex: 1,
                child: CommonButtonWidget(
                  title: '추가 생산 요청',
                  onTap: () {
                    final amount = int.tryParse(widget.controller.addToBagAmountController.text);
                    if (amount != null) {
                      widget.controller.homePageController.fetchQrcodes(
                        amount,
                        widget.tabIndex,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CommonButtonWidget(
                  title: '인쇄 시작 설정',
                  onTap: () {
                    widget.controller.homePageController.startPrint(widget.tabIndex);
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CommonButtonWidget(
                  title: '인쇄 중지 설정',
                  onTap: () {
                    widget.controller.homePageController.stopPrint(widget.tabIndex);
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CommonButtonWidget(
                  title: '해 제',
                  onTap: () {
                    widget.controller.homePageController.returnTokens(widget.tabIndex);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Row(
          //   children: [
          //     Expanded(
          //       child: CommonButtonWidget(
          //         title: 'lock !',
          //         onTap: () {
          //           widget.controller.homePageController.lockingPrint(widget.tabIndex);
          //         },
          //       ),
          //     ),
          //     const SizedBox(width: 8),
          //     Expanded(
          //       child: CommonButtonWidget(
          //         title: 'unlock !',
          //         onTap: () {
          //           widget.controller.homePageController.unlockingPrint(widget.tabIndex);
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CommonInputWidget(
                  title: 'QR 마킹기 IP',
                  controller: widget.controller.printerIpController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CommonInputWidget(
            title: 'QR 마킹기 Port',
            controller: widget.controller.printerPortController,
          ),
          const SizedBox(height: 12),
          Text(
            '연결 상태: ${widget.controller.isPrinterConnected ? "연결됨" : "해제됨"}',
            style: TextStyle(
              fontSize: 14,
              color: widget.controller.isPrinterConnected ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 12),
          CommonButtonWidget(
            title: widget.controller.isPrinterConnected ? 'QR 마킹기 해제하기' : 'QR 마킹기 연결하기',
            onTap: () {
              if (widget.controller.isPrinterConnected) {
                widget.controller.disconnectPrinter();
              } else {
                widget.controller.connectPrinter();
              }
            },
          ),
        ],
      ),
    );
  }
}
