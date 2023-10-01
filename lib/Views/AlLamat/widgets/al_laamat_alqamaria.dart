import '../Allaamatalqamaria/allamat_qamerya.dart';
import '../Allaamatalshamsia/allaamat_alshamsia.dart';
import '../../../constants/core/app_images.dart';
import '../../../constants/widgets/build_list_grid.dart';
import 'package:flutter/material.dart';

class AllaamatalqamariaPage extends StatefulWidget {
  const AllaamatalqamariaPage({super.key});

  @override
  State<AllaamatalqamariaPage> createState() => _AllaamatalqamariaPageState();
}

class _AllaamatalqamariaPageState extends State<AllaamatalqamariaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allaamatalqamaria'),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverGrid.count(
                  crossAxisCount: 2,
                  children: [
                    buildListGridView(
                      context,
                      text: 'Allaamatalqamaria',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AllamatAlQamrya()));
                      },
                      image: AppImages.imageCircle,
                    ),
                    buildListGridView(
                      context,
                      text: 'Allaamatalshamsia',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Allaamatalshamsia()));
                      },
                      image: AppImages.imageCircle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
