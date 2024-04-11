function loadTree(url,obj)
	{
	
	var setting = {
			async: {
				enable: true,
				url:url,    
				//autoParam:["id", "name=n", "level=lv"],
				//autoParam: ["tId=parent_id"],
				//otherParam:{"otherParam":"zTreeAsyncTest"},
				dataFilter: filterTree
			},
			edit:{
				enable: false
			},
			view: {
				//addDiyDom: addDiyDom,
				//addHoverDom: addHoverDom,
				//removeHoverDom: removeHoverDom,
				fontCss:setFontCss

			},

			check: {
				enable: true,
				chkStyle: "checkbox",
				chkboxType: { "Y": "s", "N": "ps" }
			},
			callback:{
				onClick: zTreeOnClick,
				onAsyncSuccess: zTreeOnAsyncSuccess
				
			},
			data: {
		simpleData: {
			enable: true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: null,
		}
	}
			
		};
		$.fn.zTree.init(obj, setting);	
}

function loadTree_drop(url,obj)
	{
	
	var setting = {
			async: {
				enable: true,
				url:url,    
				//autoParam:["id", "name=n", "level=lv"],
				//autoParam: ["tId=parent_id"],
				//otherParam:{"otherParam":"zTreeAsyncTest"},
				dataFilter: filterTree
			},
			edit:{
				enable: true,
				showRemoveBtn: false,
				showRenameBtn: false,
				drag: {
					autoExpandTrigger: true,
					prev: false,
					inner: true,
					next: false
				}
			},
			view: {
				//addDiyDom: addDiyDom,
				//addHoverDom: addHoverDom,
				//removeHoverDom: removeHoverDom,
				fontCss:setFontCss

			},

			check: {
				enable: true,
				chkStyle: "checkbox",
				chkboxType: { "Y": "s", "N": "ps" }
			},
			callback:{
				onClick: zTreeOnClick,
				onAsyncSuccess: zTreeOnAsyncSuccess,
				onDrop:zTreeOnDrop,
				beforeDrop: zTreeBeforeDrop
				
			},
			data: {
		simpleData: {
			enable: true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: null,
		}
	}
			
		};
		$.fn.zTree.init(obj, setting);	
}


function loadTree_disCheckEnable(url,obj)
	{
	
	var setting = {
			async: {
				enable: true,
				url:url,    
				//autoParam:["id", "name=n", "level=lv"],
				//autoParam: ["tId=parent_id"],
				//otherParam:{"otherParam":"zTreeAsyncTest"},
				dataFilter: filterTree
			},
			edit:{
				enable: false
			},
			view: {
				//addDiyDom: addDiyDom,
				//addHoverDom: addHoverDom,
				//removeHoverDom: removeHoverDom,
				fontCss:setFontCss

			},

			check: {
				enable: false
			},
			callback:{
				onClick: zTreeOnClick,
				onAsyncSuccess: zTreeOnAsyncSuccess,
				onDrop:zTreeOnDrop,
				beforeDrop: zTreeBeforeDrop
				
			},
			data: {
		simpleData: {
			enable: true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: null,
		}
	}
			
		};
		$.fn.zTree.init(obj, setting);	
}



//是否选中节点
function isSelected(treeName)
{
	var treeObj = $.fn.zTree.getZTreeObj(treeName);
	var nodes = treeObj.getSelectedNodes();
	if(nodes.length>=1)
	{
		return true;
	}else
	{
		return false;
	}
}

//获取被选中的节点
function getSelected(treeName)
{
	var treeObj = $.fn.zTree.getZTreeObj(treeName);
	var nodes = treeObj.getSelectedNodes();
	if(nodes.length>=1)
	{
		return nodes[0];
	}else
	{
		return null;
	}
}

//获取输入框被勾选 或 未勾选的节点集合
function getCheckeds(treeName,state)
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

//刷新树
function refreshTree(treeName)
{
	var treeObj = $.fn.zTree.getZTreeObj(treeName);
	treeObj.refresh();
}

//json解析为对象
function jsonToObj(json)
{
	var obj = eval('(' + json + ')');  
	return obj;
}

function getAllChildrenNodes(treeNode,result){
      if (treeNode.isParent) {
        var childrenNodes = treeNode.children;
        if (childrenNodes) {
            for (var i = 0; i < childrenNodes.length; i++) {
                result += '|' + childrenNodes[i].id;
                result = getAllChildrenNodes(childrenNodes[i], result);
            }
        }
    }
    return result;

}
//设置树的选中节点  树名称 节点
function checkNode(treeName,node)
{
	var treeObj = $.fn.zTree.getZTreeObj(treeName);
	treeObj.checkNode(node, true, true);
}

//获取所有节点
function getAllNodes(treeName)
{
	var treeObj = $.fn.zTree.getZTreeObj(treeName);
	return treeObj.getNodes();
}