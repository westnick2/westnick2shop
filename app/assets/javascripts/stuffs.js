//= require jquery
//= require jquery_ujs
//= require activestorage
//= require_tree .

/* short-descr counter */
$(document).ready(function () {
    let count = 120 - $('#short-description').val().length;
    $('#inputted').text(count);

    $(this).keyup(function () {
        let currentCount = 120 - $('#short-description').val().length;
        let res = count - (count - currentCount);
        if(res < 0 || res === 0){
            $('#inputted').text(res).css({'color': 'red'});
        }else{
            $('#inputted').text(res).css({'color': 'black'});
        }
        /* console.log(count + '-' + currentCount + '=' +res); */
    })
});
/* auto-add category to tags */
$(document).ready(function () {
   $('#stuff_tag_list').on('focus', function () {
       let category = $('#stuff_category_id option:selected').text();
       $(this).val( category + ', ');
   })
});
