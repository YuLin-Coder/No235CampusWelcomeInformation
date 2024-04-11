var setting = {
			check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
			},
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: beforeClick,
				onCheck: onCheck
			}
		};
		
		
function beforeClick(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}
		
		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#protocolTypeSel");
			cityObj.attr("value", v);
		}
		function showMenu() {
			var cityObj = $("#protocolTypeSel");
			var cityOffset = $("#protocolTypeSel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "protocolTypeSel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
		
		
//获取输入框被勾选 或 未勾选的节点集合
function getChecked(treeName,state)
{
	var treeObj = $.fn.zTree.getZTreeObj(treeName);
	var nodes = treeObj.getCheckedNodes(state);
	if(nodes.length>=1)
	{
		return nodes;
	}else
	{
		return null;
	}
}
		
		
		
function loadProtocolTypeRadio(url)
{
	$.ajax({
       				url:url,	
       				dataType:'json',
       				data:{
       				},
       				type:'post',
       				success:function(data){

       					$.fn.zTree.init($("#treeDemo"), setting, data.zNodes);

       				},
       				error:function(){
       					$.messager.alert('系统提示','抱歉，数据加载失败。','info'); 
       				}
       	});
}