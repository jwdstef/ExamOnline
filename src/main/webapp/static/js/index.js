//鼠标悬浮widget的动态效果
$(function () {
    var w = $(".icons").width();
    var h = $(".icons").height();
    var w2 = w + 5;
    var h2 = h + 5;
    $(".widgets_all").hover(function () {
        //改变图片的大小
        $(this).find('.icons').stop().animate({ height: h2, width: w2}, 'fast');
        //改变div透明度
        $(this).css('opacity','0.9');
    }, function () {
        $(this).find('.icons').stop().animate({ height: h, width: w}, 'fast');
        $(this).css('opacity','1');
    });

    //登录按钮加载中....
    // $("#btn_login").click(function(){
    //     var name = $('#name').val();
    //     var pwd = $('#pwd').val();
    //     if(name==""||pwd==""){
    //         alert("请输入完整信息！");
    //     }else{
    //         $(this).button('loading').delay(1000).queue(function() {
    //             // $(this).button('reset');//加载结束，还原按钮状态，JavaWeb中实现
    //             // $(this).dequeue();
    //         });
    //     }
    // });

    //弹出模态框
    $('#widgets_testrule').click(function(){
        $('#modal_rule').modal();
    });

    $('#widgets_testsearch').click(function(){
        $('#building').modal();
    });

    $('#widgets_testforward').click(function(){
        $('#building').modal();
    });
    //pjax加载页面 有问题，暂时不用
    $('#widgets_testhistory').click(function(){
        window.location.href="/ScoreServlet";
    });

    $('#widgets_testnow').click(function(){
        window.location.href="/ExamPaperLibsServlet?op=test&paperId=1";
    });

    $('#widgets_testuser').click(function(){
        window.location.href="/StuServlet?op=user";
    });


});