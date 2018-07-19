<%@page import="java.util.Calendar"%>
<%@page import="com.spark.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>小象水果_全球精选_生鲜果蔬 品质食材_xiaoxiang.com</title>
    <meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,小象生鲜网">
    <meta name="Description" content="小象生鲜网是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，小象生鲜网是您悠悦生活的品质之选。">
    <link rel="shortcut icon" herf="img/logo.jpg" />
    <link rel="stylesheet" href="css/public.css" />
    <!--<link rel="stylesheet" href="css/customer.css" />-->
     <link rel="stylesheet" href="css/index.css" />
      <link rel="stylesheet" href="css/nav.css" />
      <link rel="stylesheet" type="text/css" href="css/product_detail.css"/>
      <link rel="stylesheet" type="text/css" href="css/yiguo.css"/>
      <link rel="stylesheet" type="text/css" href="css/Comment.css"/>
      <link rel="stylesheet" type="text/css" href="css/CommenDIVx.css"/>
    <script src="http://static01.yiguo.com/www/js/jquery.js"></script>
    <script>
        yg_x = new Date();
        var yw_data = {};
    </script>
    <script type="text/javascript" src="js/js01.js" ></script>
    <!-- start Dplus -->
    <script type="text/javascript" src="js/js02.js"></script>
    <!-- end Dplus -->
    <script type="text/javascript" src="js/js03.js"></script>
    <!--<script type="text/javascript">
    	function deleteone(){
    		alert('ok');
    	}
    </script>-->
    <script type="text/javascript" src="js/Picture.js"></script>
     <script src="js/mycommon.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
    
	function getcart() {//向购物车添加数据
		var NumInput=document.getElementById("p_number");
		var ProId=document.getElementById("Amount");
    	var resultNum=NumInput.value;
    	var resultId=ProId.innerHTML;
		$.ajax({
			type : "post",
			url : "getInfo.do?action=submitCart",
			data:{"ProductNum":resultNum,"ProductId":resultId},
			success : function(data) {//{"age":0,"id":0,"password":"12345","userName":"王五"}
				alert('我在购物车等你哦！');
			}
		});
	}
	function getCommentvalue(){//获取评论
		var ProId=document.getElementById("Amount");
		var resultId=ProId.innerHTML;
		$.ajax({
			type : "post",
			url : "getComment.do?action=ALLITEMS",
			data:{"ProductId":resultId},
			success : function(data) {//{"age":0,"id":0,"password":"12345","userName":"王五"}
				adddiv(data);
			}
		});
	}
	function adddiv(data){
		var maindiv=document.getElementById("maindiv");
		maindiv.innerHTML="";
		for(var a=0;a<data.length;a++){	
		var div1=document.createElement("div");
		var table1=document.createElement("table");
		var tr1=document.createElement("tr");
		var tr2=document.createElement("tr");
		var td1=document.createElement("td");
		var img1=document.createElement("img");
		var td2=document.createElement("td");
		var td3=document.createElement("td");
		var td4=document.createElement("td");
		div1.className="Creatediv";
		table1.className="Creattable";
		img1.className="CreateImg";
		div1.appendChild(table1);
		table1.appendChild(tr1);
		tr1.appendChild(td1);
		img1.src="images/19dcf711ac26e2dbc91ef50ece180dd6.jpg";//用户头像
		td1.appendChild(img1);
		td2.innerText=data[a].commentdetail;
		td2.rowSpan="2";
		td2.className="td2";
		tr1.appendChild(td2);
		td4.innerText=data[a].point;
		td4.rowSpan="2";
		td4.className="tdx";
		tr1.appendChild(td4);
		table1.appendChild(tr2);
		tr2.appendChild(td3);
		td3.className="td3";
		td3.innerText="小象用户:"+data[a].userId;
		document.getElementById("maindiv").appendChild(div1);
		}
		var div2=document.createElement("div");
		var btnPer=document.createElement("input");
		var btnNex=document.createElement("input");
		btnNex.setAttribute('type', 'button');
		btnPer.setAttribute('type', 'button');
		btnNex.className="btn";
		btnPer.className="btn";
		btnPer.value="上一页";
		btnNex.value="下一页";
		div2.appendChild(btnNex);
		div2.appendChild(btnPer);
		document.getElementById("maindiv").appendChild(div2);
		btnPer.onclick=function(){getCommentPerPage();};
		btnNex.onclick=function(){getCommentNextPage();};
	}
	function getCommentNextPage(){//获取下一页评论
		var ProId=document.getElementById("Amount");
		var resultId=ProId.innerHTML;
		$.ajax({
			type : "post",
			url : "getComment.do?action=next",
			data:{"ProductId":resultId},
			success : function(data) {//{"age":0,"id":0,"password":"12345","userName":"王五"}
			//获取评论的结果list
				//alert(data);
				if(data[0].commentdetail=="#END#"){
					alert("已到尾页");
				}else{
					adddiv(data);
				}
			}
		});
	}
	function getCommentPerPage(){//获取上一页评论
		var ProId=document.getElementById("Amount");
		var resultId=ProId.innerHTML;
		$.ajax({
			type : "post",
			url : "getComment.do?action=per",
			data:{"ProductId":resultId},
			success : function(data) {//{"age":0,"id":0,"password":"12345","userName":"王五"}
			//获取评论的结果list
				//alert(data);
				if(data[0].commentdetail=="#START#"){
					alert("已到首页");
				}else{
					adddiv(data);
				}
			}
		});
	}
</script>
</head>
<body id="body">
<%Product product=(Product)request.getAttribute("product"); %>
<%
	Calendar c=Calendar.getInstance();
	String time=c.get(Calendar.HOUR_OF_DAY)+4+":"+"00";
	String date=""+c.get(Calendar.MONTH)+(c.get(Calendar.DATE)+1);
%>
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
                        <div class="city-con" id="citylist" >

    	<div class="headline">
        <a href="javascript:;" v="64" aid="00000000-0000-0000-0000-000000000000">全国其它城市&gt;&gt;</a> 请根据您的收货地址选择
    </div>
    <div class="city-hot">
        <span><i></i>热门城市</span>
        <a href="javascript:;" v="1" aid="312d0556-0671-4f2e-8bac-7b8873b5a03a" _type="1">上海</a>
        <a href="javascript:;" v="2" aid="eabbe02f-59e0-46e6-90e7-cd8a89dbb98f" _type="1">北京</a>
        <a href="javascript:;" v="8" aid="93570b8c-0a0a-4818-8317-75a0d14093a5" _type="1">天津</a>
        <a href="javascript:;" v="128" aid="9069d884-96c5-4478-bb49-d6ba55b751c8" _type="1">南京市</a>
        <a href="javascript:;" v="128" aid="dec5b754-fe58-48d6-8b37-6bc91ee08460" _type="1">苏州市</a>
        <a href="javascript:;" v="128" aid="0dbb02ef-c055-429f-97b6-5dc7a5bfeda8" _type="1">昆山市</a>
        <a href="javascript:;" v="128" aid="361bc174-b1e5-4fb6-8f69-c391dcd92644" _type="1">无锡市</a>
        <a href="javascript:;" v="131072" aid="a10524be-acea-451e-9280-df0514e11e2b" _type="1">杭州市</a>
        <a href="javascript:;" v="131072" aid="c0a5de4e-9087-4678-9056-f589ad833656" _type="1">宁波市</a>
    </div>
    <p class="citytab"><span class="">ABCDE</span><span class="active">FGHIJ</span><span class="">KLMNO</span><span class="">PQRST</span><span class="">UVWXYZ</span></p>
    <div class="citylist">
        <dl>
            <dt>A</dt>
            <dd>
                <a href="javascript:;" v="4" aid="78d6e5b9-669d-481f-b395-cea5e1e6e5a0" _type="0">安庆市</a>
            </dd>
        </dl>
        <dl>
            <dt>B</dt>
            <dd>
                <a href="javascript:;" v="8192" aid="daf7b0e2-35ea-4183-93e2-03dd4e7211d0" _type="0">滨州市</a>
                <a href="javascript:;" v="4" aid="ebff50b7-ee3e-4f46-80c2-a8c24feb4597" _type="0">蚌埠市</a>
                <a href="javascript:;" v="32" aid="0303efe5-5a98-4b7a-b53d-c560ed809242" _type="0">保定市</a>
                <a href="javascript:;" class="hot" v="2" aid="eabbe02f-59e0-46e6-90e7-cd8a89dbb98f" _type="1"><strong>北京</strong></a>
                <a href="javascript:;" v="256" aid="15b6c4e6-69f2-4001-a631-62c0c36102b1" _type="0">北京(郊区)</a>
            </dd>
        </dl>
        <dl>
            <dt>C</dt>
            <dd>
                <a href="javascript:;" v="128" aid="160d9022-1105-48a0-b18f-3672be29c56b" _type="0">崇明县</a>
                <a href="javascript:;" v="262144" aid="8a72d144-cc9b-42b4-884e-393854bb15ee" _type="0">慈溪市</a>
                <a href="javascript:;" v="4" aid="1a6c7c1e-b4fa-4332-b36c-55039d1aec59" _type="0">滁州市</a>
                <a href="javascript:;" v="4096" aid="708f0b6e-91f2-4731-8576-07c78ea08351" _type="0">成都市</a>
                <a href="javascript:;" v="32" aid="2ef144a9-0455-4698-8503-0956ccaf16b6" _type="0">承德市</a>
                <a href="javascript:;" v="32" aid="25123e41-42e0-40e5-b2bd-76ba94daa655" _type="0">长春市</a>
                <a href="javascript:;" v="4" aid="05037210-573c-436b-b24a-9d345dca54f7" _type="0">常熟市</a>
                <a href="javascript:;" v="4" aid="a338e3c1-e7e7-4482-b248-c5875b22a27b" _type="0">常州市</a>
                <a href="javascript:;" v="4" aid="2d5dfeae-414e-450b-a581-c770b49edf2d" _type="0">池州市</a>
                <a href="javascript:;" v="16" aid="e450593b-b52f-4233-b106-cb518acb3896" _type="0">长沙市</a>
                <a href="javascript:;" v="4" aid="95af2ce4-ad65-45e6-955d-cec4b59a444f" _type="0">巢湖市</a>
                <a href="javascript:;" v="32" aid="ee36933d-939f-4f6b-8a2b-d060ee9ca495" _type="0">沧州市</a>
                <a href="javascript:;" v="16" aid="7c046210-81f3-4638-a09b-6b2e8ecbe957" _type="0">重庆</a>
            </dd>
        </dl>
        <dl>
            <dt>D</dt>
            <dd>
                <a href="javascript:;" class="hot" v="512" aid="20c2f64b-c91f-4095-8fb4-3f1fbbb55f82" _type="0"><strong>东莞市</strong></a>
                <a href="javascript:;" v="32" aid="3220a369-6a2d-4415-a46a-75a699214736" _type="0">大连市</a>
                <a href="javascript:;" v="8192" aid="dd7cbdb8-6463-436f-ba09-93c69150f137" _type="0">东营市</a>
                <a href="javascript:;" v="8192" aid="8f1e3541-74b4-4993-b242-a2bf9bf15d0d" _type="0">德州市</a>
                <a href="javascript:;" v="4" aid="d1f7476c-1fd4-4da3-b701-d25e3896b856" _type="0">丹阳市</a>
            </dd>
        </dl>
    </div>
    <div class="citylist active">
        <dl>
            <dt>F</dt>
            <dd>
                <a href="javascript:;" class="hot" v="512" aid="6a637459-eca9-46b8-964d-35c11cad039a" _type="0"><strong>佛山市</strong></a>
                <a href="javascript:;" v="16" aid="46e851bf-6fb4-4250-8c90-4f7774a176f1" _type="0">福州市</a>
                <a href="javascript:;" v="4" aid="551d2096-0975-4879-ac83-c259fe433ee6" _type="0">阜阳市</a>
                <a href="javascript:;" v="262144" aid="c7f7d216-b6aa-4287-84ec-8d8cd0dbec04" _type="0">奉化市</a>
            </dd>
        </dl>
        <dl>
            <dt>G</dt>
            <dd>
                <a href="javascript:;" class="hot" v="512" aid="c8dbd17f-a8e0-43b1-b9ce-de1efdc2670e" _type="0"><strong>广州市</strong></a>
            </dd>
        </dl>
        <dl>
            <dt>H</dt>
            <dd>
                <a href="javascript:;" v="32" aid="19e03b4e-1db2-490b-a472-1ac001ae4441" _type="0">衡水市</a>
                <a href="javascript:;" v="4" aid="f308c9cc-d146-490b-944d-1d7f47751bee" _type="0">淮南市</a>
                <a href="javascript:;" v="8192" aid="4e09d210-7744-44fe-a45f-1e166aa92c2c" _type="0">菏泽市</a>
                <a href="javascript:;" v="4" aid="73a979d5-a390-4494-9139-1edbadbf8d4a" _type="0">淮北市</a>
                <a href="javascript:;" v="32" aid="49a11ac5-c9fd-47c6-9aa5-4f85956a8385" _type="0">邯郸市</a>
                <a href="javascript:;" v="262144" aid="7254d134-678b-4976-86f0-520fab6bcc46" _type="0">海宁市</a>
                <a href="javascript:;" v="4" aid="f2b41b20-c240-4e27-a7b4-5828f8fca3e9" _type="0">合肥市</a>
                <a href="javascript:;" v="4" aid="d87ee6a2-e770-4dca-bf5c-bf4f00add383" _type="0">黄山市</a>
                <a href="javascript:;" v="32" aid="18cd4b6e-a0c3-4190-9988-c724c1da8bf5" _type="0">哈尔滨市</a>
                <a href="javascript:;" v="262144" aid="9fb6eac6-ea03-409b-89d9-e13c27e01576" _type="0">湖州市</a>
                <a href="javascript:;" v="4" aid="3c2af8a1-c3eb-418b-97ee-e5f92c44f8ad" _type="0">淮安市</a>
                <a href="javascript:;" class="hot" v="131072" aid="a10524be-acea-451e-9280-df0514e11e2b" _type="1"><strong>杭州市</strong></a>
            </dd>
        </dl>
        <dl>
            <dt>J</dt>
            <dd>
                <a href="javascript:;" v="8192" aid="97fe0ada-54d3-4b5f-9096-19ad57929d07" _type="0">济南市</a>
                <a href="javascript:;" v="4" aid="89b83e66-8845-4f71-83a2-272ac0a0f7d9" _type="0">句容市</a>
                <a href="javascript:;" v="64" aid="2f58ebeb-e46d-467c-941c-3ced514bd50b" _type="0">揭阳市</a>
                <a href="javascript:;" v="32" aid="69417568-9e3a-49c6-b21d-5282b7239922" _type="0">吉林市</a>
                <a href="javascript:;" v="262144" aid="ddd4e4d0-afb3-46c6-8aa6-6257c8ce9bee" _type="0">嘉兴市</a>
                <a href="javascript:;" v="16" aid="91c38a9c-30e0-4e44-af39-9b5d49928509" _type="0">景德镇市</a>
                <a href="javascript:;" class="hot" v="512" aid="43ba3517-6aa8-423b-9f02-a3b0fd681740" _type="0"><strong>江门市</strong></a>
                <a href="javascript:;" v="4" aid="72f8f62e-e5cb-418f-9419-a542c409d122" _type="0">江阴市</a>
                <a href="javascript:;" v="262144" aid="1e07c926-06e9-40cd-b257-a78d1d313ae7" _type="0">金华市</a>
                <a href="javascript:;" v="8192" aid="c64e3be4-5e14-4a74-ae4f-f6cd366ae624" _type="0">济宁市</a>
            </dd>
        </dl>
    </div>
    <div class="citylist">
        <dl>
            <dt>K</dt>
            <dd>
                <a href="javascript:;" class="hot" v="128" aid="0dbb02ef-c055-429f-97b6-5dc7a5bfeda8" _type="1"><strong>昆山市</strong></a>
            </dd>
        </dl>
        <dl>
            <dt>L</dt>
            <dd>
                <a href="javascript:;" v="262144" aid="b0efaf6f-ec54-4264-b0a5-2012a9ec7ee8" _type="0">丽水市</a>
                <a href="javascript:;" v="8192" aid="afbcecb5-0f4c-4e28-aeb4-53372dd301a7" _type="0">临沂市</a>
                <a href="javascript:;" v="8192" aid="bc3c25d7-7308-40aa-8fd7-60b96ba87bf4" _type="0">聊城市</a>
                <a href="javascript:;" v="32" aid="8edda15e-0e21-436c-978d-68eb5bb14ef7" _type="0">兰州市</a>
                <a href="javascript:;" v="4" aid="b2d5732b-b0f8-4fdf-b011-b95b31effa1d" _type="0">连云港市</a>
                <a href="javascript:;" v="4" aid="2ec568bc-94e2-4539-9ee6-83fe3439a464" _type="0">六安市</a>
                <a href="javascript:;" v="32" aid="297c5d78-4d09-42cc-ac13-8421f201b6a9" _type="0">辽阳市</a>
                <a href="javascript:;" v="8192" aid="fec2b413-bdf1-4c6d-98ec-d2de0f237be0" _type="0">莱芜市</a>
                <a href="javascript:;" v="256" aid="7f21282c-4bd0-45c0-a195-87663f9c27eb" _type="0">廊坊市</a>
            </dd>
        </dl>
        <dl>
            <dt>M</dt>
            <dd>
                <a href="javascript:;" v="4" aid="45a989b7-d34e-40c7-aca1-990923eda2cd" _type="0">马鞍山市</a>
            </dd>
        </dl>
        <dl>
            <dt>N</dt>
            <dd>
                <a href="javascript:;" v="64" aid="7cd187b5-8b3f-4c1a-8115-24a5e2d18f3a" _type="0">南宁市</a>
                <a href="javascript:;" v="16" aid="75fbd2c7-8cbc-4bbd-94ef-5eb037a75be5" _type="0">南昌市</a>
                <a href="javascript:;" v="4" aid="603d28a7-b4c8-4a13-823f-d627c2655557" _type="0">南通市</a>
                <a href="javascript:;" class="hot" v="128" aid="9069d884-96c5-4478-bb49-d6ba55b751c8" _type="1"><strong>南京市</strong></a>
                <a href="javascript:;" class="hot" v="131072" aid="c0a5de4e-9087-4678-9056-f589ad833656" _type="1"><strong>宁波市</strong></a>
            </dd>
        </dl>
    </div>
    <div class="citylist">
        <dl>
            <dt>Q</dt>
            <dd>
                <a href="javascript:;" v="16" aid="2b3763ec-2491-4ee0-97a6-20cf70f81933" _type="0">泉州市</a>
                <a href="javascript:;" v="256" aid="5d9e78ba-c583-4962-b279-2a8948df9ee1" _type="0">秦皇岛市</a>
                <a href="javascript:;" v="8192" aid="7ced387b-577d-4060-83d1-13b78f60ff53" _type="0">青岛市</a>
                <a href="javascript:;" v="262144" aid="4693602d-80d7-4b72-b3b5-ca6a26f051f1" _type="0">衢州市</a>
            </dd>
        </dl>
        <dl>
            <dt>R</dt>
            <dd>
                <a href="javascript:;" v="8192" aid="d1bcc39a-7383-40ca-add9-ee3feb38b677" _type="0">日照市</a>
            </dd>
        </dl>
        <dl>
            <dt>S</dt>
            <dd>
                <a href="javascript:;" v="262144" aid="df2e0859-ed44-4e81-95a5-1c8b59381b99" _type="0">绍兴市</a>
                <a href="javascript:;" v="4" aid="915494bd-4eb5-4dfb-9022-2f82abc071d2" _type="0">宿州市</a>
                <a href="javascript:;" v="4" aid="7e8111e6-d7ce-41ce-a660-3033ab81705c" _type="0">宿迁市</a>
                <a href="javascript:;" v="65536" aid="191a03f0-5acf-4bba-8d79-551fa80f77c2" _type="0">沈阳市</a>
                <a href="javascript:;" v="64" aid="3f4f22dc-7a00-460c-82c1-678df82258bf" _type="0">汕头市</a>
                <a href="javascript:;" class="hot" v="512" aid="0540d74e-0ffb-4a3a-ab79-ec590dd49947" _type="0"><strong>深圳市</strong></a>
                <a href="javascript:;" class="hot" v="1" aid="312d0556-0671-4f2e-8bac-7b8873b5a03a" _type="1"><strong>上海</strong></a>
                <a href="javascript:;" v="16" aid="98373b1b-201c-4753-b540-14bb1cd6564e" _type="0">上海(郊区)</a>
                <a href="javascript:;" class="hot" v="128" aid="dec5b754-fe58-48d6-8b37-6bc91ee08460" _type="1"><strong>苏州市</strong></a>
                <a href="javascript:;" v="256" aid="28eab84c-07bf-439f-bb96-92274545c77b" _type="0">石家庄市</a>
            </dd>
        </dl>
        <dl>
            <dt>T</dt>
            <dd>
                <a href="javascript:;" v="32" aid="17ee7ac2-d7ce-4c02-80ea-1babea0a8933" _type="0">唐山市</a>
                <a href="javascript:;" v="32" aid="245dccf7-34cb-466f-aa68-45a242927e18" _type="0">太原市</a>
                <a href="javascript:;" v="262144" aid="5fddc946-9a0c-4dad-bc92-5e05aa5658cd" _type="0">台州市</a>
                <a href="javascript:;" v="8192" aid="63ae9bcf-002f-4514-b052-66702274b1c7" _type="0">泰安市</a>
                <a href="javascript:;" v="4" aid="47ef05fe-cf55-4661-b2bb-8a0b278a01fe" _type="0">铜陵市</a>
                <a href="javascript:;" v="262144" aid="0d920097-3f8a-4ac5-8d48-c7ba7b344ab3" _type="0">桐乡市</a>
                <a href="javascript:;" v="4" aid="e033ce28-146d-4de2-a08f-f3820cf5eea7" _type="0">太仓市</a>
                <a href="javascript:;" v="4" aid="6ba21255-37f7-4619-859c-fde2bb914c4c" _type="0">泰州市</a>
                <a href="javascript:;" class="hot" v="8" aid="93570b8c-0a0a-4818-8317-75a0d14093a5" _type="1"><strong>天津</strong></a>
            </dd>
        </dl>
    </div>
    <div class="citylist">
        <dl>
            <dt>W</dt>
            <dd>
                <a href="javascript:;" v="8192" aid="556550b5-ea16-4b86-9ecd-1b66d20b297b" _type="0">潍坊市</a>
                <a href="javascript:;" v="16" aid="3a5c6df3-9ca1-41a8-bc9c-453050bb7897" _type="0">武汉市</a>
                <a href="javascript:;" v="4" aid="5e7cd4c7-2f86-47c2-bcc1-5d4b33829f1b" _type="0">芜湖市</a>
                <a href="javascript:;" v="262144" aid="734d3328-587c-4b16-bddc-9c8682e76ea5" _type="0">温州市</a>
                <a href="javascript:;" v="8192" aid="08727bb1-22ea-40ca-81f9-7dc9b0fcabd0" _type="0">威海市</a>
                <a href="javascript:;" v="4" aid="33b3203d-c4b6-4c91-abd0-f3f0a226e461" _type="0">吴江市</a>
                <a href="javascript:;" class="hot" v="128" aid="361bc174-b1e5-4fb6-8f69-c391dcd92644" _type="1"><strong>无锡市</strong></a>
            </dd>
        </dl>
        <dl>
            <dt>X</dt>
            <dd>
                <a href="javascript:;" v="4" aid="4b8d53e7-8613-41a9-b412-591be810958d" _type="0">宣城市</a>
                <a href="javascript:;" v="32" aid="462e1848-fbc8-4fac-9ef6-60819e350fbc" _type="0">邢台市</a>
                <a href="javascript:;" v="524288" aid="9a2b3612-8529-4ddf-86bd-60b7a46444a7" _type="0">西安市</a>
                <a href="javascript:;" v="16" aid="146a4ea1-7ba2-4e0b-bf92-a56ddc2d4eb2" _type="0">厦门市</a>
                <a href="javascript:;" v="4" aid="95e8ce6d-2c7e-4364-9b66-8903c1afd338" _type="0">徐州市</a>
            </dd>
        </dl>
        <dl>
            <dt>Y</dt>
            <dd>
                <a href="javascript:;" v="4" aid="3ed942ac-0504-479b-8808-4d9ca08df39b" _type="0">扬州市</a>
                <a href="javascript:;" v="4" aid="d165194a-9ad8-4c5c-b75d-4f05e8dc9fbc" _type="0">宜兴市</a>
                <a href="javascript:;" v="4" aid="36ccf429-efe3-4192-9530-6fbee4984621" _type="0">盐城市</a>
                <a href="javascript:;" v="8192" aid="7d381d70-fc5a-4d1c-8dd0-9400fd5280fd" _type="0">烟台市</a>
                <a href="javascript:;" v="4" aid="9531dd6c-5678-4320-9089-94bb3bde5e82" _type="0">仪征市</a>
                <a href="javascript:;" v="64" aid="0b5447d8-dc18-43eb-849d-96f362588d13" _type="0">阳江市</a>
                <a href="javascript:;" v="262144" aid="6b804583-e3d5-47d5-8bc5-a6a1f46a4cf8" _type="0">余姚市</a>
                <a href="javascript:;" v="256" aid="95869d1f-594d-4027-8cf4-a8ef043e1d95" _type="0">燕郊</a>
                <a href="javascript:;" v="262144" aid="c9d4fe94-a93a-4382-bf3f-acc16233a71d" _type="0">义乌市</a>
                <a href="javascript:;" v="32" aid="d1c0ada7-06b3-4d53-8f91-ccdc9f61d9ba" _type="0">银川市</a>
            </dd>
        </dl>
        <dl>
            <dt>Z</dt>
            <dd>
                <a href="javascript:;" v="32" aid="67124f15-06c9-4dfc-abcb-36f654f1572c" _type="0">张家口市</a>
                <a href="javascript:;" v="4" aid="4afe1762-447a-4f0d-b3c2-4746f5818ce7" _type="0">亳州市</a>
                <a href="javascript:;" class="hot" v="512" aid="0718b3bf-b99b-4aa4-97bd-4a4da0b92464" _type="0"><strong>珠海市</strong></a>
                <a href="javascript:;" v="16" aid="2aac03c9-daf1-4aa8-9505-0bc169742e8a" _type="0">郑州市</a>
                <a href="javascript:;" v="64" aid="b9d27a3f-ddba-4e4d-8577-652b96fcf6a8" _type="0">湛江市</a>
                <a href="javascript:;" v="4" aid="95b1771b-dcd5-470e-9aea-9d607d5fd9e7" _type="0">张家港市</a>
                <a href="javascript:;" class="hot" v="512" aid="29bd9fa7-274c-4257-85e2-a22e2cd1d2ce" _type="0"><strong>中山市</strong></a>
                <a href="javascript:;" v="262144" aid="04d2148e-5d5a-4372-a8a1-ad6fd9756b2b" _type="0">舟山市</a>
                <a href="javascript:;" v="8192" aid="b07704cf-41a9-4997-8ac4-7e739d7e978a" _type="0">枣庄市</a>
                <a href="javascript:;" v="8192" aid="9e21dcb6-47fa-42f8-89c3-9216ba489f1e" _type="0">淄博市</a>
                <a href="javascript:;" v="4" aid="26b6f9a2-850b-4cab-be30-d62e6221dab9" _type="0">镇江市</a>
            </dd>
        </dl>
    </div>

</div>
                        
                            
<script id="_citytpl" type="text/x-handlebars-template">

    <div class="headline">
        <a href="javascript:;" v="64" aid="00000000-0000-0000-0000-000000000000">全国其它城市&gt;&gt;</a> 请根据您的收货地址选择
    </div>
    <div class="city-hot">
        <span><i></i>热门城市</span>
        {{#each HotCity}}
        <a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
        {{/each}}
    </div>
    <p class="citytab"><span class="active">ABCDE</span><span>FGHIJ</span><span>KLMNO</span><span class="">PQRST</span><span class="">UVWXYZ</span></p>
    <div class="citylist active">
        {{#each City1}}
        <dl>
            <dt>{{@key}}</dt>
            <dd>
                {{#each this}}
                {{#equal WebShow 2}}
                <a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
                {{else}}
                <a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
                {{/equal}}
                {{/each}}
            </dd>
        </dl>
        {{/each}}
    </div>
    <div class="citylist ">
        {{#each City2}}
        <dl>
            <dt>{{@key}}</dt>
            <dd>
                {{#each this}}
                {{#equal WebShow 2}}
                <a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
                {{else}}
                <a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
                {{/equal}}
                {{/each}}
            </dd>
        </dl>
        {{/each}}
    </div>
    <div class="citylist ">
        {{#each City3}}
        <dl>
            <dt>{{@key}}</dt>
            <dd>
                {{#each this}}
                {{#equal WebShow 2}}
                <a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
                {{else}}
                <a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
                {{/equal}}
                {{/each}}
            </dd>
        </dl>
        {{/each}}
    </div>
    <div class="citylist ">
        {{#each City4}}
        <dl>
            <dt>{{@key}}</dt>
            <dd>
                {{#each this}}
                {{#equal WebShow 2}}
                <a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
                {{else}}
                <a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
                {{/equal}}
                {{/each}}
            </dd>
        </dl>
        {{/each}}
    </div>
    <div class="citylist ">
        {{#each City5}}
        <dl>
            <dt>{{@key}}</dt>
            <dd>
                {{#each this}}
                {{#equal WebShow 2}}
                <a href="javascript:;" class="hot" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}"><strong>{{AreaName}}</strong></a>
                {{else}}
                <a href="javascript:;" v="{{WebCode}}" aid="{{AreaId}}" _type="{{DeliveryType}}">{{AreaName}}</a>
                {{/equal}}
                {{/each}}
            </dd>
        </dl>
        {{/each}}
    </div>

</script>
                        <!--</div>-->
                    </li>
                    <!--送货城市 结束-->
                </ul>
                <ul class="fr">

                    
                    <li class="TEL"><a rel="nofollow" href="http://home.yiguo.com/Trade/OnlineDelivery" target="_blank"><i></i>礼品兑换券入口</a></li>
                    <li class="pay"><a rel="nofollow" href="http://home.yiguo.com/Recharge/Index" target="_blank"><i></i>储值卡</a></li>

                    <li class="mobile">
                        <!--<div class="tit"><a href="javascript:void(0)"><i></i>手机易果<s></s></a></div>
                        <div class="con">
                            <div class="item"><img src="http://static01.yiguo.com/www/images/header/qrcode_app.jpg" width="125" height="125"><span>扫一扫下载APP</span></div>
                            <div class="item"><img src="http://static01.yiguo.com/www/images/header/qrcode_wechat.jpg" width="125" height="125"><span>易果生鲜微信</span></div>
                        </div>-->
                    </li>
                    <li class="myyiguo">
                        
                        <div class="tit"><a rel="nofollow" href="http://home.yiguo.com" target="_blank"><i></i>我的小象<s></s></a></div>
                        <div class="con">
                            <a rel="nofollow" href="http://home.yiguo.com/Trade/OrderList">我的订单</a>
                            <a rel="nofollow" href="http://home.yiguo.com/Trade/MyCoupons">我的优惠券<b id="coupon">0</b></a>
                            <a rel="nofollow" href="http://home.yiguo.com/Trade/MyCollection">我的收藏</a>
                            <a rel="nofollow" href="http://home.yiguo.com/Trade/UMoney">我的悠币</a>
                            <a rel="nofollow" href="http://home.yiguo.com/Trade/BackOrder">我的退换货</a>
                            <a rel="nofollow" href="http://home.yiguo.com/Account/Balance">预存款查询</a>
                            <a rel="nofollow" href="http://event.yiguo.com/activity/">立即充值</a>
                            <a rel="nofollow" href="javascript:;" class="logout" style="display:none;">退出</a>
                            
                        </div>
                    </li>
                    <li id="_logout" style="display:none"><a href="javascript:;" class="logout">[退出]</a></li>
                    <li id="_loginname" style="display:none"><a rel="nofollow" href="http://home.yiguo.com"></a></li>
                    <li id="_register" style="display:none"><a rel="nofollow" href="https://login.yiguo.com/Register?url=http://www.yiguo.com/">[注册]</a></li>
                    <li id="_login" style="display:none">
                        <a rel="nofollow" href="https://login.yiguo.com/ub/login.aspx?url=http://www.yiguo.com/">[登录]</a>
                    </li>
                </ul>
            </div>
        </div>
        <!------- 头部 ------->
        <script src="js/fixed.js" type="text/javascript" charset="utf-8"></script>
        <div class="header1 clearfix  " id="nav">
            <div class="wrap">
                <div class="logo">
                	
                    <a href="http://www.yiguo.com"><img src="img/logo.png"/></a>
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
                            {{#KeyWords}}
                            {{#equal IsImportant true}}
                            <a href="{{Link}}" class="hot" target="_blank">{{Text}}</a>
                            {{else}}
                            <a href="{{Link}}" target="_blank">{{Text}}</a>
                            {{/equal}}
                            {{/KeyWords}}
                        </script>
                    </div>
                </div>
                <!--购物车 开始-->
                <div class="shopping-cart">
    <dl>
        <dt class="shopping-btn"><a href="http://cart.yiguo.com/"> <span class="totleNum"><b>0</b></span><b class="totlePrice">0.0</b></a></dt>
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
                    <div><a href="http://cart.yiguo.com/" class="settleup">去购物车</a></div>
                </div>
            </div>
        </dd>
    </dl>
</div>
                <!--购物车 结束-->
            </div>
        </div>
        <div id="div2">
        	
        </div>
        


<div class="header-nav">
    <div class="wrap">
        <!--商品分类 开始-->
        <div class="catalogs">
            
            <div class="catalogs-title"><a href="javascript:;">全部商品分类▼</a></div>
            <div class="catalogs-list" style="display:none">
                        <div class="item">
                            <h3 class="t01_channelhome"><a href="http://www.yiguo.com/products/01_channelhome.html"><i></i>进口水果<s>></s></a></h3>
                            <div class="sub-item">
                                <h4><a href="http://www.yiguo.com/products/01_channelhome.html">进口水果</a></h4>
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
    </div>
</div>







<div class="wrap">
    <!--面包屑-->
    <div class="crumbs">
        <a class="ml0" href="/">首页</a>
        >
<a href='/products/01_channelhome.html'>进口水果</a>>                    <a href="http://www.yiguo.com/products/0111_ganjuchengyou.html">柑桔橙柚</a>
><%=product.getProductName() %>南非葡萄柚4个230g以上/个
    </div>
    <!--产品详情-->
    <div class="content clearfix">
        <div class="product-intro clearfix j_product">
            <!--预览图-->
            <div class="pic-preview">
                <div class="pic-big">
                    <img class="j_product_img" width="500" height="500" id="pic1" src="<%=request.getAttribute("pic1") %>" style="display: block;">
                    <img class="j_product_img" width="500" height="500" id="pic2" src="<%=request.getAttribute("pic2") %>" style="display: none;">
                    <img class="j_product_img" width="500" height="500" id="pic3" src="<%=request.getAttribute("pic3") %>" style="display: none;">
                </div>
                <div class="pic-thumb">
                    <div class="picList">
                        <ul>
                           	<li><img width="85" height="85" id="picture1" src="<%=request.getAttribute("pic1") %>" onclick=""></li>
                            <li><img width="85" height="85" id="picture2" src="<%=request.getAttribute("pic2") %>" onclick=""></li>
                            <li><img width="85" height="85" id="picture3" src="<%=request.getAttribute("pic3") %>" onclick=""></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="product-info">
                <div class="summary-name">
                    <h1><%=product.getProductName() %></h1>
                    <p>酸甜清苦 柔嫩清香</p>
                    <input type="hidden" name="CommodityId" id="CommodityId" value="a8efe459-fb15-4fda-85c4-a9ab0d98093a" />
                </div>
                <div class="summary-price clearfix">
                    <div class="pro-price">
                        <div>
                            <span>价格：</span>
                            <span><em>¥</em><strong><%=product.getPrice()%></strong></span>
                        </div>
                    </div>
                    <div class="pro-review">
                        <p>总体满意度</p>
                        <p><b>5.0</b> 分</p>
                        <p><a href="#comment" id="pllabel"><span>(评论数777)</span></a></p>
                    </div>
                </div>
                <div class="summary-other clearfix">
                    <div class="left">
                            <div id="commoditypromotions"></div>

<div class="pro-promo clearfix" style="margin-bottom:0px;padding-bottom:0px;border-bottom:none;">
    <ul>
            <li><span class="fl"><em>促</em><%=product.getRemarks()%></span></li>
    </ul>
            <div class="promobox mjbox" style="display: none;">
                <div class="promobox-wrap clearfix">
                    <p><em>促</em><%=product.getRemarks()%></p>
                    
                </div>
            </div>
</div>                                                                            <div class="pro-service">满百包邮，<b><%=time %></b> 前完成订单 预计明日<b><%=date %></b>送达</div>
                            <div class="pro-service"><i class="mr5"><img src="http://static01.yiguo.com/www/images/icon1.png"></i>不支持7天无理由退货</div>
                        <div class="pro-amount clearfix">
                            <div class="dt">数量：</div>
                            <div class="dd">
                                <div class="spinner">
                                    <button class="decrease" id="decreasebutton" onclick="decreasecount()">-</button>
                                    <form>
                                    <input type="text" class="spinner value" id="p_number" name="Numofchang" maxlength="2" value="0">
                                    </form>
                                    <button class="increase" id="increasebutton" onclick="increasecount()">+</button>
                                </div>
                            <div class="addcart"><a class="btn-gn" href="javascript:;" onclick="G.app.cart.module.addToCart(this,'1399033',$('#p_number').val(),app.referCart);getcart()">
                            <i><img src="img/guowuche.png"></i>加入购物车</a></div>
                            </div>
                        </div>
                        



                    </div>
                    <div class="right">
                        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="zx">
                            <tbody>
                                    <tr><th>原产地：</th><td><%=product.getProductPlace()%></td></tr>
                                <tr><th>商品编号：</th><td id="Amount"><%=product.getProductId() %></td></tr>
                                    <tr><th>品牌：</th><td><%=product.getProductBanner() %></td></tr>
                                <tr><th>发货地：</th><td><%=product.getShippingAddress() %>></td></tr>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content clearfix">
        <!--左侧-->
        <div class="left-con">
            <div class="GetArtical"></div>
            
            <div id="RecentViewCommodity" style="display:none;">
                <div class="box recently">
    <div class="hd">最近浏览<a href="javascript:;" onclick="ClearViewedCommodity()">清空</a></div>
    <div class="bd" id="recentcommodity">
        <script id="recentcommoditytpl" type="text/x-handlebars-template">
            {{#data}}
            <div class="p">
                <div class="img"><a class="del" onclick="DeleteViewedCommodity(this, '{{CommodityCode}}')"></a>
                    <a href="http://www.yiguo.com/product/{{CommodityCode}}.html" target="_blank"><img class="lazy" data-original="{{PictureUrl}}" width="68" height="68"></a>
                </div>
                <div class="txt">
                    <a href="http://www.yiguo.com/product/{{CommodityCode}}.html" target="_blank">
                        <strong>{{CommodityName}}</strong>
                    </a>
                </div>
            </div>
            {{/data}}
        </script>
    </div>
</div>


            </div>
            


    <div class="box recommend">
        <div class="hd">猜你喜欢</div>
        <div class="bd">
            <div class="p j_product"  _code="1337330">
                <div class="img">
                    <a href="http://www.yiguo.com/product/1337330.html" target="_blank">
                            <!--<img data-original="http://img11.yiguoimg.com/d/items/2017/171214/9288716535178126_300.jpg" width="68" height="68" class="j_product_img lazy">-->
                            <img src="img/9288716570796943_300.jpg" width="68" height="68"/>
                    </a>
                </div>
                <div class="txt">
                    <a href="http://www.yiguo.com/product/1337330.html" target="_blank">
                        <strong>以色列青柚2个300g以上/个</strong>
                        <span>¥25.90</span>
                    </a>
                </div>
                <a class="add" style="display: none;" onclick="G.app.cart.module.addToCart(this,'1337330',1,app.referCart)">加入购物车</a>
                
            </div>
            <div class="p j_product"  _code="1240347">
                <div class="img">
                    <a href="http://www.yiguo.com/product/1240347.html" target="_blank">
                            <img data-original="http://img11.yiguoimg.com/d/items/2017/171227/9288717121594267_300.jpg" width="68" height="68" class="j_product_img lazy">
                            
                            <img src="img/9288716570796943_300.jpg" width="68" height="68"/>
                    </a>
                </div>
                <div class="txt">
                    <a href="http://www.yiguo.com/product/1240347.html" target="_blank">
                        <strong>以色列葡萄柚6个250g以上/个</strong>
                        <span>¥39.80</span>
                    </a>
                </div>
                <a class="add" style="display: none;" onclick="G.app.cart.module.addToCart(this,'1240347',1,app.referCart)">加入购物车</a>
            </div>
            <div class="p j_product"  _code="1343004">
                <div class="img">
                    <a href="http://www.yiguo.com/product/1343004.html" target="_blank">
                            <img data-original="http://img12.yiguoimg.com/d/items/2018/180105/9288717514679333_300.jpg" width="68" height="68" class="j_product_img lazy">
                            
                            <img src="img/9288716570796943_300.jpg" width="68" height="68"/>
                    </a>
                </div>
                <div class="txt">
                    <a href="http://www.yiguo.com/product/1343004.html" target="_blank">
                        <strong>新奇士美国脐橙12个150g以上/个</strong>
                        <span>¥36.80</span>
                    </a>
                </div>
                <a class="add" style="display: none;" onclick="G.app.cart.module.addToCart(this,'1343004',1,app.referCart)">加入购物车</a>
            </div>
            <div class="p j_product"  _code="1336808">
                <div class="img">
                    <a href="http://www.yiguo.com/product/1336808.html" target="_blank">
                            <img data-original="http://img09.yiguoimg.com/d/items/2017/171229/9288717227139997_300.jpg" width="68" height="68" class="j_product_img lazy">
                            <img src="img/9288716570796943_300.jpg" width="68" height="68"/>
                    </a>
                </div>
                <div class="txt">
                    <a href="http://www.yiguo.com/product/1336808.html" target="_blank">
                        <strong>新奇士美国柠檬4个85g以上/个</strong>
                        <span>¥19.90</span>
                    </a>
                </div>
                <a class="add" style="display: none;" onclick="G.app.cart.module.addToCart(this,'1336808',1,app.referCart)">加入购物车</a>
            </div>
            <div class="p j_product"  _code="1337525">
                <div class="img">
                    <a href="http://www.yiguo.com/product/1337525.html" target="_blank">
                            <img data-original="http://img10.yiguoimg.com/d/items/2017/171215/9288716570796943_300.jpg" width="68" height="68" class="j_product_img lazy">
                            <img src="img/9288716570796943_300.jpg" width="68" height="68"/>
                    </a>
                </div>
                <div class="txt">
                    <a href="http://www.yiguo.com/product/1337525.html" target="_blank">
                        <strong>以色列青柚4个300g以上/个</strong>
                        <span>¥49.90</span>
                    </a>
                </div>
                <a class="add" style="display: none;" onclick="G.app.cart.module.addToCart(this,'1337525',1,app.referCart)">加入购物车</a>
            </div>
            <div class="p j_product"  _code="1001196">
                <div class="img">
                    <a href="http://www.yiguo.com/product/1001196.html" target="_blank">
                            <img data-original="http://img13.yiguoimg.com/d/items/2017/171227/9288717121725339_300.jpg" width="68" height="68" class="j_product_img lazy">
                            <img src="img/9288716570796943_300.jpg" width="68" height="68"/>
                    </a>
                </div>
                <div class="txt">
                    <a href="http://www.yiguo.com/product/1001196.html" target="_blank">
                        <strong>以色列葡萄柚4个250g以上/个</strong>
                        <span>¥26.80</span>
                    </a>
                </div>
                <a class="add" style="display: none;" onclick="G.app.cart.module.addToCart(this,'1001196',1,app.referCart)">加入购物车</a>
            </div>
            <div class="p j_product"  _code="1343003">
                <div class="img">
                    <a href="http://www.yiguo.com/product/1343003.html" target="_blank">
                            <img data-original="http://img14.yiguoimg.com/d/items/2018/180105/9288717514908709_300.jpg" width="68" height="68" class="j_product_img lazy">
                            <img src="img/9288716570796943_300.jpg" width="68" height="68"/>
                    </a>
                </div>
                <div class="txt">
                    <a href="http://www.yiguo.com/product/1343003.html" target="_blank">
                        <strong>新奇士美国脐橙20个150g以上/个</strong>
                        <span>¥59.80</span>
                    </a>
                </div>
                <a class="add" style="display: none;" onclick="G.app.cart.module.addToCart(this,'1343003',1,app.referCart)">加入购物车</a>
            </div>
            <div class="p j_product"  _code="1355391">
                <div class="img">
                    <a href="http://www.yiguo.com/product/1355391.html" target="_blank">
                            <img data-original="http://img11.yiguoimg.com/d/items/2018/180222/9288719529419862_300.jpg" width="68" height="68" class="j_product_img lazy">
                            <img src="img/9288716570796943_300.jpg" width="68" height="68"/>
                    </a>
                </div>
                <div class="txt">
                    <a href="http://www.yiguo.com/product/1355391.html" target="_blank">
                        <strong>西班牙脐橙15个180g以上/个</strong>
                        <span>¥59.80</span>
                    </a>
                </div>
                <a class="add" style="display: none;" onclick="G.app.cart.module.addToCart(this,'1355391',1,app.referCart)">加入购物车</a>
            </div>
            <div class="p j_product"  _code="1355392">
                <div class="img">
                    <a href="http://www.yiguo.com/product/1355392.html" target="_blank">
                            <img data-original="http://img09.yiguoimg.com/d/items/2018/180222/9288719529780310_300.jpg" width="68" height="68" class="j_product_img lazy">
                            <img src="img/9288716570796943_300.jpg" width="68" height="68"/>
                    </a>
                </div>
                <div class="txt">
                    <a href="http://www.yiguo.com/product/1355392.html" target="_blank">
                        <strong>西班牙脐橙10个180g以上/个</strong>
                        <span>¥41.80</span>
                    </a>
                </div>
                <a class="add" style="display: none;" onclick="G.app.cart.module.addToCart(this,'1355392',1,app.referCart)">加入购物车</a>
            </div>
            <div class="p j_product" style=border-bottom-width:0px _code="1351957">
                <div class="img">
                    <a href="http://www.yiguo.com/product/1351957.html" target="_blank">
                            <img data-original="http://img13.yiguoimg.com/d/items/2018/180205/9288719113331781_300.jpg" width="68" height="68" class="j_product_img lazy">
                            <img src="img/9288716570796943_300.jpg"/>
                    </a>
                </div>
                <div class="txt">
                    <a href="http://www.yiguo.com/product/1351957.html" target="_blank">
                        <strong>新奇士美国CaraCara红心脐橙4个160g以上/个</strong>
                        <span>¥26.90</span>
                    </a>
                </div>
                <a class="add" style="display: none;" onclick="G.app.cart.module.addToCart(this,'1351957',1,app.referCart)">加入购物车</a>
            </div>
        </div>
    </div>

<!--<script type="text/javascript">
    $(function () {
        $("img.lazy").lazyload({ effect: "fadeIn" });
    })
</script>-->
   <script type="text/javascript">
		var mypic1 =document.getElementById("picture1");
		var mypic2 =document.getElementById("picture2");
		var mypic3 =document.getElementById("picture3");
		var dis1=document.getElementById("pic1");
		var dis2=document.getElementById("pic2");
		var dis3=document.getElementById("pic3");
		mypic1.onmouseover=function(){
			//alert('这是第一张图片');
			var dis1=document.getElementById("pic1");
			dis1.style.display="block";
			dis2.style.display="none";
			dis3.style.display="none";
		}
		mypic2.onmouseover=function(){
			dis1.style.display="none";
			dis2.style.display="block";
			dis3.style.display="none";
		}
		mypic3.onmouseover=function(){
			dis1.style.display="none";
			dis2.style.display="none";
			dis3.style.display="block";
		}
	</script>
        </div>
        <!--右侧-->
        <div class="main-con">
            <!--当季热卖-->
            <div id="GetHotCommodity"></div>
            
            <!--商品详情-->
             <div class="comment-mymain">
                <div class="Option1">
                    <ul >
                        <li class="Option2" style="border-bottom:none ;" onclick="getdetail()" id="tabA1"><a href="#ProductDetail"><strong>商品详情</strong></a></li>
                        <li onclick="getCommentvalue();getcomment()" id="tabA2"><a href="#ProductComment"><strong>用户评论</strong><<b>777</b>></a></li>
                    </ul>
                </div>
                <div class="">
                    <!--商品详情-->
                    <div class="" id="ProductDetail" style="display: block;">
                    	<div class="describepic"><img src="<%=request.getAttribute("pic2") %>"/></div>
                        <div class="describedetail" id=""><p><%=product.getDescrible() %></p></div>
                    </div>
                    <!--
                    	作者：offline
                    	时间：2018-07-14
                    	描述:评价
                    -->
                    <div id="ProductComment" style="display: none;">
                    	<div class="Option3">
                    		<ul class="">
                        		<li onclick="getgoodpage()" id="tabB1"><a href="#ProductComment"><strong>好评</strong><<b><strong>888</strong></b>></a></li>
                        		<li onclick="getbadpage()" id="tabB2"><a href="#ProductComment"><strong>差评</strong><<b>777</b>></a></li>
                        		<li onclick="getnomalpage()" id="tabB3"><a href="#ProductComment"><strong>中评</strong><<b>777</b>></a></li>
                    		</ul>	
                    	</div><hr id="split">
                    	<!--
                        	作者：offline
                        	时间：2018-07-15
                        	描述：中间代码jsp页面实现
                        -->
                    	<div id="maindiv"></div>
                    </div>
                    <!--用户评论--------------------------------------------------------------->
        <!--<script type="text/javascript">
		var divdetail=document.getElementById("ProductDetail");
		var divcom=document.getElementById("ProductComment");
		function getdetail(){
			divdetail.style.display="block";
			divcom.style.display="none";
		}
		function getcomment(){
			divdetail.style.display="none";
			divcom.style.display="block";
		}
		</script>-->
		<script type="text/javascript">
			var Mypic1=document.getElementById("tabA1");
			var Mypic2=document.getElementById("tabA2");
			var Mypic3=document.getElementById("tabB1");
			var Mypic4=document.getElementById("tabB2");
			var Mypic5=document.getElementById("tabB3");
					window.onload=Mypic1.onmouseover=function(){
						Mypic1.style.backgroundColor="#CCCCCC";
					}
					window.onload=Mypic1.onmouseleave=function(){
						Mypic1.style.backgroundColor="#FFFFFF";
					}
					window.onload=Mypic2.onmouseover=function(){
					//alert('and you !');
						Mypic2.style.backgroundColor="#CCCCCC";
					}
					window.onload=Mypic2.onmouseleave=function(){
						Mypic2.style.backgroundColor="#FFFFFF";
					}
					window.onload=Mypic3.onmouseover=function(){
						Mypic3.style.backgroundColor="#CCCCCC";
					}
					window.onload=Mypic3.onmouseleave=function(){
						Mypic3.style.backgroundColor="#FFFFFF";
					}
					window.onload=Mypic4.onmouseover=function(){
						Mypic4.style.backgroundColor="#CCCCCC";
					}
					window.onload=Mypic4.onmouseleave=function(){
						Mypic4.style.backgroundColor="#FFFFFF";
					}
					window.onload=Mypic5.onmouseover=function(){
						Mypic5.style.backgroundColor="#CCCCCC";
					}
					window.onload=Mypic5.onmouseleave=function(){
						Mypic5.style.backgroundColor="#FFFFFF";
					}
		</script>
                </div>
            </div>        
        </div>
    </div>
</div>










        <div class="footer_service">
    <div class="wrap">
        <ul>
            <li class="s1">
                <b>全球精选</b>
                <span>一站式生鲜购物方案</span>
            </li>
            <li class="s2">
                <b>多仓直发</b>
                <span>特有次日达配送服务</span>
            </li>
            <li class="s3">
                <b>源头直采</b>
                <span>精选正宗品质好食材</span>
            </li>
            <li class="s4">
                <b>天天底价</b>
                <span>会员专属优惠购不停</span>
            </li>
        </ul>
    </div>
</div>
<!------- 页尾 ------->
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