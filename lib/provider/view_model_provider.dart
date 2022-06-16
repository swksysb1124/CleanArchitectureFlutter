import 'package:flutter_cleanarchitecture/util/view_model.dart';

abstract class ViewModelProvider {
  List<ViewModel> create();
}