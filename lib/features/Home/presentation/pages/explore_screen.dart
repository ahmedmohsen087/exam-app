import 'package:exam_app/features/Home/presentation/view_model/cubit/home_screen_view_model.dart';
import 'package:exam_app/features/Home/presentation/widget/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/di/di.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../view_model/states/home_screen_state.dart';

class ExploreScreen extends StatelessWidget {
   ExploreScreen({super.key});
 final HomeScreenViewModel homeScreenViewModel = getIt.get<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider<HomeScreenViewModel>(
        create: (context) => homeScreenViewModel..getAllSubjects(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: (value) {
                  context.read<HomeScreenViewModel>().onSearchChanged(value);
                },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            hintText: 'Search',
            prefixIcon: Icon(Icons.search,),
          ),
                  ),
              Text('Browse by subject',

                style: AppTheme.lightTheme.textTheme.labelMedium,
              ),
              Expanded(
                child: BlocBuilder<HomeScreenViewModel, HomeScreenState>(
                    builder: (context, state) {
                      if(state.isLoadingSubjects){
                        return Center(child: CircularProgressIndicator());
                      }
                      if(state.errorMessage != null && state.errorMessage!.isNotEmpty){
                        return Center(child: Text(state.errorMessage!)
                        );
                      }
                      final list = state.searchQuery.trim().isEmpty
                          ? state.subjectsList
                          : state.searchSubjectModels;

                      if (list.isEmpty) {
                        return const Center(
                          child: Text('No results found'),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return SubjectCard(
                            title: list[index].name ,
                            image: list[index].icon ,
                          );
                        },
                      );
                    }
                ),
              ),
              SubjectCard(
                title: 'Mathematics',
                image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAGtClPVRwPdM34hqRwy3gy_tljgIAhm3nWQ&s n',
              ),



            ]

          ),
        ),
      ),
    );
  }

}
