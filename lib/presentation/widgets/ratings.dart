import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cell/form_cubit.dart';
import '../styles/colors.dart';

class StarRating extends StatelessWidget {
  const StarRating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            switch (context.read<FormCubit>().state) {
              case 1:
              case 2:
              case 3:
                return const Icon(Icons.star, color: Color(0xFFFF9529));
              case 4:
              case 5:
                return index == 2
                    ? const Icon(Icons.star_border_outlined, color: white)
                    : const Icon(Icons.star, color: Color(0xFFFF9529));

              case 6:
              case 7:
                return index == 0
                    ? const Icon(Icons.star, color: Color(0xFFFF9529))
                    : const Icon(Icons.star_border_outlined, color: white);
              default:
                return const Icon(
                  Icons.star_border_outlined,
                  color: white,
                );
            }
          },
          separatorBuilder: (context, index) => const SizedBox(width: 4),
          itemCount: 3),
    );
  }
}
