import '../../constants/core/app_colors.dart';
import '../../constants/widgets/base_text.dart';
import '../../controller/Bearish%20Bloc/bearish_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BearishPage extends StatelessWidget {
  const BearishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<BearishCubit>().increment();
      },
      child: BlocBuilder<BearishCubit, BearishState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Bearish'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                baseTextApp(text: 'سبحان الله'),
                Align(
                  child: CircleAvatar(
                    backgroundColor: AppColors.accent100,
                    radius: 70,
                    child: FittedBox(
                      alignment: Alignment.center,
                      child: baseTextApp(
                        text: '${state.counter}',
                        color: AppColors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
            floatingActionButton: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    elevation: 15,
                    backgroundColor: AppColors.accent100,
                    heroTag: '3',
                    onPressed: () {
                      context.read<BearishCubit>().zero();
                    },
                    child: const Icon(
                      Icons.delete,
                      color: AppColors.textPrimary,
                      size: 30,
                    ),
                  ),
                  FloatingActionButton(
                    elevation: 15,
                    backgroundColor: AppColors.accent100,
                    heroTag: '1',
                    onPressed: () {
                      if (state.counter == 0) {
                        context.read<BearishCubit>().increment();
                      }
                      context.read<BearishCubit>().decrement();
                    },
                    child: const Icon(
                      Icons.remove,
                      color: AppColors.textPrimary,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildMenuButtom() {
  return const ModalBarrier();
}
