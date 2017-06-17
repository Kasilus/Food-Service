
$(function()  {
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        localStorage.setItem('lastTab', $(this).attr('href'));
    });

    var lastTab = localStorage.getItem('lastTab');
    if (lastTab) {
        $('[href="' + lastTab + '"]').tab('show');
    }
});

function changeMenu()  {

    var c;
    if(document.getElementById('RestaurantRadiobutton').checked == true){
        c = 2;
    } else {
        c = 1;
    }

    switch (c) {

        case 1:
            $('#nameOrTitle').text('Name:');
            document.getElementById('sexSelect').style.display='block';	break;
        case 2:
            $('#nameOrTitle').text('Title:');
            document.getElementById('sexSelect').style.display='none';    break;
    }
}