<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>휴점 등록</title>
    <!-- 부트스트랩 -->
    <link rel="shortcut icon"
          href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
    <link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">

    <link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
    <link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
    <link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
    <link rel="stylesheet" href="/resources/css/common.css">

    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">

    <style >

        .tit-area{
            display: flex;
        }

        td div.inline-layout{
            display: flex;
            align-items: center;
            flex-wrap: nowrap;
            white-space: nowrap;
            gap: 10px;
        }

        .required-value{
            color: var(--bs-danger);
        }

        .dateFont{
            font-weight: 600;
        }

        td div input[type="date"]{
            width: 150px;
        }

        #home, #schedule{
            width: 200px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        #nameTableTd{
            float: left;
            margin-left: 10px;
        }

        #createrOpenBtn{
            float: left;
        }

    </style>
</head>

<body>
<!-- 부트스트랩 -->
<script src="/resources/assets/static/js/initTheme.js"></script>
<div id="app">

    <!-- 사이드바 -->
    <jsp:include page="../sidebar.jsp" />

    <div id="main">
        <!-- 헤더 -->
        <jsp:include page="../header.jsp" />

        <div class="page-content">
            <section id="menu">
                <h4 class="menu-title">매장관리</h4>
                <ul>
                    <li id="firstMenu" ><a href="/us/spotManage">매장관리 홈</a></li>
                    <li id="secondMenu"  ><a href="/us/partSchedule">스케줄 관리</a></li>
                    <li id="secondMendu"><a href="/us/part">아르바이트 관리</a></li>
                    <li id="secondMenud" class="active"><a href="/us/rest/listView">휴점</a></li>
                </ul>
            </section>
            <section class="cont">
                <div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
                <div class="tit-area">
                    <h5>휴점 등록</h5>
                </div>
                <div class="cont-body">
                    <div class="row">
                        <div class="col-12 col-lg-12">
                            <form>
                                <input type="hidden" name="username" value="${username}"/>
                                <input type="hidden" name="creater" value="${getRest.creater}"/>
                                <input type="hidden" name="rest_idx" value="${getRest.rest_idx}"/>
                                <input type="hidden" name="board_idx" value="${getRest.board_idx}">
                                <input type="hidden" name="schedule_idx" value="${getRest.schedule_idx}"/>
                                <input type="hidden" name="id" value="${getRest.id}"/>
                                <table>
                                    <tr class="table-sun" id="user-name-insert">
                                        <th>작성자</th>
                                        <td colspan="3" id="nameTableTd">${getRest.username} ${getRest.position}</td>
                                    </tr>
                                    <tr class="table-sun">
                                        <th>휴점명</th>
                                        <td colspan="3" style="float:left; margin-left: 10px;">${getRest.subject}</td>
                                    </tr>
                                    <tr>
                                        <th>브랜드</th>
                                        <td>${getRest.dept_name}</td>
                                        <th>직영점 명</th>
                                        <td>
                                            ${getRest.store_name}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="table-text table-text-text" style="vertical-align: top;">휴점일정</th>
                                        <td colspan="3">
                                            <div class="inline-layout">
                                                <span class="dateFont">시작일</span>${getRest.start_date} <span class="dateFont"> ~ </span>
                                                <span class="dateFont">종료일</span>${getRest.end_date}
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <div class="editor-area">
                                                ${getRest.content}
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>

                        <div id="createrOpenBtn">
                            <button type="button" class="btn btn-primary btn-write" onclick="location.href='/us/rest/update/${getRest.rest_idx}'">수정</button>
                            <button type="button" class="btn btn-outline-secondary" onclick="layerPopup('휴점 정보를 삭제하시겠습니까?','확인','취소', restDelete, removeAlert)">삭제</button>
                            <button type="button" class="btn btn-outline-primary btn-delete" style="float:right;" onclick="location.href='/us/rest/listView'">목록</button>
                        </div>


                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
</body>


<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>

<script src='/resources/js/textEaditor.js'></script>
<script src='/resources/js/common.js'></script>

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>

    function restDelete(){

        var rest_idx = $('input[name="rest_idx"]').val();
        var board_idx = $('input[name="board_idx"]').val();
        var schedule_idx = $('input[name="schedule_idx"]').val();
        var username = $('input[name="username"]').val();
        var id = $('input[name="id"]').val();


        var restDTO = {'rest_idx' : rest_idx,
                        'board_idx': board_idx,
                        'schedule_idx': schedule_idx,
                        'username': username,
                        'id' : id};

        httpAjax('DELETE', '/us/rest/delete', restDTO);

    }

    function httpSuccess(response){
        console.log(response);
        removeAlert();
        if(response.status === 200){
            layerPopup(response.message, "확인", false, function() {
                location.href = '/us/rest/listView';
            });
        }
    }

</script>

</html>