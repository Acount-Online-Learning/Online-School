import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubproject/shared/cubit/cubit.dart';
import 'package:githubproject/shared/cubit/states.dart';

import 'components.dart';

class AddChild extends StatelessWidget {
  AddChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EducationCubit, EducationStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = EducationCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add child'),
          ),
          body: ConditionalBuilder(
            condition: cubit.childList.isNotEmpty,
            builder: (context) => buildChildList(cubit,context),
            fallback: (context) => buildFallBackList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              buildShowDialog(context, cubit);
            },
            child: const Icon(Icons.edit),
          ),
        );
      },
    );
  }
}
