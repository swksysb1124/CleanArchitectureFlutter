import 'package:flutter_cleanarchitecture/provider/view_model_provider.dart';
import 'package:flutter_cleanarchitecture/util/view_model.dart';

class ViewModelProviderImp implements ViewModelProvider {
  List<ViewModel> viewModels;

  ViewModelProviderImp() : viewModels = [];

  @override
  List<ViewModel> create() {
    // TODO: implement create
    return viewModels;
  }


}
