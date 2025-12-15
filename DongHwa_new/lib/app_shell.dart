import 'package:flutter/material.dart';
import 'pages/menu_tab.dart';
import 'pages/pur_in_page.dart';
import 'pages/placeholder_page.dart';

enum AppRoute { purIn, placeholder }

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> with SingleTickerProviderStateMixin {
  late final TabController _tab;

  final _tabs = const [
    ('입고/구매', [
      ('입고 조회', Icons.inventory_2_outlined, AppRoute.purIn),
      ('발주 조회', Icons.shopping_cart_outlined, AppRoute.placeholder),
      ('거래처', Icons.business_outlined, AppRoute.placeholder),
    ]),
    ('생산', [
      ('작업지시', Icons.factory_outlined, AppRoute.placeholder),
      ('실적', Icons.query_stats_outlined, AppRoute.placeholder),
      ('불량', Icons.report_problem_outlined, AppRoute.placeholder),
    ]),
    ('설비/점검', [
      ('설비 목록', Icons.precision_manufacturing_outlined, AppRoute.placeholder),
      ('점검', Icons.checklist_outlined, AppRoute.placeholder),
      ('수리', Icons.build_outlined, AppRoute.placeholder),
    ]),
    ('기준정보', [
      ('품목', Icons.category_outlined, AppRoute.placeholder),
      ('공정', Icons.account_tree_outlined, AppRoute.placeholder),
      ('창고', Icons.warehouse_outlined, AppRoute.placeholder),
    ]),
  ];

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  void _open(AppRoute r, String title) {
    final page = switch (r) {
      AppRoute.purIn => const PurInPage(),
      _ => PlaceholderPage(title: title),
    };
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DongHwa'),
        bottom: TabBar(
          controller: _tab,
          isScrollable: true,
          tabs: [for (final t in _tabs) Tab(text: t.$1)],
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: [
          for (final t in _tabs)
            MenuTab(
              items: t.$2
                  .map((e) => MenuItem(
                        title: e.$1,
                        icon: e.$2,
                        onTap: () => _open(e.$3, e.$1),
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }
}
