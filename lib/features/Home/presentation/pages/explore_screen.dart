import 'package:exam_app/features/Home/presentation/view_model/cubit/home_screen_view_model.dart';
import 'package:exam_app/features/Home/presentation/widget/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/di/di.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/subjects_models.dart';
import '../view_model/states/home_screen_state.dart';

class ExploreScreen extends StatelessWidget {
   ExploreScreen({super.key});
 final HomeScreenViewModel homeScreenViewModel = getIt.get<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    String searchQuery = '';
    List<SubjectsModels> searchSubjectModels = [];

    //homeScreenViewModel.getAllSubjects();
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
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            hintText: 'Search',
            prefixIcon: Icon(
              Icons.search,
            ),
          ),
                  ),
              Text('Browse by subject',

                style: AppTheme.lightTheme.textTheme.labelMedium,
              ),
              Expanded(
                child: BlocBuilder<HomeScreenViewModel, HomeScreenState>(
                    builder: (context, state) {
                      switch(state){
                        case HomeInitialState():
                        case HomeLoadingState():
                          return Center(child: CircularProgressIndicator());
                        case HomeSuccessState():
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.subjects.length,
                            itemBuilder: (context, index) {
                              return SubjectCard(
                                title: state.subjects[index].name,
                                image: state.subjects[index].icon,
                              );
                            },
                          );
                        case HomeErrorState():
                          return Text(state.error);
                          }
                    }
                ),
              ),
              SubjectCard(
                title: 'Mathematics',
                image: 'https://cdn-icons-png.flaticon.com/512/906/906175.png',
              ),



            ]

          ),
        ),
      ),
    );
  }
}
