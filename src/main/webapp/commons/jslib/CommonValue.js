var split_flg = "|";
var File_Separator = "/";
var split_flg2 = ",";

function reloadMenu(obj) {
	var t = $('.J_iframe[data-id="' + $(obj).attr("href") + '"]'), e = t
			.attr("src"), a = layer.load();
	t.attr("src", e).load(function() {
		layer.close(a)
	})
}

function GetQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}

function loadUnitType(url, idStr) {
	$.ajax({
		url : url,
		dataType : 'json',
		data : {},
		type : 'post',
		success : function(data) {
			var options = "<option value=''>请选择</option>";
			$.each(data.unitTypeList, function(key, val) {
				options += '<option value=' + val.id + '>' + val.name
						+ '</option>';
			});
			$('#' + idStr).empty();
			$('#' + idStr).append(options);
		},
		error : function() {

		}
	});
}

function loadUnitGrade(url, idStr) {
	$.ajax({
		url : url,
		dataType : 'json',
		data : {},
		type : 'post',
		success : function(data) {
			var options = "<option value=''>请选择</option>";
			$.each(data.unitGradeList, function(key, val) {
				options += '<option value=' + val.id + '>' + val.name
						+ '</option>';
			});
			$('#' + idStr).empty();
			$('#' + idStr).append(options);

		},
		error : function() {

		}
	});
}
// 单位下拉框
function loadUnit(url, idStr) {
	$.ajax({
		url : url,
		dataType : 'json',
		data : {},
		type : 'post',
		success : function(data) {
			var options = "<option value=''>请选择</option>";
			$.each(data.unitGradeList, function(key, val) {
				options += '<option value=' + val.id + '>' + val.name
						+ '</option>';
			});
			$('#' + idStr).empty();
			$('#' + idStr).append(options);

		},
		error : function() {

		}
	});
}
//省市院校下拉框
function loadCity(url, idStr, pid) {
	$.ajax({
		url : url,
		dataType : 'json',
		async : false,	//同步请求，锁定浏览器，先处理这个请求
		data : {
			parentId : pid
		},
		type : 'post',		//post请求
		success : function(result) {			//请求成功的回调函数
			var options = "<option value=''>请选择</option>";
			if (result.count > 0) {
				$.each(result.CityList, function(key, val) {
					options += '<option value=' + val.areaNumber + '>'
							+ val.name + '</option>';
				});
			}
			$('#' + idStr).empty();
			$('#' + idStr).append(options);
		},
		error : function() {

		}
	});
}

function loadRoleChk(url, idStr) {
	$.ajax({
		url : url,
		dataType : 'json',
		data : {},
		type : 'post',
		success : function(data) {
			var options = "";
			$.each(
				data.roleList,
				function(key, val) {
					options += "<input type='checkbox' class='roles' name='roles' id='"
							+ val.roleCode
							+ "' value='"
							+ val.roleCode
							+ "'>"
							+ val.roleName + "&nbsp;&nbsp;"
				});
			$('#' + idStr).empty();
			$('#' + idStr).html(options);
		},
		error : function() {

		}
	});
}
// 去掉数组中的某个值
function removeByValue(arr, val) {
	for (var i = 0; i < arr.length; i++) {
		if (arr[i] == val) {
			arr.splice(i, 1);
			break;
		}
	}
}

function setIFrameContent(iframeId, value) {
	var doc = document.getElementById(iframeId).contentDocument
			|| document.frames[iframeId].document;
	doc.body.innerHTML = value;

}
