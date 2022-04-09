

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quantum_proj/data/models/auth_models/auth_res_model.dart';
import 'package:quantum_proj/data/models/base_models/base_listed_res.dart';
import 'package:quantum_proj/data/models/base_models/base_single__res.dart';
import 'package:quantum_proj/data/models/base_models/failure_model.dart';
import 'package:quantum_proj/data/models/prod_and_cat_models/category_model.dart';
import 'package:quantum_proj/data/models/prod_and_cat_models/product.dart';
import 'package:quantum_proj/data/models/user_model.dart';
import 'package:quantum_proj/data/service/hive_services.dart' as hive_services;
import 'package:quantum_proj/data/service/remote_service.dart';
import 'package:quantum_proj/utils/constants/resources.dart';
import 'package:quantum_proj/utils/locator/imports.dart';

part 'auth_repo.dart';
part 'data_repo.dart';
