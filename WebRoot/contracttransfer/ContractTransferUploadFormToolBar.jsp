 <%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ page import="com.gzunicorn.common.util.SysConfig" %>
<script language="javascript" src="<html:rewrite page="/common/javascript/jquery-1.9.1.min.js"/>"></script>

<script language="javascript">
//关于ToolBar
function CreateToolBar(){
  SetToolBarHandle(true);
  SetToolBarHeight(20);
  
  AddToolBarItemEx("ReturnBtn","../../common/images/toolbar/back.gif","","",'<bean:message key="toolbar.return"/>',"65","0","returnMethod()");
  
  <%-- 是否有可写的权限--%>
  <logic:equal name="<%=SysConfig.TOOLBAR_RIGHT%>" property="nContractTransferUpload" value="Y">
  	<logic:equal name="outflag" value="Y">
  	AddToolBarItemEx("OutBtn","../../common/images/toolbar/save.gif","","",'驳回',"65","1","outMethod()");
  	</logic:equal>
  	<logic:equal name="tranflag" value="Y">
  	AddToolBarItemEx("SaveDateBtn","../../common/images/toolbar/save.gif","","",'转派',"65","1","tranMethod()");
  	</logic:equal>
  	<logic:equal name="addflag" value="Y">
  		<logic:notEqual name="isflag" value="N">
  		AddToolBarItemEx("SaveDateBtn","../../common/images/toolbar/save.gif","","",'<bean:message key="toolbar.save"/>',"65","1","saveDateMethod()");
  		</logic:notEqual>
  	AddToolBarItemEx("SaveReturnBtn","../../common/images/toolbar/save_back.gif","","",'保存并提交',"100","1","saveReturnMethod()");
  	</logic:equal>
  	<logic:equal name="feedbackflag" value="Y">
  	AddToolBarItemEx("SaveDateBtn","../../common/images/toolbar/save.gif","","",'<bean:message key="toolbar.save"/>',"65","1","feedbackMethod()");
  	</logic:equal>
  	
  	<logic:equal name="mainenter" value="Y">
  	AddToolBarItemEx("ReferBtn","../../common/images/toolbar/edit.gif","","",'反馈',"65","1","feedbackMethod2()");
  	</logic:equal>
  	
  </logic:equal>
  
  window.document.getElementById("toolbar").innerHTML=GenToolBar("TabToolBar_Manage","TextToolBar_Black","Style_Over","Style_Out","Style_Down","Style_Check");
}

//返回
function returnMethod(){
  window.location = '<html:rewrite page="/ContractTransferUploadSearchAction.do"/>?method=toSearchRecord';
}

//驳回
function outMethod(){
	var transferRem = document.getElementsByName('transferRem');
	
	if(transferRem[0].value==''){
		alert("请填写驳回意见！");
	}else{
		document.contractTransferUploadForm.submit();
	}
}

//转派
function tranMethod(){
	var wbgTransfeId = document.getElementsByName('wbgTransfeId');
	
	if(wbgTransfeId[0].value==''){
		alert("请选择转派维保工！");
	}else{
		document.contractTransferUploadForm.submit();
	}
}


//反馈
function feedbackMethod(){
	var transferRem = document.getElementsByName('transferRem');
	var feedbacktypeid = document.getElementsByName('feedbacktypeid');
	
	if(feedbacktypeid[0].value==''){
		alert("请选择反馈问题类型！");
	}else if(transferRem[0].value==''){
		alert("请填写反馈内容！");
	}else{
		document.contractTransferUploadForm.submit();
	}
}

//反馈
function feedbackMethod2(){
	var billNo = document.getElementsByName('billNo');
	window.location = '<html:rewrite page="/ContractTransferUploadAction.do"/>?id='+billNo[0].value+'&method=toPrepareFeedBackRecord';
}

//保存
function saveDateMethod(){
    document.contractTransferUploadForm.submit();
}

//保存提交
function saveReturnMethod(){
	if(checkfile()){
		document.contractTransferUploadForm.transfeSubmitType.value="Y";
		document.contractTransferUploadForm.submit();
	}else{
		alert("请上传全部附件再提交！");
	}
}

function checkfile(){
	var jnlno = document.getElementsByName("jnlno");
	var checkflag = true;
	
	for(var i=0;i<jnlno.length;i++){
		var file = document.getElementsByName("file"+jnlno[i].value);
		
		if(file.length==0){
			var fileid = document.getElementsByName("jnlno_"+jnlno[i].value);
			if(fileid.length==0){
				checkflag = false;
				return false;
			}
			for(var j=0;j<fileid.length;j++){
				var file = document.getElementById(fileid[j].value);
				if(file == null || file.value == ""){
					checkflag = false;
					return false;
				}
			}
			if(!checkflag){
				return false;
			}
		}
	}
	
	return checkflag;
}

var fileGird=0;
function AddRow(uploadtab_2,jnlno){
	var upload=uploadtab_2.parentNode.parentNode.parentNode;
	var num=upload.rows.length;
	upload.insertRow(num);
	var ince0=upload.rows(num).insertCell(0);
	ince0.align="center";
	ince0.name="fileNo_"+jnlno+"_"+fileGird
	ince0.innerHTML="<input type='checkbox' name='nodes' onclick=\'cancelCheckAll(this)\'>";
	var ince1=upload.rows(num).insertCell(1);
	ince1.innerHTML="<input id=\'file_"+jnlno+"_"+fileGird+"\' name=\'"+jnlno+"_"+fileGird+"\' type=\'file\' class=\'default_input\' style=\'width:390px;\' />"
	+"<input type=\'hidden\' name=\'jnlno_"+jnlno+"\' value=\'file_"+jnlno+"_"+fileGird+"\' />";
	
	fileGird++;
}

//全选checkbox取消选中
function cancelCheckAll(thisobj){ 
  var tableObj = getFirstSpecificParentNode("table",thisobj);
  var inputs = tableObj.getElementsByTagName("input");  
  if(thisobj.checked==false){
    for(var j=0;j<inputs.length;j++){
	  if(inputs[j].type=="checkbox"){
	    inputs[j].checked = false; //table中第一个checkbox取消选中
	    break;
	  }
	}
  }
}

//删除行
function deleteFileRow(thisobj){
	var tableObj = getFirstSpecificParentNode("table",thisobj);
	
	var inputs = tableObj.getElementsByTagName("input");
	var checkboxs = new Array(); //table的所有checkbox
	for(var i=0;i<inputs.length;i++){
	    if(inputs[i].type=="checkbox"){
	    	checkboxs.push(inputs[i]);	      	
	    }
	}
	
	checkboxs[0].checked = false;//全选按钮取消选中 
	
	//在table中从下至上删除选中的行
	for(var i=checkboxs.length-1;i>0;i--){	
		if(checkboxs[i].checked == true){
		  tableObj.deleteRow(getFirstSpecificParentNode("tr",checkboxs[i]).rowIndex);
		}				
	}
}

//列表全选反选
function checkTableFileAll(thisobj){
	var tableObj = getFirstSpecificParentNode("table",thisobj);
	var rows = tableObj.rows
	for(var i=1;i<rows.length;i++){
	  var inputs = rows[i].cells[0].getElementsByTagName("input");
	  for(j=0;j<inputs.length;j++){
	    if(inputs[j].type=="checkbox"){
	      inputs[j].checked = thisobj.checked;
	    }
	  }
	}
}

//下载附件
function downloadFile(name,oldName,filePath,folder){
	var uri = '<html:rewrite page="/ContractTransferUploadAction.do"/>?method=toDownloadFile';
	var name1=encodeURI(name);
	name1=encodeURI(name1);
	var oldName1=encodeURI(oldName);
	oldName1=encodeURI(oldName1);
	filePath=encodeURI(filePath);
	filePath=encodeURI(filePath);
	    uri +='&filePath='+ filePath;
		uri +='&filesname='+ name1;
		uri +='&folder='+folder;
		uri+='&fileOldName='+oldName1;
	window.location = uri;
	//window.open(url);
}

//删除附件
var tbs;
function deleteFile(td,id,filePath){
	tbs=td;
    if(confirm("确定删除吗")){
    	tbs.parentElement.parentElement.style.display='';
		var uri = '<html:rewrite page="/ContractTransferUploadAction.do"/>?method=toDeleteFile';
		filePath=encodeURI(filePath);
		filePath=encodeURI(filePath);
		uri +='&filePath='+ filePath;
		uri +='&filesid='+ id;
		uri +='&folder=ContractTransferFileinfo.file.upload.folder';
		sendRequestDelFile(uri);  	
	}
}

var XMLHttpReq = false;
//创建XMLHttpRequest对象       
function createXMLHttpRequest() {
if(window.XMLHttpRequest) { //Mozilla 浏览器
 XMLHttpReq = new XMLHttpRequest();
}else if (window.ActiveXObject) { // IE浏览器
 XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
}
}

//发送请求函数
function sendRequestDelFile(url) {
createXMLHttpRequest();
XMLHttpReq.open("post", url, true);
XMLHttpReq.onreadystatechange = processResponseDelFile;//指定响应函数
XMLHttpReq.send(null);  // 发送请求
}
// 处理返回信息函数

  function processResponseDelFile() {
   	if (XMLHttpReq.readyState == 4) { // 判断对象状态
       	if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息        	
       	
          	var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
          	
          	if(res=="Y"){
          		tbs.parentElement.parentElement.parentElement.removeChild(tbs.parentElement.parentElement);
          	}else{
          		alert("删除失败！");
          	}
          	
          	//alert(document.getElementById("messagestring").innerHTML+";123");
       	} else { //页面不正常
             window.alert("您所请求的页面有异常。");
       	}
     }
  }


</script>

  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="22" class="table_outline3" valign="bottom" width="100%">
            <div id="toolbar" align="center">
            <script language="javascript">
              CreateToolBar();
            </script>
            </div>
            </td>
        </tr>
      </table>
    </td>
  </tr>
</table>