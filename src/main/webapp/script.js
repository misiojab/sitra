jQuery(function($){
    $("ul li").click(function(){
        var id = $(this).attr("id");

        $(".wrapper > div").removeClass("visible");
        $(".wrapper > div." + id).addClass("visible");
    });

    $(".nav-link").click(function() {  //use a class, since your ID gets mangled
        $(".nav-link").removeClass("active");
        $(this).addClass("active");      //add the class to the clicked element
    });
});