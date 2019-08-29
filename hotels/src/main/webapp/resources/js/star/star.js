$(function(){
    //목표 : .star-wrap 안의 .star-paint 폭을 data-star 값만큼 조정
    $(".star-wrap:not(.star-wrap-edit)").each(function(){
        //목표 : this 안의 .star-paint 폭을 data-star 값만큼 조정
        var point = parseFloat($(this).attr("data-star"));
        var percent = point * 100 / 5;
        $(this).find(".star-paint").width(percent+"%");
    });
    //목표 : .star-wrap 중에서 .star-wrap-edit가 붙은 항목은 수정처리
    // $(".star-wrap.star-wrap-edit").click(function(e){
    $(".star-wrap.star-wrap-edit").mousemove(function(e){
        //알아내야 하는 것 : 좌표 --> 비율 --> 폭설정
        var x = e.pageX - $(this).offset().left + $(window).scrollLeft();
        $(this).find(".star-paint").width(x);
    });
});