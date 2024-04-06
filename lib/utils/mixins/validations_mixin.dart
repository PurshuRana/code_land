/*Author: Purushotham
Created On: 04-04-2024*/

mixin ValidationsMixin{
  String? validateLoginUserName(String? text){
    if(text == null || text.trim().isEmpty){
      return 'Please enter user name';
    }
    return null;
  }

  String? validateLoginPassword(String? text){
    if(text == null || text.trim().isEmpty){
      return 'Please enter password';
    }
    return null;
  }
}

