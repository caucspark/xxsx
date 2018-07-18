<%@page import="com.spark.service.ShowOrderService"%>
<%@page import="com.spark.bean.Order"%>
<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8" import="java.util.ArrayList" import="com.spark.bean.Order" import="com.spark.service.ShowOrderService"%>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>小象水果_全球精选_生鲜果蔬 品质食材_xiaoxiang.com</title>
		<meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,小象生鲜网">
		<meta name="Description" content="小象生鲜网是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，小象生鲜网是您悠悦生活的品质之选。">
		<link rel="shortcut icon" herf="img/logo.png" />
		<link rel="stylesheet" href="css/public.css" />
		<link rel="stylesheet" href="css/customer.css" />
		<link rel="stylesheet" href="css/index.css" />
		<link rel="stylesheet" href="css/nav.css" />
		<link rel="stylesheet" type="text/css" href="css/myorder.css" />
		<link rel="stylesheet" type="text/css" href="css/returns.css" />
		<link rel="stylesheet" type="text/css" href="css/search.css" />
		<link rel="stylesheet" type="text/css" href="css/themes.css" />
		<link rel="stylesheet" type="text/css" href="css/yg.css" />

		<!--<script type="text/javascript" src="js/jquery-1.11.2.min.js" ></script>-->
		<!--<script src="js/jquery-1.12.1.min.js" type="text/javascript" charset="utf-8"></script>-->
		<script src="http://static01.yiguo.com/www/js/jquery.js"></script>
		<script>
			yg_x = new Date();
			var yw_data = {};
		</script>
		<script type="text/javascript" src="js/js01.js"></script>
		<!-- start Dplus -->
		<script type="text/javascript" src="js/js02.js"></script>
		<!-- end Dplus -->
		<script type="text/javascript" src="js/js03.js"></script>
	</head>

	<body id="body">
		<div class="w">
			<div id="topads">
				<script id="topadstpl" type="text/x-handlebars-template">
					{{#TopAds}}
					<a href="{{Link}}">
						<img src="{{Image}}" style="width:100%;" />
					</a>
					{{/TopAds}}
				</script>
			</div>
			<!------- 顶部工具栏 ------->

			<div class="site-nav">
				<div class="wrap">
					<ul class="fl">
						<li>欢迎光临小象生鲜！</li>
						<!--送货城市 开始-->
						<li class="city clearfix">
							<div class="city-sz">配送至：</div>

							<div class="city-tit">
								<a class="city-name" href="javascript:void(0)">天津<s></s></a>
							</div>
							<div class="city-con" id="citylist">
					
							<script id="_citytpl" type="text/x-handlebars-template">

								<div class="headline">
									<a href="javascript:;" v="64" aid="00000000-0000-0000-0000-000000000000">全国其它城市&gt;&gt;</a> 请根据您的收货地址选择
								</div>
								<div class="city-hot">
									<span><i></i>热门城市</span> {{#each HotCity}}
									<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
									{{/each}}
								</div>
								<p class="citytab"><span class="active">ABCDE</span><span>FGHIJ</span><span>KLMNO</span><span class="">PQRST</span><span class="">UVWXYZ</span></p>
								<div class="citylist active">
									{{#each City1}}
									<dl>
										<dt>{{@key}}</dt>
										<dd>
											{{#each this}} {{#equal WebShow 2}}
											<a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
											{{else}}
											<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
											{{/equal}} {{/each}}
										</dd>
									</dl>
									{{/each}}
								</div>
								<div class="citylist ">
									{{#each City2}}
									<dl>
										<dt>{{@key}}</dt>
										<dd>
											{{#each this}} {{#equal WebShow 2}}
											<a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
											{{else}}
											<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
											{{/equal}} {{/each}}
										</dd>
									</dl>
									{{/each}}
								</div>
								<div class="citylist ">
									{{#each City3}}
									<dl>
										<dt>{{@key}}</dt>
										<dd>
											{{#each this}} {{#equal WebShow 2}}
											<a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
											{{else}}
											<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
											{{/equal}} {{/each}}
										</dd>
									</dl>
									{{/each}}
								</div>
								<div class="citylist ">
									{{#each City4}}
									<dl>
										<dt>{{@key}}</dt>
										<dd>
											{{#each this}} {{#equal WebShow 2}}
											<a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
											{{else}}
											<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
											{{/equal}} {{/each}}
										</dd>
									</dl>
									{{/each}}
								</div>
								<div class="citylist ">
									{{#each City5}}
									<dl>
										<dt>{{@key}}</dt>
										<dd>
											{{#each this}} {{#equal WebShow 2}}
											<a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
											{{else}}
											<a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
											{{/equal}} {{/each}}
										</dd>
									</dl>
									{{/each}}
								</div>

							</script>
							</div>
						</li>
						<!--送货城市 结束-->
					</ul>
					<ul class="fr">
						<li class="TEL">
							<a href="http://home.yiguo.com/Trade/OnlineDelivery" target="_blank"><i></i>礼品兑换券入口</a>
						</li>
						<li class="pay">
							<a href="/Recharge/Index" target="_blank"><i></i>储值卡</a>
						</li>
						<li class="mobile">
							<div class="tit">
								<a href="javascript:void(0)"><i></i>手机小象<s></s></a>
							</div>
							<div class="con">
								<div class="item"><img src="http://static01.yiguo.com/utaste/images/header/qrcode_app.jpg" width="125" height="125"><span>扫码下载移动APP</span></div>
								<div class="item"><img src="http://static01.yiguo.com/utaste/images/header/qrcode_wechat.jpg" width="125" height="125"><span>微信扫一扫</span></div>
							</div>
						</li>
						<li class="myyiguo">
							<div class="tit">
								<a href="/Trade/Index" target="_blank"><i></i>我的小象<s></s></a>
							</div>
							<div class="con">
									
								<a href="Order.do?Userid=1">我的订单</a>
								
								<a href="/Trade/MyCoupons">我的优惠券<b id="couponCount">3</b></a>
								<a href="/Trade/MyCollection">我的收藏</a>
								<a href="/Trade/UMoney">我的悠币</a>
								<a href="/Trade/BackOrder">我的退换货</a>
								<a href="/Account/Balance">预存款查询</a>
								<a href="/Trade/CommodityVote">评论商品</a>
								<a href="http://event.yiguo.com/activity/">立即充值</a>
							</div>
						</li>
						<li id="loginoutLi">
							<a href="javascript:;" class="logout">[退出]</a>
						</li>
						<li id="usernameLi">
							<a href="/Trade/Index">13302006202</a>
						</li>
					</ul>
				</div>
			</div>

			<!------- 头部 ------->
			<script src="js/fixed.js" type="text/javascript" charset="utf-8"></script>
			<div class="header clearfix">
				<div class="wrap">
					<div class="logo">
						<a href="http://www.xiaoxiang.com"><img src="img/logo.png" /></a>
					</div>
					<!--搜索 开始-->
					<div class="search" style="position:relative;">
						<div class="search-bar clearfix">
							<input type="text" id="keyword" name="keyword" class="search-input" value="输入商品名／编号／拼音" onfocus=" if (this.value == '输入商品名／编号／拼音') {this.value = '';this.style.color = '#000';} " onblur=" if (this.value == '') {this.value = '输入商品名／编号／拼音';this.style.color = '#999';} " style="color: rgb(153, 153, 153);">
							<input class="search-btn" type="submit" value="搜索">
						</div>
						<ul class="hide" id="shelper" style="display: none;"></ul>
						<div class="search-keywords" id="keywords">
							<script id="keywordstpl" type="text/x-handlebars-template">
								{{#KeyWords}} {{#equal IsImportant true}}
								<a href="{{Link}}" class="hot" target="_blank">{{Text}}</a>
								{{else}}
								<a href="{{Link}}" target="_blank">{{Text}}</a>
								{{/equal}} {{/KeyWords}}
							</script>
						</div>
					</div>
					<!--购物车 开始-->
					<div class="shopping-cart">
						<dl>
							<dt class="shopping-btn"><a href="http://cart.yiguo.com"> <span class="totleNum"><b>0</b></span><b class="totlePrice">0.0</b></a></dt>
							<dd class="shopping-list">
								<div class="spacer"></div>
								<div class="nogoods" style="display:none;">
									购物车中还没有商品，赶紧选购吧！
								</div>
								<div class="goods">
									<p id="deliveryType" style="display:none;">满100元包邮！</p>
									<ul></ul>
									<div class="price-total">
										<div><span class="totleNum">共<b>0</b>件商品</span><span>共计<b class="totlePrice">¥0.00</b></span></div>
										<div>
											<a href="http://cart.yiguo.com/ShopCart.aspx" class="settleup">去购物车</a>
										</div>
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<!--购物车 结束-->
				</div>
			</div>

			<div class="header-nav">
				<div class="wrap">
					<!--商品分类 开始-->
					<div class="catalogs">
						<div class="catalogs-title">
							<a href="javascript:;">全部商品分类▼</a>
						</div>
						<div class="catalogs-list" style="display:none">
							<div class="item">
								<h3 class="t01_channelhome">
									<a href="http://www.yiguo.com/products/01_channelhome.html"><i></i>进口水果<s>></s></a></h3>
								<div class="sub-item">
									<h4>
										<a href="http://www.yiguo.com/products/01_channelhome.html">进口水果</a>
									</h4>
									<div class="sub-list">
										<a href="http://www.yiguo.com/products/0101_qiyiguo.html" target="_blank">奇异果</a>
										<a href="http://www.yiguo.com/products/0102_chilizi.html" target="_blank">车厘子</a>
										<a href="http://www.yiguo.com/products/0104_li.html" target="_blank">李</a>
										<a href="http://www.yiguo.com/products/0107_niuyouguo.html" target="_blank">牛油果</a>
										<a href="http://www.yiguo.com/products/0108_tizi.html" target="_blank">提子</a>
										<a href="http://www.yiguo.com/products/0109_pingguo.html" target="_blank">苹果</a>
										<a href="http://www.yiguo.com/products/0110_li.html" target="_blank">梨</a>
										<a href="http://www.yiguo.com/products/0111_ganjuchengyou.html" target="_blank">柑桔橙柚</a>
										<a href="http://www.yiguo.com/products/0112_shanzhu.html" target="_blank">山竹</a>
										<a href="http://www.yiguo.com/products/0113_xiangjiao.html" target="_blank">香蕉</a>
										<a href="http://www.yiguo.com/products/0114_huolongguo.html" target="_blank">火龙果</a>
										<a href="http://www.yiguo.com/products/0115_yezi.html" target="_blank">椰子</a>
										<a href="http://www.yiguo.com/products/0116_mangguo.html" target="_blank">芒果</a>
										<a href="http://www.yiguo.com/products/0117_fengli.html" target="_blank">凤梨</a>
										<a href="http://www.yiguo.com/products/0118_liulian.html" target="_blank">榴莲</a>
										<a href="http://www.yiguo.com/products/0119_tropical.html" target="_blank">热带水果</a>
										<a href="http://www.yiguo.com/products/0120_season.html" target="_blank">时令水果</a>
										<a href="http://www.yiguo.com/products/0121_yuanxiang.html" target="_blank">原箱水果</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.yiguo.com/products/01_channelhome.html"><img src="http://img05.yiguoimg.com/e/others/150929/9570160763248445.png" alt="进口水果"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t02_channelhome"><a href="http://www.yiguo.com/products/02_channelhome.html"><i></i>国产水果<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.yiguo.com/products/02_channelhome.html">国产水果</a></h4>
									<div class="sub-list">
										<a href="http://www.yiguo.com/products/0201_pingguo.html" target="_blank">苹果</a>
										<a href="http://www.yiguo.com/products/0202_li.html" target="_blank">梨</a>
										<a href="http://www.yiguo.com/products/0203_yingtao.html" target="_blank">樱桃</a>
										<a href="http://www.yiguo.com/products/0204_ganjuchengyou.html" target="_blank">柑桔橙柚</a>
										<a href="http://www.yiguo.com/products/0206_gua.html" target="_blank">瓜</a>
										<a href="http://www.yiguo.com/products/0207_putao.html" target="_blank">葡萄</a>
										<a href="http://www.yiguo.com/products/0208_tao.html" target="_blank">桃</a>
										<a href="http://www.yiguo.com/products/0209_li.html" target="_blank">李</a>
										<a href="http://www.yiguo.com/products/0212_mangguo.html" target="_blank">芒果</a>
										<a href="http://www.yiguo.com/products/0213_fengli.html" target="_blank">凤梨</a>
										<a href="http://www.yiguo.com/products/0215_bale.html" target="_blank">芭乐</a>
										<a href="http://www.yiguo.com/products/0216_baixiangguo.html" target="_blank">百香果</a>
										<a href="http://www.yiguo.com/products/0217_tropical.html" target="_blank">热带水果</a>
										<a href="http://www.yiguo.com/products/0218_season.html" target="_blank">时令水果</a>
										<a href="http://www.yiguo.com/products/0219_yuanxiang.html" target="_blank">原箱水果</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.yiguo.com/products/02_channelhome.html"><img src="http://img05.yiguoimg.com/e/others/150929/9570160763379517.png" alt="国产水果"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t05_channelhome"><a href="http://www.yiguo.com/products/05_channelhome.html"><i></i>精选肉类<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.yiguo.com/products/05_channelhome.html">精选肉类</a></h4>
									<div class="sub-list">
										<a href="http://www.yiguo.com/products/0501_jinkouniurou.html" target="_blank">进口牛肉</a>
										<a href="http://www.yiguo.com/products/0502_guochanniurou.html" target="_blank">国产牛肉</a>
										<a href="http://www.yiguo.com/products/0503_zhurou.html" target="_blank">猪肉</a>
										<a href="http://www.yiguo.com/products/0504_yangrou.html" target="_blank">羊肉</a>
										<a href="http://www.yiguo.com/products/0505_xiangchang.html" target="_blank">香肠</a>
										<a href="http://www.yiguo.com/products/0506_huotui.html" target="_blank">火腿/培根</a>
										<a href="http://www.yiguo.com/products/0507_rouzhipin.html" target="_blank">肉制品</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.yiguo.com/products/05_channelhome.html"><img src="http://img05.yiguoimg.com/e/others/150929/9570160763445053.png" alt="精选肉类"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t06_channelhome"><a href="http://www.yiguo.com/products/06_channelhome.html"><i></i>禽类蛋品<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.yiguo.com/products/06_channelhome.html">禽类蛋品</a></h4>
									<div class="sub-list">
										<a href="http://www.yiguo.com/products/0601_ji.html" target="_blank">鸡</a>
										<a href="http://www.yiguo.com/products/0602_ya.html" target="_blank">鸭</a>
										<a href="http://www.yiguo.com/products/0603_egeteseqinlei.html" target="_blank">鹅/鸽/特色禽类</a>
										<a href="http://www.yiguo.com/products/0604_dan.html" target="_blank">蛋</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.yiguo.com/products/06_channelhome.html"><img src="http://img05.yiguoimg.com/e/others/150929/9570160763510589.png" alt="禽类蛋品"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t04_channelhome"><a href="http://www.yiguo.com/products/04_channelhome.html"><i></i>海鲜水产<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.yiguo.com/products/04_channelhome.html">海鲜水产</a></h4>
									<div class="sub-list">
										<a href="http://www.yiguo.com/products/0401_yu.html" target="_blank">鱼</a>
										<a href="http://www.yiguo.com/products/0402_sanwenyu.html" target="_blank">三文鱼</a>
										<a href="http://www.yiguo.com/products/0403_xia.html" target="_blank">虾</a>
										<a href="http://www.yiguo.com/products/0404_xie.html" target="_blank">蟹</a>
										<a href="http://www.yiguo.com/products/0405_beilei.html" target="_blank">贝</a>
										<a href="http://www.yiguo.com/products/0406_huoxian.html" target="_blank">活鲜</a>
										<a href="http://www.yiguo.com/products/0407_haichanganhuo.html" target="_blank">海产干货</a>
										<a href="http://www.yiguo.com/products/0408_tesehaichan.html" target="_blank">特色海产</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.yiguo.com/products/04_channelhome.html"><img src="http://img05.yiguoimg.com/e/others/150929/9570160763576125.png" alt="海鲜水产"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t08_channelhome"><a href="http://www.yiguo.com/products/08_channelhome.html"><i></i>乳品糕点<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.yiguo.com/products/08_channelhome.html">乳品糕点</a></h4>
									<div class="sub-list">
										<a href="http://www.yiguo.com/products/0801_nailao.html" target="_blank">奶酪</a>
										<a href="http://www.yiguo.com/products/0802_huangyounaiyou.html" target="_blank">黄油/奶油</a>
										<a href="http://www.yiguo.com/products/0803_rusuanyinliao.html" target="_blank">酸奶/乳酸饮料</a>
										<a href="http://www.yiguo.com/products/0805_mianbao.html" target="_blank">面包</a>
										<a href="http://www.yiguo.com/products/0806_dangao.html" target="_blank">蛋糕</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.yiguo.com/products/08_channelhome.html"><img src="http://img05.yiguoimg.com/e/others/150929/9570160763641661.png" alt="乳品糕点"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t03_channelhome"><a href="http://www.yiguo.com/products/03_channelhome.html"><i></i>新鲜蔬菜<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.yiguo.com/products/03_channelhome.html">新鲜蔬菜</a></h4>
									<div class="sub-list">
										<a href="http://www.yiguo.com/products/0301_yecailei.html" target="_blank">叶菜类</a>
										<a href="http://www.yiguo.com/products/0302_genjinglei.html" target="_blank">根茎类</a>
										<a href="http://www.yiguo.com/products/0303_qieguoguaguolei.html" target="_blank">茄果/瓜果类</a>
										<a href="http://www.yiguo.com/products/0304_huacaidoulei.html" target="_blank">花菜/豆类</a>
										<a href="http://www.yiguo.com/products/0306_jungu.html" target="_blank">菌菇</a>
										<a href="http://www.yiguo.com/products/0307_shalacai.html" target="_blank">沙拉菜</a>
										<a href="http://www.yiguo.com/products/0308_lengdongshucai.html" target="_blank">冷冻蔬菜</a>
										<a href="http://www.yiguo.com/products/0309_douzhipin.html" target="_blank">豆制品</a>
										<a href="http://www.yiguo.com/products/0310_congsuanlei.html" target="_blank">葱蒜类</a>
										<a href="http://www.yiguo.com/products/0311_shucaizuhe.html" target="_blank">蔬菜组合</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.yiguo.com/products/03_channelhome.html"><img src="http://img05.yiguoimg.com/e/others/150929/9570160763772733.png" alt="新鲜蔬菜"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t10_channelhome"><a href="http://www.yiguo.com/products/10_channelhome.html"><i></i>方便速食<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.yiguo.com/products/10_channelhome.html">方便速食</a></h4>
									<div class="sub-list">
										<a href="http://www.yiguo.com/products/1001_lengdongdianxin.html" target="_blank">冷冻点心</a>
										<a href="http://www.yiguo.com/products/1003_zhongshizhushi.html" target="_blank">中式主食</a>
										<a href="http://www.yiguo.com/products/1004_huoguoliao.html" target="_blank">火锅料</a>
										<a href="http://www.yiguo.com/products/1005_lengcangshushi.html" target="_blank">冷藏熟食</a>
										<a href="http://www.yiguo.com/products/1006_banchengpincai.html" target="_blank">半成品菜</a>
										<a href="http://www.yiguo.com/products/1007_yihejiayan.html" target="_blank">易盒家宴</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.yiguo.com/products/10_channelhome.html"><img src="http://img05.yiguoimg.com/e/others/150929/9570160763838269.png" alt="方便速食"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t07_channelhome"><a href="http://www.yiguo.com/products/07_channelhome.html"><i></i>粮油杂货<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.yiguo.com/products/07_channelhome.html">粮油杂货</a></h4>
									<div class="sub-list">
										<a href="http://www.yiguo.com/products/0701_mi.html" target="_blank">米</a>
										<a href="http://www.yiguo.com/products/0702_zaliang.html" target="_blank">杂粮</a>
										<a href="http://www.yiguo.com/products/0703_mianmianzhipin.html" target="_blank">面/面制品</a>
										<a href="http://www.yiguo.com/products/0704_you.html" target="_blank">油</a>
										<a href="http://www.yiguo.com/products/0705_tiaoweiliao.html" target="_blank">调味料</a>
										<a href="http://www.yiguo.com/products/0706_ganhuo.html" target="_blank">干货</a>
										<a href="http://www.yiguo.com/products/0707_guoganlingshi.html" target="_blank">果干/零食</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.yiguo.com/products/07_channelhome.html"><img src="http://img05.yiguoimg.com/e/others/150929/9570160757940029.png" alt="粮油杂货"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<h3 class="t09_channelhome"><a href="http://www.yiguo.com/products/09_channelhome.html"><i></i>饮料酒水<s>></s></a></h3>
								<div class="sub-item">
									<h4><a href="http://www.yiguo.com/products/09_channelhome.html">饮料酒水</a></h4>
									<div class="sub-list">
										<a href="http://www.yiguo.com/products/0901_shui.html" target="_blank">水</a>
										<a href="http://www.yiguo.com/products/0902_guozhiyinliao.html" target="_blank">果汁/饮料</a>
										<a href="http://www.yiguo.com/products/0903_chongtiaoyinpin.html" target="_blank">冲调饮品</a>
										<a href="http://www.yiguo.com/products/0904_jiujiuju.html" target="_blank">葡萄酒/酒具</a>
									</div>
									<div class="catalogs-ad">
										<a href="http://www.yiguo.com/products/09_channelhome.html"><img src="http://img05.yiguoimg.com/e/others/150929/9570160763182909.png" alt="饮料酒水"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--商品分类 结束-->
					<div class="nav-items">
						<ul id="homenav">
							<li>
								<a href="新品专区的链接" target="_blank">新品专区</a>
							</li>
							<li>
								<a href="优质生活的链接" target="_blank">优质生活</a>
							</li>
							<li>
								<a href="银行专区的链接" target="_blank">银行专区</a>
							</li>
							<li>
								<a href="菜谱专栏的链接" target="_blank">菜谱专栏</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			
			
			
			
			
			
			
			
			
			<div class="wrap">
				<!--面包屑-->
				<div class="crumbs">
					<a class="ml0" href="http://www.yiguo.com">首页</a>&gt;
					<a href="/Trade/Index" class="j_ygnav">我的小象</a>
					<span class="j_thridcrumbs hide">&gt;
						<a href="javascript:void(0)" class="on j_thirdnav">我的订单</a>
					</span>
				</div>
				<div class="content myyg">
					<div class="sub">
						<div class="menu j_menu">
							<dl>
								<dt>交易信息</dt>
								<dd>
									<ul>
										<li>
											<a href="/Trade/OrderList">我的订单</a>
										</li>
										<li>
											<a href="/Trade/MyCoupons">我的优惠券</a><span class="num">3</span></li>
										<li>
											<a href="/Trade/UMoney">我的悠币</a>
										</li>

										<li>
											<a href="/Trade/UseGiftCard">我的礼品卡</a>
										</li>
										<li>
											<a href="/Trade/OnlineDelivery">我的礼品兑换券</a>
										</li>
										<li>
											<a href="/Trade/MyBuy">购买过的商品</a>
										</li>
										<li>
											<a href="/Trade/MyCollection">我的收藏</a>
										</li>
										<li>
											<a href="/Trade/CommodityVote">评论商品</a>
										</li>
									</ul>
								</dd>
								<dt>账号信息</dt>
								<dd>
									<ul>
										<li>
											<a href="/Account/Balance">账户余额</a>
										</li>
										<li>
											<a href="/Account/PersonalProfile">个人资料</a>
											<img style="height: 19px; width: 20px; margin-left: 10px;" src="http://static01.yiguo.com/utaste/images/icon-gift.png" />
										</li>
										<li>
											<a href="/Account/AccountSecurity">账号安全</a>
										</li>
										<li>
											<a href="/Account/Consignee">收货地址管理</a>
										</li>
										<li>
											<a href="/B2BWelfare/CorporationAccount">企业福利入口</a>
										</li>

									</ul>
								</dd>
								<dt>售后服务</dt>
								<dd>
									<ul>
										<li>
											<a href="/Trade/BackOrder">在线退换货</a>
										</li>
										<li>
											<a href="/Trade/Advice">投诉建议</a>
										</li>
									</ul>
								</dd>
							</dl>
						</div>
						<div>
							<div class="ad" style="height: 308px;">
								<a href="###" target="_blank" style="display: none">
									<img src="http://static01.yiguo.com/utaste/images/ad.jpg" width="194" height="308">
								</a>
							</div>
						</div>
					</div>
					

					<div class="main myorder" style="width: 930px">
						<div class="title">
							
							我的订单
							

						</div>
						<div class="order-table j_Loading" id="allorderlst">
							<div class="order-list-head clearfix">
								<span class="w520">订单信息</span>
								<span class="w140">实付金额</span>
								<span class="w140">订单状态</span>
								<span class="w140">操作</span>

							</div>
							
							
							
							  
						<div class="order-list-body">
							
							<% ArrayList<Order> orderList = (ArrayList<Order>)request.getAttribute("orderLists");%>
                                <%
                                ShowOrderService showOrderService = new ShowOrderService();
	                                for(int i=0;i<orderList.size();i++){%>
	                                	
	                                	<ul class="j_allorderli">
										<li>
											<table class="order-list j_product">
												<thead>
													<tr>
														<th colspan="4">
															<div>
																<span>订单号：<%=orderList.get(i).getOrderId()%></span>
																<span>提交时间：<%=orderList.get(i).getOrderSetTime()%></span>
															</div>
														</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td width="520" class="all-goods">
															<a href="" target="_blank">
																<img class="j_product_img" src="http://img12.yiguoimg.com/d/items/2018/180509/9288722749858985_300.jpg">
															</a>
															<a href="" target="_blank">
																<img class="j_product_img" src="http://img12.yiguoimg.com/d/items/2018/180509/9288722749858985_300.jpg">
															</a>
															<div class="m">
																<div>共计<%=showOrderService.getNumByOrderid(orderList.get(i).getOrderId()) %>件商品</div>
															</div>
														</td>
														<td class="amount" width="140"><%=showOrderService.getPriceByOrderid(orderList.get(i).getOrderId()) %></td>
														<td width="140"><%=showOrderService.getOrderstateByOrderid(orderList.get(i).getOrderId()) %></td>
														<td width="140" class="operate">

														</td>
													</tr>
												</tbody>
											</table>
										</li>
									</ul>
                                	
                                <% } %>
							
						</div>
							
							

					<!--选择取消原因弹框-->
					<div class="popup popup1" style="display:none;">
						<div class="popup-wrap popup-middle">
							<div class="popup-con">
								<div class="title">取消订单申请
									<a href="#" class="close">×</a>
								</div>
								<div class="con">
									<div class="reason">
										<span>取消原因</span>

										<select name="refundreason" id="refundreason">
											<option value="订单信息错误">订单信息错误</option>
											<option value="我不想买了">我不想买了</option>
											<option value="忘记使用U币/优惠券">忘记使用U币/优惠券</option>
											<option value="订单中有商品买错">订单中有商品买错</option>
										</select>
										<p class="text"><i class="hint"></i>订单被成功取消后不可恢复，同时该笔订单所使用的优惠券可能将一并取消。</p>
									</div>
									<div class="btnbox">
										<a class="confirm" id="step1" href="javascript:void(0);">下一步</a>
										<a class="cancel close" href="javascript:void(0);">暂不取消</a>
									</div>
								</div>
							</div>
						</div>
						<div class="popup-bg">&nbsp;</div>
					</div>

					<!--网银支付宝支付,部分预付款-->
					<div class="popup popup3" style="display:none;">
						<div class="popup-wrap popup-middle">
							<div class="popup-con">
								<div class="title">取消订单申请
									<a href="#" class="close">×</a>
								</div>
								<div class="con">
									<div class="refundbeforeinfo"></div>
									<div class="btnbox">
										<a class="confirm" id="step2" href="javascript:void(0);">提交申请</a>
										<a class="cancel close" href="javascript:void(0);">暂不取消</a>
									</div>
									<div class="explain">
										<h3>极速退款说明：</h3>
										<p>
											1. 极速退款仅限网银、支付宝在线方式支付，即时退款至预付款余额，目前暂不支持其他支付方式；<br> 2. 极速退款已退至账户余额后的金额，目前暂不支持退款；<br> 3. 账户内金额不可用于购买储值卡、提货券等虚拟卡券类商品；<br> 4. 如需开具发票，请完善发票开具信息；开票金额为您实际支付充值金额，不包含赠送金额；<br> 5. 预付款余额有效期：自充值日起至用完即止；<br> 6. 若有其他疑问，可拨打客服电话400-000-7788进行咨询。
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="popup-bg">&nbsp;</div>
					</div>

					<!--等待审核-->
					<div class="popup popup4" style="display:none;">
						<div class="popup-wrap popup-middle">
							<div class="popup-con">
								<div class="title">取消订单申请
									<a href="#" class="close">×</a>
								</div>
								<div class="con">
									<div class="refundstateinfo"></div>
									<table>

									</table>
									<div class="btnbox">
										<a class="confirm close" href="javascript:void(0);">好，我知道了</a>
										<a href="http://www.yiguo.com/help/quicknessrefund.html" class="know">了解极速退款</a>
									</div>
								</div>
							</div>
						</div>
						<div class="popup-bg">&nbsp;</div>
					</div>

					<script id="OrderRefundBefore" type="text/x-handlebars-template">
						<p class="txt1">您当前的订单已支付总额：<span class="price">{{totalAmunt}}</span>元</p>
						<p class="txt2">合计退款总额：<span>{{totalAmunt}}</span>元</p>
						{{#if isHasBalanceRefund}}
						<p class="txt3">预付款余额：<span>{{balanceRefundAmunt}}</span>元</p>
						<p class="txt5">退款方式：原支付方式退回，审核通过后即时到账！</p>
						{{/if}} {{#if isOnlineRefund}}
						<p class="txt3">{{onlinePayName}}：<span>{{onlineRefundAmunt}}</span>元</p>
						<p class="txt4" onclick="$(this).find('i').addClass('active'); $(this).siblings('.txt4').find('i').removeClass('active');"><i class="active" title="0"></i>原支付方式退回，审核成功后约1-15个工作日到账！</p>
						{{#compare totalAmunt '<=' 3000}}
    <p class="txt4" onclick="$(this).find(' i ').addClass('active ');$(this).siblings('.txt4 ').find('i ').removeClass('active ');"><i title="1"></i>极速退款至预付款余额，即时到帐！ <span class="rec">[推荐]</span></p>
    {{/compare}}
    {{/if}}

</script>

<script id="OrderRefundState_Info" type="text/x-handlebars-template">
    {{#equal State 1}}
    <p class="txt1">您的取消订单申请已提交，预计2个工作日内完成审核，请耐心等待！</p>
    {{/equal}}
    {{#equal State 2}}
    <p class="txt"><i></i>您的退款申请已审核通过！</p>
    <p class="txt1">网银/支付宝退款预计1~15个工作日到账，具体以支付渠道的退款到账为准！</p>
    {{/equal}}
    {{#if isOnlineRefund}}
    <div class="information clearfix">
        <p class="infor1">退款编号：<span class="num">{{RefundOrderNumber}}</span></p>
        <p class="infor2">订单编号：<span class="num">{{SerialNumber}}</span></p>
    </div>
    <div class="information clearfix">
        <p class="infor1">申请时间：<span class="num">{{ApplyDate}}</span></p>
        <p class="infor2">退款原因：<span class="num">{{RefundReasons}}</span></p>
    </div>
    {{else}}
    <div class="information clearfix">
        <p class="infor1">订单编号：<span class="num">{{SerialNumber}}</span></p>
    </div>
    <div class="information clearfix">
        <p class="infor1">申请时间：<span class="num">{{ApplyDate}}</span></p>
    </div>
    {{/if}}
</script>

<script id="RefundAmunt_Info" type="text/x-handlebars-template">
    <tr>
        <th>支付方式</th>
        <th>退款方式</th>
        <th>退款金额</th>
        <th>合计退款金额</th>
    </tr>
    {{#if isHasBalanceRefund}}
    <tr>
        <td>账户余额</td>
        <td>原支付方式退回</td>
        <td><span>￥{{balanceRefundAmunt}}</span></td>
        <td rowspan="2"><span>￥{{TotalAmunt}}</span></td>
    </tr>
    {{/if}}
    {{#if isOnlineRefund}}
    <tr>
        <td>{{onlinePayName}}</td>
        <td>{{RefundTypeName}}</td>
        <td>
            <span>￥{{onlineRefundAmunt}}</span>
        </td>
        {{#unless isHasBalanceRefund}}
        <td rowspan="2"><span>￥{{TotalAmunt}}</span></td>
        {{/unless}}
    </tr>
    {{/if}}
</script>
           </div>
       </div>
        <!------- 页尾 ------->
        <style>
    i {
        background-image: none;
    }
</style>
<div class="footer">
    <div class="wrap">
        <dl class="col1">
            <dt>新手指南</dt>
            <dd>
                <p><a href="/help/registersteps.html">账户注册</a></p>
                <p><a href="/help/gouwuliucheng.html">购物流程</a></p>
                <p><a href="/help/ordering.html">订购方式</a></p>
                <p><a href="/help/ubremark.html">悠币说明</a></p>
                            <p><a href="http://www.yiguo.com/activity/sale/2998">会员等级<i class="ml5"><img src="http://img06.yiguoimg.com/e/web/170315/00941/154425/icon-new.png"></i></a></p>

            </dd>
        </dl>
        <dl class="col2">
            <dt>付款方式</dt>
            <dd>
                <p><a href="/help/payment.html">支付方式</a>/<a href="/help/invoiceremark.html">发票说明</a></p>
                <p><a href="/help/chongzhiliucheng.html">充值说明</a><a href="/help/usechuzhika.html">/储值卡说明</a></p>
                <p><a href="/help/usegiftcard.html">优惠代码/礼品卡说明</a></p>
                <p><a href="/help/cardbuynotes.html">卡券购买章程</a></p>
            </dd>
        </dl>
        <dl class="col3">
            <dt>配送方式</dt>
            <dd>
                <p><a href="/help/sendyuefei.html">配送运费</a></p>
                <p><a href="/help/sendquyu.html">配送范围</a></p>
                <p><a href="/help/sendtime.html">配送时间</a></p>
            </dd>
        </dl>
        <dl class="col4">
            <dt>售后服务</dt>
            <dd>
                <p><a href="/help/tuihuanhuoshuoming.html">退换货政策</a></p>
                <p><a href="/help/huanhuolc.html">退换货流程</a></p>
                <p><a href="/help/qa.html">常见问题</a></p>
                <p><a href="/help/quicknessrefund.html">极速退款</a><p>
                <p><a href="http://home.yiguo.com/Trade/Advice">投诉与建议</a></p>
            </dd>
        </dl>
        <dl class="col5">
            <dt>关于我们</dt>
            <dd>
                <p><a href="/help/introduction.html">公司介绍</a></p>
                <p><a href="/help/contact.html">联系我们</a></p>
                <p><a href="/help/procooperation.html">业务合作</a></p>
                <p><a href="/help/chengxinjubao.html">诚信举报</a></p>
                <p><a href="http://yiguo.zhiye.com/home" target="_blank" rel="nofollow">人才招聘</a></p>
                <p><a href="/help/friendurl.html">友情链接</a></p>
                
            </dd>
        </dl>
        <div class="service"><span>客服热线 400-888-8888 企业采购或团购，请转2号键咨询</span><span>周一至周日 9:00-21:00</span></div>
        <div class="copyright">
            <p> <a href="http://www.miibeian.gov.cn/state/outPortal/loginPortal.action" target="_blank" rel="nofollow">津ICP备098491015号 </a>  Copyright © 2017-2018 <a href="http://www.xiaoxiang.com/">天津Spark商务有限公司</a>版权所有</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/js04.js"></script>

        <!------- 侧边悬浮 ------->
        <div class="sidebar" id="sidebar">
            <a href="javascript:void(0);" class="s-btn service"></a>
            <a href="#body" class="s-btn goTop"></a>
        </div>
    </div>

    <script src="js/js05.js"></script>
    <script src="js/js06.js"></script>
    <script src="js/utaste.js"></script>
    <script src="js/base.js"></script>
    <script src="js/jquery.superslide.js"></script>
    <script src="js/sidebar.js"></script>
    <script src="js/floor-guide.js"></script>
    <script src="js/global-v2.js"></script>
    <script src="js/search.js"></script>
    <script src="js/city.js"></script>
    <script src="js/app.js"></script>
    <script src="js/common.js"></script>
    <script src="js/util.js"></script>
  
    <!-- 自动适配移动端与pc端 -->
    <script src="js/kit.js" charset="utf-8"></script>    
    <script src="js/chat.js"></script>
    <script>
        $(function () {
            app.init();
            YgmDplus.init("www.xiaoxiang.com", "", "");           
        })
    </script>
    <script src="js/shouyejiaodian.js"></script>
    <script type="text/javascript" src="js/kefu.js"></script>
    <script src="js/stats.js"></script>


</body>
</html>