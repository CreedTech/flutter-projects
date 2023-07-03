library pages;

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:programming_quiz_app/config/constants/assets.dart';
import 'package:programming_quiz_app/config/constants/styles.dart';
import 'package:programming_quiz_app/data/helpers/dialog_helpers.dart';
import 'package:programming_quiz_app/data/models/view_model/topic_selection_model.dart';
import 'package:programming_quiz_app/data/utils/topics.dart';
import 'package:programming_quiz_app/domain/repositories/share_preferences_store.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:swipe/swipe.dart';

import '../../config/constants/palettes.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../../domain/repositories/score_store_repository.dart';
import '../../domain/services/navigation/index.dart';
import '../../logic/counter_cubit.dart';
import '../widgets/index.dart';
part 'splash_page.dart';
part 'counter_page.dart';
part 'difficulty_page.dart';
part 'topic_selection_page.dart';
part 'error_page.dart';
part 'home_page.dart';
part 'intro_page.dart';
part 'quiz_page.dart';
part 'score_page.dart';