// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults



    function showlog(id) 
    {
      var ele = document.getElementById(id);
      if ( ele.hidden == true)
        ele.hidden = false;
      else
        ele.hidden = true;
    }