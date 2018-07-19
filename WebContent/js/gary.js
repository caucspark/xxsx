$(
    function()
    {
        ajaxask();
    }
);

window.onscroll=function () {

    var scroll = getScrollTop();   //滑动条 y
    var hei = getWindowHeight();
    var seehei=(scroll+hei-1061)%369;
    if(seehei<0) seehei=-seehei;
    /*if(seehei<100)
        alert("hello,it is"+seehei);
    console.log("seehei: "+seehei);*/
    //每次取4条，用json数据（<4）的长度去生成li
}
function getScrollTop(){
    var scrollTop = 0, bodyScrollTop = 0, documentScrollTop = 0;
    if(document.body){
        bodyScrollTop = document.body.scrollTop;
    }
    if(document.documentElement){
        documentScrollTop = document.documentElement.scrollTop;
    }
    scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop;
    return scrollTop;
}
function getWindowHeight() {
    var windowHeight=0;
    if(document.compatMode == "CSS1Compat")
    {
        windowHeight=document.documentElement.clientHeight;
    }
    else
    {
        windowHeight=document.body.clientHeight;
    }
    return windowHeight;
}
function createDetilofLi()
{
    //create things
    var li=document.createElement("li");
    li.className="items";

    var goodsid=li.value="1";

    var immg=document.createElement("img");

    var newpp=document.createElement("div");
    newpp.className="newpp";
    var newpp_p1=document.createElement("p");
    var newpp_a1=document.createElement("a");
    var newpp_p2=document.createElement("p");
    var newpp_stro=document.createElement("strong");
    var hovbox=document.createElement("div");
    hovbox.className="hovbox";
    var hovbox_p=document.createElement("p");
    var hovbox_input=document.createElement("input");
    hovbox_input.type="button";
    hovbox_input.value="加入购物车";
    hovbox_input.onclick=function(e){
        shopCar(e);//购物车事件
    };

    immg.src="http://img12.yiguoimg.com/d/items/2018/180509/9288722749858985_300.jpg";
    newpp_a1.href="javascript:;";
    newpp_a1.innerHTML="Zespri佳沛新西兰绿奇异果12个115-135g/个";
    newpp_stro.innerHTML="￥68.8";
    hovbox_p.innerHTML="酸酸甜甜,入口柔滑";

    //对象 insert it
    li.appendChild(immg);
    li.appendChild(newpp);
    newpp.appendChild(newpp_p1);
    newpp_p1.appendChild(newpp_a1);
    newpp.appendChild(newpp_p2);
    newpp_p2.appendChild(newpp_stro);
    li.appendChild(hovbox);
    hovbox.appendChild(hovbox_p);
    hovbox.appendChild(hovbox_input);

    //事件

    li.addEventListener('mouseover', function(){
        /*console.log("hovering!");*/
        li.style.cursor="pointer";
        hovbox.style.display="block";
    });
    li.addEventListener('mouseout', function(){
        /*console.log("hovering!");*/
        hovbox.style.display="none";
    });

    return li;
}
function servlet_xiaobai(data){
    document.location=("getInfo.do?goodsid="+data);
    console.log("click me")
    console.log(data);

}
function shopCar(e) {
    console.log("shop car...dadadda...");
    e.stopPropagation();//button事件，禁止引起父元素li事件
}


function drawShopitems(jsondata) {
    var par=document.getElementsByClassName("shopitems")[0].getElementsByTagName("ul")[0];
    var len=jsondata.length;
    createlis(par,len);
    setattr(jsondata);
}
function createlis(par,len) {
    for(var i=0;i<len;i++)
    {
        var li = createDetilofLi();
        par.appendChild(li);
    }
}
function setattr(json) {
    var par=document.getElementsByClassName("shopitems")[0];
    par=par.getElementsByClassName("items");
    var len=json.length;
    var pid=new Array();
    console.log(json);
    for(var i=0;i<len;i++)
    {
        var item=par[i];
        var ime=item.getElementsByTagName("img")[0];
        var desc=item.getElementsByClassName("newpp")[0];
        desc.d1herf=desc.getElementsByTagName("p")[0].getElementsByTagName("a")[0].href;
        desc.d1decript=desc.getElementsByTagName("p")[0].getElementsByTagName("a")[0];
        desc.d2decript=desc.getElementsByTagName("strong")[0];
        

        ime.src=json[i].Picture1;
        desc.d2decript.innerHTML="￥"+json[i].Price;

        item.pid=json[i].Productid;


        desc.d1decript.innerHTML=json[i].Productname;
    }
    for(var i=0;i<len;i++)
    {
        var item=par[i];
        item.addEventListener('click', function(){
        	console.log(pid);
            servlet_xiaobai(item.pid);//向小白对接servlet
        });
    }




}

function ajaxask() {

    var xhr;
    try{
        xhr=new XMLHttpRequest();
    }
    catch (e){
        try{// Internet Explorer
            xhr=new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e){
            try{
                xhr=new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (e){}
        }
    }
    xhr.onreadystatechange = function(){
        if(xhr.readyState==4){
            if(xhr.status==200||xhr.status==304){
                var data = xhr.responseText;
                data=eval(data);
                console.log(data);
                drawShopitems(data);
            }
        }
    }
    xhr.open("GET","logServlet?keyword=323",true);
    xhr.send(null);        //xhr.send(null);

}