abstract class home_state {}

class home_intial_state extends home_state{}

class get_home_data_loading_state extends home_state{}

class get_home_data_success_state extends home_state{}

class get_home_data_error_state extends home_state{}

class search_Loading_state extends home_state{}

class search_Success_state extends home_state{}

class search_Error_state extends home_state{
  final String error;

  search_Error_state(this.error);
}