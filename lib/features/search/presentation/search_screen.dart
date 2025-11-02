import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final List<ServiceItem> allServices;

  const SearchPage({Key? key, required this.allServices}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<ServiceItem> _filteredServices = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _filteredServices = widget.allServices;
  }

  void _filterServices(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      if (query.isEmpty) {
        _filteredServices = widget.allServices;
      } else {
        _filteredServices = widget.allServices
            .where(
              (service) =>
                  service.name.toLowerCase().contains(query.toLowerCase()) ||
                  service.category.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextField(
            controller: _searchController,
            autofocus: true,
            onChanged: _filterServices,
            decoration: InputDecoration(
              hintText: 'Search For Service...',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
              suffixIcon: _isSearching
                  ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey[400]),
                      onPressed: () {
                        _searchController.clear();
                        _filterServices('');
                      },
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_searchController.text.isEmpty) {
      return _buildAllCategories(context);
    } else if (_filteredServices.isEmpty) {
      return _buildNoResults();
    } else {
      return _buildSearchResults(context);
    }
  }

  /// 🟢 Shows categories inside rounded cards with shadows
  Widget _buildAllCategories(BuildContext context) {
    // Group services by category
    Map<String, List<ServiceItem>> groupedServices = {};
    for (var service in widget.allServices) {
      groupedServices.putIfAbsent(service.category, () => []).add(service);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: groupedServices.length,
      itemBuilder: (context, index) {
        String category = groupedServices.keys.elementAt(index);
        List<ServiceItem> services = groupedServices[category]!;

        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 20),
          shadowColor: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🏷 Category Title
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),

                // 🟩 Service Grid
                LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth;
                    int crossAxisCount = 4; // default for large

                    if (width < 350) {
                      crossAxisCount = 3; // small phones
                    } else if (width < 600) {
                      crossAxisCount = 4; // medium phones
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: services.length,
                      itemBuilder: (context, idx) =>
                          _buildServiceCard(services[idx]),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 🔍 Search result grid
  Widget _buildSearchResults(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = 4;

    if (width < 350) {
      crossAxisCount = 2;
    } else if (width < 600) {
      crossAxisCount = 3;
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.9,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: _filteredServices.length,
      itemBuilder: (context, index) =>
          _buildServiceCard(_filteredServices[index]),
    );
  }

  /// 🟢 Rounded, shadowed card for each service
  Widget _buildServiceCard(ServiceItem service) {
    return GestureDetector(
      onTap: service.onTap,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(child: service.icon),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Text(
                service.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'No results found',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}

/// 🟢 Service Item Model
class ServiceItem {
  final String name;
  final Widget icon;
  final String category;
  final VoidCallback onTap;

  ServiceItem({
    required this.name,
    required this.icon,
    required this.category,
    required this.onTap,
  });
}
