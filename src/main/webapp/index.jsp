<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cc.ryanc.entity.StuInfo" %>
<%@ page import="cc.ryanc.dao.SiteDao" %>
<%@ page import="cc.ryanc.entity.SiteInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: RYAN0UP
  Date: 2017/9/13
  Time: 9:04
--%>
<!DOCTYPE HTML>
<html>
	<%
		SiteDao siteDao = new SiteDao();
		SiteInfo siteInfo = siteDao.getQuery();
	%>
	<head>
		<title><%=siteInfo.getTitle()%></title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="<%=siteInfo.getWords()%>">
		<meta http-equiv="description" content="<%=siteInfo.getDescr()%>">
		<link rel="icon shortcut" type="image/ico" href="/static/img/favicon.png">
		<link rel="stylesheet" type="text/css" href="static/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="static/css/style.css">
		<!-- 进度条 -->
		<link rel="stylesheet" type="text/css" href="static/css/nprogress.css">
		<script src='static/js/nprogress.js'></script>
	</head>
	<%
		StuInfo stuInfo = (StuInfo)request.getSession().getAttribute("stuInfo");
		if(stuInfo==null){
		    stuInfo = new StuInfo();
		    stuInfo.setStuName("");
		}
	%>
	<body>
		<!--头部-->
		<header>
			<div id="user">
				<a data-toggle="modal" data-target="#login" style="cursor: pointer;">
					<i class="fa fa-user-circle-o fa-2x" aria-hidden="true"></i>
				</a>
				<span style="font-size: 22px"><%=stuInfo.getStuName()%></span>
			</div>
		</header>
		<!--主框架-->
		<div class="container">
			<div class="widgets">
				<div class="widgets_all" id="widgets_testnow">
					<div class="w_bigicons">
						<img src="static/img/now.svg" style="width: 64px;height: 64px;" class="icons" />
					</div>
					<div class="w_title">
						<span>当前考试</span>
					</div>
					<%
						if(request.getSession().getAttribute("userInfo")!=null){
					%>
						<span style="font-size: 10px;color: red;" id="timeOut"></span>
					<%
						}
					%>
				</div>
				<div class="widgets_all" id="widgets_testforward">
					<div class="w_icons">
						<img src="static/img/date.svg" style="width: 64px;height: 64px;" class="icons" />
					</div>
					<div class="w_title">
						<span>预约考试</span>
					</div>
				</div>
				<div class="widgets_all" id="widgets_testrule">
					<div class="w_icons">
						<img src="static/img/rule.svg" style="width: 64px;height: 64px;" class="icons" />
					</div>
					<div class="w_title">
						<span>参考纪律</span>
					</div>
				</div>
				<div class="widgets_all" id="widgets_testhistory">
					<div class="w_icons">
						<img src="static/img/history.svg" style="width: 64px;height: 64px;" class="icons" />
					</div>
					<div class="w_title">
						<span>历史试卷</span>
					</div>
				</div>
				<div class="widgets_all" id="widgets_testsearch">
					<div class="w_icons">
						<img src="static/img/search.svg" style="width: 64px;height: 64px;" class="icons" />
					</div>
					<div class="w_title">
						<span>成绩查询</span>
					</div>
				</div>
				<div class="widgets_all" id="widgets_testuser">
					<div class="w_bigicons">
						<img src="static/img/user.svg" style="width: 64px;height: 64px;" class="icons" />
					</div>
					<div class="w_title">
						<span>个人中心</span>
					</div>
				</div>
			</div>

			<!-- 登录模态框 -->
			<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="loginLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content" id="login-content">
						<div class="modal-header" id="login-title">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<i class="fa fa-times fa-lg" aria-hidden="true"></i>
							</button>
							<h2 class="modal-title" id="myModalLabel">学生登录</h2>
						</div>
						<div class="modal-body" id="login-account">
							<form role="form" action="/StuServlet" method="post" id="myform">
								<input type="hidden" value="login" name="op">
								<div class="input-group input-group-lg">
						            <input type="text" class="form-control" placeholder="学号" name="stuNo" id="no">
						        </div><br>
								<div class="input-group input-group-lg">
						            <input type="password" class="form-control" placeholder="密码" name="stuPwd" id="pwd">
						        </div>
							</form>
						</div>
						<div class="modal-footer" id="login-footer">
							<input type="submit" id="btn_login" class="btn btn-primary btn-lg btn-block" value="登录" onclick = "checkUser();">
							<button type="button" class="btn btn-default btn-lg btn-block" data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 考试纪律模态框 -->
			<div class="modal fade bs-example-modal-lg" id="modal_rule" tabindex="-1" role="dialog" aria-labelledby="ruleLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h2 class="modal-title" id="myModalLabel">考试纪律</h2>
						</div>
						<div class="modal-body">
							<h3>为了端正考风考纪，保证考试顺利进行，希望大家严格遵守以下考场纪律及要求： </h3>
							<ul class="list-group">
								<li class="list-group-item">1.严禁携带任何书籍、笔记本等与考试有关的资料进入考场，请将考试无关的物品集中放于指定位置。  </li>
								<li class="list-group-item">2.考试前10分钟凭身份证进入考场，按照编排的座位就坐，并将身份证、毕业证、学位证原件和复印件放桌子左上角备查。</li>
								<li class="list-group-item">3.迟到30分钟以上（含30分钟），不得入场参加考试，考试30分钟后，才允许交卷出场。</li>
								<li class="list-group-item">4.不到开考时间，不得答题，答题时一律用黑色签字笔或钢笔书写，字迹要工整、清楚，并要书写在试卷规定的位置。</li>
								<li class="list-group-item">5.除在试卷规定处填写自己的姓名等信息外，严禁作任何与答题无关的标记，否则试卷作废。</li>
								<li class="list-group-item">6.考试期间，请保持安静，关闭所有通讯工具，严禁吸烟。</li>
								<li class="list-group-item">7.如遇试卷分发错误或字迹模糊等问题，可举手询问，监考人员当众解答，需要看时间请自带手表或询问监考人员。</li>
								<li class="list-group-item">8.杜绝一切作弊行为，严禁交头接耳、偷看、夹带、抄袭、替考，违者取消考试资格。</li>
								<li class="list-group-item">9.考试期间，不得擅自挪动座位，违者认定为考场违纪，交卷前不得以任何理由离开考场，否则按交卷处理。</li>
								<li class="list-group-item">10.考试时间一到，应立即停止答卷，经监考人员核查无误后，方可逐一离开，试卷、草稿纸等考试相关资料不可带离考场，交卷后应立即离开考场，严禁在考场周围逗留、谈论。  预祝大家考试顺利！</li>
							</ul>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">我知道了</button>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade bs-example-modal-lg" id="building" tabindex="-1" role="dialog" aria-labelledby="ruleLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h2 class="modal-title" id="myModalLabel">正在建设中....</h2>
						</div>
						<div class="modal-body">
							<p>熬夜....</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">我知道了</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<span><%=siteInfo.getCopyright()%> <%=siteInfo.getIcp()%></span>
		</footer>
	</body>
	<!-- Jquery -->
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/pjax.min.js"></script>
	<script type="text/javascript" src="static/js/index.js"></script>
	<script>
		NProgress.start();
		setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
	</script>
	<script>
		<%
			if(request.getSession().getAttribute("msg")!=null){
		%>
				alert("<%=request.getSession().getAttribute("msg")%>")
		<%
				request.getSession().removeAttribute("msg");
			}
		%>
	</script>
	<script language="javascript" type="text/javascript">
        var intDiff = parseInt(3600);
        function timer(intDiff){
            window.setInterval(function(){
                var day=0,
                    hour=0,
                    minute=0,
                    second=0;//时间默认值
                if(intDiff > 0){
                    day = Math.floor(intDiff / (60 * 60 * 24));
                    hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                    minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                    second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
                }
                if (minute <= 9) minute = '0' + minute;
                if (second <= 9) second = '0' + second;
                $('#timeOut').html("&emsp;距离最近的考试还有"+day+"天"+hour+":"+minute+":"+second);
                intDiff--;
            }, 1000);
        }
        $(function(){
            timer(intDiff);
        });
	</script>
	<script>
        function checkUser(){
            var result = document.getElementById("no").value;
            var password = document.getElementById("pwd").value;

            if(result == ""){
                alert("用户名不能为空");
                return false;
            }
            if(password == ""){
                alert("密码不能为空");
                return false;
            }
            document.getElementById("myform").submit();
        }
	</script>
</html>
