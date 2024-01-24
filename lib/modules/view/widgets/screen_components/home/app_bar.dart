import 'package:flutter/material.dart';
import 'package:once_upon_app/modules/presenter/delegate/home/search_delegate.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10.0 ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon( Icons.auto_stories, color: colors.primary ),
              const SizedBox( width: 5 ),
              Text("Once Upon App", style: titleStyle ),
              const Spacer(),
              IconButton(
                  onPressed: () => showSearch(
                      context: context,
                      delegate: SearchStoryDelegate()
                  ),
                  icon: Icon( Icons.search, color: colors.primary ),
              ),

            ],
          ),
        )
      ),
    );
  }
}
