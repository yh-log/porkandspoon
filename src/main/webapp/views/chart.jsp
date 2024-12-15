<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jsTree 스타일시트 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css"/>

	<!-- jQuery와 jsTree 스크립트 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>

</head>
<body>
	<h1>차트</h1>
    <div id="jstree"></div>
	
</body>
<script>
	$(function () {
	    $("#jstree").jstree({
	        core: {
	            themes: {
	                dots: true, // 연결선 비활성화
	            },
	            data: [
	                {
	                    text: "hjlee1", // 상위 1
	                    children: [
	                        {
	                            text: "hjlee2", // 상위 1의 자식, 상위 2
	                            children: [
	                                { text: "2의 자식 1"},
	                                {text : "2의 자식 2"}, 
	                                {text : "2의 자식 3" } // 상위 2의 자식
	                            ],
	                        },
	                        {
	                            text: "추가", // 상위 1의 또 다른 자식
	                        },
	                    ],
	                },
	                {
	                    text: "hj", // 별도 상위 노드
	                },
	            ],
	        },
	        checkbox: {
	            keep_selected_style: false, // 선택된 노드의 스타일을 기본값으로 유지
	        }, 
	        //plugins: ["themes","json_data","ui","types" ]
	       // plugins: ["checkbox"], // 체크박스 플러그인 활성화
	    });
	});
</script>
</html>