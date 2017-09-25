<%@ page import="cc.ryanc.entity.ExamLibrary" %>
<%@ page import="cc.ryanc.dao.ExamLibraryDao" %>
<%@ page import="cc.ryanc.entity.ExamPaper" %>
<%@ page import="cc.ryanc.dao.ExamPaperDao" %><%--
  Created by IntelliJ IDEA.
  User: RYAN0UP
  Date: 2017/9/13
  Time: 9:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
	<head>
	   	<title>ExamOnline后台</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	   	<meta name="keywords" content="后台管理,ExamOnline后台">
	   	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon shortcut" type="image/ico" href="../static/img/favicon.png">
	   	<meta name="renderer" content="webkit">
	    <meta http-equiv="Cache-Control" content="no-siteapp" />
	    <link rel="stylesheet" href="../static/css/amazeui.min.css" />
	    <link rel="stylesheet" href="../static/css/app.css">
	</head>
	<%
		ExamLibraryDao examLibraryDao = new ExamLibraryDao();
		int libCount = examLibraryDao.getCount();
	%>
	<body data-type="index" class="theme-black">
	    <div class="am-g tpl-g">
			<!-- 动态包含header头部 -->
			<jsp:include page="module/header.jsp" flush="true"/>
			<!-- 动态包含风格切换按钮 -->
			<%--<jsp:include page="theme.jsp" flush="true"/>--%>
			<!-- 动态包含左侧菜单 -->
			<jsp:include page="module/menu.jsp" flush="true"/>
	        <!-- 内容区域 -->
			<!-- 内容区域 -->
			<div class="tpl-content-wrapper">
				<div class="container-fluid am-cf">
					<div class="row">
						<div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
							<div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 首页概览 <small>Home Watching</small></div>
						</div>
					</div>
				</div>
				<div class="row-content am-cf">
					<div class="row am-cf">
						<div class="am-u-sm-12 am-u-md-12 am-u-lg-4">
							<div class="widget am-cf">
								<div class="widget-head am-cf">
									<div class="widget-title am-fl">总题库量</div>
									<div class="widget-function am-fr">
										<a href="javascript:;" class="am-icon-cog"></a>
									</div>
								</div>
								<div class="widget-body am-fr">
									<div class="am-fl">
										<div class="widget-fluctuation-period-text">
											<%=libCount%>
											<a href="/ExamPaperServlet" class="widget-fluctuation-tpl-btn">
												<i class="am-icon-calendar"></i>
												出套题呗
											</a>
										</div>
									</div>
									<div class="am-fr am-cf">
										<div class="widget-fluctuation-description-amount text-success" am-cf>
											+2
										</div>
										<div class="widget-fluctuation-description-text am-text-right">
											本周新增
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
							<div class="widget widget-primary am-cf">
								<div class="widget-statistic-header">
									总试卷量
								</div>
								<div class="widget-statistic-body">
									<div class="widget-statistic-value">
										1
									</div>
									<div class="widget-statistic-description">
										本周新增 <strong>1</strong> 套
									</div>
								</div>
							</div>
						</div>
						<div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
							<div class="widget widget-purple am-cf">
								<div class="widget-statistic-header">
									总用户量
								</div>
								<div class="widget-statistic-body">
									<div class="widget-statistic-value">
										16
									</div>
									<div class="widget-statistic-description">
										本周新增 <strong>2</strong> 人
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row am-cf">
						<div class="am-u-sm-12 am-u-md-12 am-u-lg-6">
							<div class="widget am-cf">
								<div class="widget-body am-fr">
									<div style="height: 400px" id="what">

									</div>
								</div>
							</div>
						</div>
						<div class="am-u-sm-12 am-u-md-12 am-u-lg-6">
							<div class="widget am-cf" >
								<div class="widget-body am-fr">
									<div style="height: 400px" id="what1">

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	    </div>
		<script src="../static/js/jquery.min.js"></script>
		<script src="../static/js/amazeui.min.js"></script>
		<!--<script src="/admin/static/js/pjax.min.js"></script>-->
        <script src="../static/js/amazeui.datatables.min.js"></script>
		<script src="../static/js/dataTables.responsive.min.js"></script>
		<script src="../static/js/echarts.min.js"></script>
		<script src="../static/js/app.js"></script>
		<script>
			$.AMUI.progress.start();
			setTimeout(function() { $.AMUI.progress.done(); $('.fade').removeClass('out'); }, 1000);
		</script>
		<script type="text/javascript">
			/*
            <!-- 获取进度条对象 -->
            var progress = $.AMUI.progress.configure({ ease: 'ease', speed: 1000 });
            <!-- 设置pjax，刷新替换content里面的内容 -->
            $(document).pjax('a[target!=_blank]', '#content', {fragment: '#content',timeout: 8000});

            <!--发送请求的时候开始进度条-->
            $(document).on('pjax:send', function() {
                progress.start();
            });

            <!-- 响应完成的时候停止进度条 -->
            $(document).on('pjax:complete', function() {
                progress.done();
            });
            */
		</script>
		<script type="text/javascript">
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('what'));
            var myChart1 = echarts.init(document.getElementById('what1'));

            // 指定图表的配置项和数据
            option = {
                title: {
                    text: '月考统计'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data:['JAVA','.NET','PHP']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                toolbox: {
                    feature: {
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['第一次','第二次','第三次','第四次','第五次','第六次']
                },
                yAxis: {
                    min: 80,
                    type: 'value',
                },
                series: [
                    {
                        name:'JAVA',
                        type:'line',
                        data:[88, 89, 88.5, 92.5, 97.1, 94.1]
                    },
                    {
                        name:'.NET',
                        type:'line',
                        data:[86, 87, 91, 85.5, 87.9, 95.5]
                    },
                    {
                        name:'PHP',
                        type:'line',
                        data:[87, 94.8, 86.9, 92.5, 93.6, 91.7]
                    }
                ]
            };

            var option1 = {
                backgroundColor: '#2c343c',

                title: {
                    text: '课程火热度',
                    left: 'center',
                    top: 20,
                    textStyle: {
                        color: '#ccc'
                    }
                },

                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },

                visualMap: {
                    show: false,
                    min: 80,
                    max: 600,
                    inRange: {
                        colorLightness: [0, 1]
                    }
                },
                series : [
                    {
                        name:'选择人数',
                        type:'pie',
                        radius : '55%',
                        center: ['50%', '50%'],
                        data:[
                            {value:335, name:'JAVA'},
                            {value:310, name:'.NET'},
                            {value:274, name:'PHP'}
                        ].sort(function (a, b) { return a.value - b.value; }),
                        roseType: 'radius',
                        label: {
                            normal: {
                                textStyle: {
                                    color: 'rgba(255, 255, 255, 0.3)'
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                lineStyle: {
                                    color: 'rgba(255, 255, 255, 0.3)'
                                },
                                smooth: 0.2,
                                length: 10,
                                length2: 20
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#6666CC',
                                shadowBlur: 200,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        },

                        animationType: 'scale',
                        animationEasing: 'elasticOut',
                        animationDelay: function (idx) {
                            return Math.random() * 200;
                        }
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
            myChart1.setOption(option1);
		</script>
	</body>
</html>
