  <%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ page import="com.gzunicorn.common.util.SysConfig" %>
<script language="javascript" src="<html:rewrite page="/common/javascript/checkinput.js"/>"></script>

<!--
	客户地区表页工具栏
-->
<script language="javascript">
//关于ToolBar
function CreateToolBar(){
  SetToolBarHandle(true);
  SetToolBarHeight(20);
  AddToolBarItemEx("ViewBtn","../../common/images/toolbar/search.gif","","",'<bean:message key="toolbar.search"/>',"65","0","searchMethod()"); 
  AddToolBarItemEx("ExcelBtn","../../common/images/toolbar/xls.gif","","",'<bean:message key="toolbar.xls"/>',"90","1","excelMethod()");
  window.document.getElementById("toolbar").innerHTML=GenToolBar("TabToolBar_Manage","TextToolBar_Black","Style_Over","Style_Out","Style_Down","Style_Check");
}

//查询
function searchMethod(){
	//var staffName = document.getElementById("staffName").value;
	//if(staffName=="")
	//{
	//	alert("厂检员名称不能为空，请输入厂检员名称！");
	//	return;
	//}
	
	var edate1 = document.getElementById("edate1").value;
	var sdate1 =document.getElementById("sdate1").value;
	
	if(sdate1!="" && edate1!=""){	
       if(sdate1>edate1)
     	{
      	alert("开始日期必须小于结束日期！");
      	//document.getElementById("edate1").value="";
	     return;
	   }
    }/* else
    {
    	alert("必须选择开始结束日期！");
		return;
    } */
	
	inspectorReportForm.genReport.value="";
	inspectorReportForm.target = "_blank";
	document.inspectorReportForm.submit();

}

//导出Excel
function excelMethod(){
	//var staffName = document.getElementById("staffName").value;
	//if(staffName=="")
	//{
	//	alert("厂检员名称不能为空，请输入厂检员名称！");
	//	return;
	//}
	
	var edate1 = document.getElementById("edate1").value;
	var sdate1 =document.getElementById("sdate1").value;
	
	if(sdate1!="" && edate1!=""){	
       if(sdate1>edate1)
     	{
      	alert("开始日期必须小于结束日期！");
      	//document.getElementById("edate1").value="";
	     return;
	   }
    }/* else
    {
    	alert("必须选择开始结束日期！");
		return;
    } */
	inspectorReportForm.genReport.value="Y";
	inspectorReportForm.target = "_blank";
	document.inspectorReportForm.submit();
}

</script>
  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="22" class="table_outline3" valign="bottom" width="100%">
            <div id="toolbar" align="center">
            <script language="javascript">
              //<!--
                CreateToolBar();
              //-->
            </script>
            </div>
            </td>
        </tr>
      </table>
    </td>
  </tr>
</table>