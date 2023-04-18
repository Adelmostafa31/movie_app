abstract class login_register_state{}

class login_register_intial_state extends login_register_state{}

class get_user_loading_state extends login_register_state{}

class get_user_success_state extends login_register_state{}

class get_user_error_state extends login_register_state{
  final String error;
  get_user_error_state(this.error);
}

class login_loading_state extends login_register_state{}

class login_success_state extends login_register_state{}

class login_error_state extends login_register_state{
  final String error;
  login_error_state(this.error);
}

class register_loading_state extends login_register_state{}

class register_success_state extends login_register_state{}

class register_error_state extends login_register_state{
  final String error;
  register_error_state(this.error);
}

class creat_user_error_state extends login_register_state{
  final String error;
  creat_user_error_state(this.error);
}

class sign_in_with_google_loading_state extends login_register_state{}

class sign_in_with_google_error_state extends login_register_state{
  final String error;
  sign_in_with_google_error_state(this.error);
}

class picked_image_success_state extends login_register_state{}

class picked_image_error_state extends login_register_state{}

class upload_profile_loading_state extends login_register_state{}

class upload_profile_error_state1 extends login_register_state{}

class upload_profile_error_state2 extends login_register_state{}

class update_user_loading_state extends login_register_state{}

class update_user_success_state extends login_register_state{}

class update_user_error_state extends login_register_state{}
