abstract class category_state{}

class category_intial_state extends category_state{}

class get_category_loading_state extends category_state{}

class get_category_success_state extends category_state{}

class get_category_error_state extends category_state{
  final String error;

  get_category_error_state(this.error);
}
