var checkbox;

jQuery(function($) {
  $.fn.clearForm = function() {
    return this.each(function() {
      var type = this.type, tag = this.tagName.toLowerCase();
      if (tag == 'form')
        return $(':input',this).clearForm();
      if (type == 'text' || type == 'password' || tag == 'textarea')
        this.value = '';
      else if (type == 'checkbox' || type == 'radio')
        this.checked = false;
      else if (tag == 'select')
        this.selectedIndex = -1;
    });
  };

  $.fn.toggleCheck = function() { 
    var box = $(this);
    if (box.is(":checked")){
      box.removeAttr("checked");
    } else {
      box.attr("checked", "checked");
    }
  };

  jQuery.extend(jQuery.expr[':'], {
    unchecked: function(element) {
      return ('checkbox' === element.type || 'radio' === element.type) && !element.checked;
    }
  });
  // create a convenient toggleLoading function
  var toggleLoading = function() { $("#loading").toggle() };
  toggleLoading();
  $(".mark_complete")
    .bind("ajax:loading",  function(){
        $(this).find("input:checkbox").attr("disabled", true)
    })
    .bind("ajax:complete", function(){
        $(this).find("input:checkbox").attr("disabled", false)
    })
    .bind("ajax:success", function(data, status, xhr) {
      $("#response").html(status);
    });

});


$(function(){
  $(".task img").live('click', function () {
    $(this).siblings(".task .notes").toggle();
  });
});

