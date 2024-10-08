<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="https://cdn.bootcss.com/noUiSlider/8.5.1/nouislider.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/noUiSlider/8.5.1/nouislider.js"></script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/select2.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/fullcalendar.min.css" />
<%--    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />--%>



<style>
    .subPageContain {
        display: flex;
    }
    .fc .fc-button-group>*{
        /*width: 25px;*/
        /*height: 0px;*/
        padding: 1px 7px;
        /*display: inline-block;*/
        font-size: 15px;
        /*text-align: center;*/
    }
    #calendar {
        width: 300px;
        margin: 0 auto;
        font-size: 10px;
    }
    .fc-today-button {
        content: "이번주";

    }
    .fc-toolbar {
        font-size: 2px;
        width: 350px;
    }
    .fc-toolbar h2 {
        font-size: 12px;
        white-space: normal !important;
    }
    /* click +2 more for popup */
    .fc-more-cell a {
        display: block;
        /*     width: 95%;  */
        margin: 1px auto 0 auto;
        border-radius: 3px;
        background: grey;
        color: transparent;
        overflow: hidden;
        height: 4px;
    }
    .fc-more-popover {
        /*     width: 100px; */
    }
    .fc-view-month .fc-event, .fc-view-agendaWeek .fc-event, .fc-content {
        font-size: 0;
        /*     overflow: hidden; */
        height: 2px;
    }
    .fc-view-agendaWeek .fc-event-vert {
        font-size: 0;
        overflow: hidden;
        width: 2px !important;
    }
    .fc-agenda-axis {
        width: 20px !important;
        font-size: 5px;
    }

    /* .fc-button-content { */
    /*     padding: 0; */
    /* } */
    .fc-content-skeleton table{
        width: 100%;
    }
    .fc-month-view{
        overflow-y: scroll;
    }
    .fc-view-container{
        width: 397px;
    }
    .fc-view{
        overflow: hidden;
        margin-left: 41px;
    }

    .fc-scroller{
        overflow: auto !important;
        height: 250px !important;
    }

    .fc-left{
        margin-left: 41px;
    }

    .highlight{
        background-color: #f8f9fa;
        padding: 20px;
    }
    .highlight pre code {
        font-size: inherit;
        color: #212529;
    }
    .nt {
        color: #2f6f9f;
    }
    .na {
        color: #4f9fcf;
    }
    .s {
        color: #d44950;
    }
    pre.prettyprint {
        background-color: #eee;
        border: 0px;
        margin: 0;
        padding: 20px;
        text-align: left;
    }

    .atv,
    .str {
        color: #05AE0E;
    }

    .tag,
    .pln,
    .kwd {
        color: #3472F7;
    }

    .atn {
        color: #2C93FF;
    }

    .pln {
        color: #333;
    }

    .com {
        color: #999;
    }
    .alignCenter{
        text-align: center;
    }
    #hiddenFillBtn:hover{
        background-color: #ffffff00;
    }
    .subTitleText {
        margin-bottom: 25px;
      }
      .subTitleText h2 {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        font-size: 27px;
        padding: 10px 0;
        font-family: "Noto Sans KR", sans-serif;
      }
      .subTitleText i {
        font-size: 24px;
        margin-right: 5px;
      }
</style>
</head>


<body>
<!-- 헤더인클루드 -->
<%@ include file="../include/header.jsp"%>

<section class="subPageContain">


    <!-- 사이드바 -->
    <%@ include file="./sideBar.jsp"%>



<%--메인 컨텐츠--%>
    <div id="main-content" class="contentConteiner">

    <div class="clearfix">
        <div class="subTitleText">
            <!--컨텐츠 부분 타이틀 클래스(이건 부트스트랩 클래스 아니고 임의로 만든 클래스)-->
            <h2>
              <i class="fa-solid fa-angles-right"></i>
              <!--왼쪽 아이콘 폰트어썸-->회의실예약
            </h2>
        </div>
    </div>

    <div class="container-fluid">
        <!--             <div class="block-header"> -->
        <!--                 <div class="row"> -->
        <!--                     <div class="col-lg-5 col-md-8 col-sm-12">                         -->
        <!--                         <h2 class="class2" style="font-family: S-CoreDream-6Bold; font-size: 30px;"><a href="#" class="btn btn-xs btn-link btn-toggle-fullwidth"></a><i class="icon-home"></i>&nbsp; 예약 </h2> -->
        <!--                     </div>             -->
        <!--                     <div class="col-lg-7 col-md-4 col-sm-12 text-right"> -->
        <!--                          <h4>빈칸은 허전해</h4> -->
        <!--                     </div> -->
        <!--                 </div> -->
        <!--             </div> -->

        <div class="row clearfix">
            <div class="col-lg-8 col-md-12 left-box">
                <div class="card single_post ">
                    <div class="body">
                        <div style="padding-bottom: 40px;">
                            <div class="header text-center" style="padding:15px; margin-bottom: 15px; border-bottom:1px solid rgba(0,0,0,.125);">
                                <h5 style="text-align: center; margin-bottom: 0;">회의실 예약</h5>
                            </div>
                            <div style="display: flex;">
                                <div class="col-md-6 ">
                                    <div id="calendar" style="margin: 0; padding: 0; font-family: GoyangDeogyang" class="fc fc-unthemed fc-ltr">
                                        <!-- 일단 그냥 넣어놓은 달력 -->
                                    </div>
                                </div>
                                <h4 id="guide" style="margin: 0;font-family: S-CoreDream-6Bold;font-size:1.3em;">* 달력에서 원하는 날짜를 선택해주세요</h4>
                                <div class="col-md-6 " id="availableTime" style="display: none; font-family: S-CoreDream-4Regular">
                                    <h4>선택 날짜</h4>
                                    <h3 style="margin-left: 10px" id="selectDate"></h3>
                                    <hr>
                                    <br>
                                    <h4>시간 선택</h4>
                                    <div class="row ">
                                        <div id="slider-margin" class="col-md-10 "></div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h3>시작시간</h3><div id="slider-margin-value-min" class="" style="font-size: x-large; padding-left: 47px;"></div>
                                        </div>
                                        <div class="col-md-6">
                                            <h3>종료시간</h3><div id="slider-margin-value-max" class="" style="font-size: x-large; padding-left: 37px;"></div>
                                        </div>
                                    </div>
                                    <br>
                                    <button type="button" onclick="searchRoom();" class="btn btn-block btn-primary" style="width: 400px; font-family: S-CoreDream-6Bold; ">회의실 조회</button>
                                </div>
                                <hr>
                            </div>
                            <div style="display: none;" id="searchAvailableRoom">
                                <div style="display: flex;justify-content: center;align-items: center; margin-top: 30px;">
                                    <div class="header cl-md-8">
                                        <h4 style="font-family: S-CoreDream-4Regular">사용 가능한 회의실을 확인해주세요.</h4>
                                    </div>
                                    <div class="header cl-md-4" >
                                        <section>
                                            <select id="availableRoom" name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-control" style="width: 340px; margin-left: 100px;">
                                            </select>
                                        </section>
                                    </div>
                                </div>
                            </div>
                            <div id="infoOfRoom" style="display: none;">
                                <div style="padding: 46px 46px 0;">
                                    <div class="header" >
                                        <h4 id="roomName"></h4>
                                    </div>
                                    <div class="body">
                                        <div class="comment-form">
                                            <form class="row clearfix">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <ul class="comment-reply list-unstyled">
                                                            <li class="row clearfix">
                                                                <div class="icon-box col-md-6 col-4" id="roomImg" >
                                                                    <!-- 						                                        사진 들어가는 곳 -->
                                                                </div>
                                                                <div class="text-box col-md-6 col-8 p-l-0 p-r0">
                                                                    <h3 >회의실 정보</h3>
                                                                    <h4 id="roomCapacity" class="m-b-0"></h4>
                                                                    <ul class="list-inline" id="roomContent">
        
        
                                                                    </ul>
                                                                    <p style="margin-bottom: 0px; color: red; font-size: 15px;">*회의실 사용 목적을 적으시오</p>
                                                                    <input type="text" class="form-control" placeholder="회의실 사용 목적을 작성하시오" id="roomReason">
                                                                    <div style="margin-top: 15px;">
                                                                        <button type="button" onclick="makeReservation();" class="btn btn-block btn-primary">예&nbsp;&nbsp;약&nbsp;&nbsp;&nbsp;&nbsp; 하&nbsp;&nbsp;기</button>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <div class="body">
                        
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 right-box">
                <div class="card" style="padding: 5px 15px;">
                    <h3 style="margin-top: 10px; font-size: 22px;">내 예약</h3>
                    <div class="body" style="font-family: S-CoreDream-6Bold">
                        <div class="table-responsive" style="overflow-x: hidden;">
                            <table class="table table-hover m-b-0 c_list">
                                <thead>
                                <tr>
                                    <th>이름</th>
                                    <th>호실</th>
                                    <th>예약시간</th>
                                </tr>
                                </thead>
                                <tbody style="cursor: pointer;">
                                <c:set value="0" var="index"/>
                                <c:forEach items="${myReservationList}" var="my" varStatus="status">
                                    <c:if test="${my.reservation_Date eq compareDate}">
                                        <c:if test="${index <4 }">
                                            <c:set value="${index+1 }" var="index"/>
                                            <tr role="row" class="odd" onclick="location.href='<%=request.getContextPath()%>/reservation/reservationDetail?meet_Room_Reservation_Id=${my.meet_Room_Reservation_Id}', 'WorkConGW', 1000, 700;">
                                                <td>${my.meet_Room_Name }</td>
                                                <td><span style="text-overflow: ellipsis;">${my.meet_Room_No }</span></td>
                                                <td>${my.reservation_Date } / ${my.reservation_Start_Time }시 ~ ${my.reservation_End_Time }시 &nbsp;&nbsp;<span class="btn btn-outline-danger" style="padding: 0px 3px;margin-left:5px;">오늘</span></td>
                                            </tr>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                                <c:forEach  items="${myReservationList  }" var="my" varStatus="status">
                                    <c:if test="${my.reservation_Date ne compareDate}">
                                        <c:if test="${index <4 }">
                                            <c:set value="${index+1 }" var="index"/>
                                            <tr role="row" class="odd" onclick="location.href='<%=request.getContextPath()%>/reservation/reservationDetail?meet_Room_Reservation_Id=${my.meet_Room_Reservation_Id}', 'WorkConGW', 1000, 700;">
                                                <td>${my.meet_Room_Name }</td>
                                                <td><span style="text-overflow: ellipsis;">${my.meet_Room_No }</span></td>
                                                <td>${my.reservation_Date } / ${my.reservation_Start_Time }시 ~ ${my.reservation_End_Time }시</td>
                                            </tr>
                                        </c:if>
                                    </c:if>
                                </c:forEach>




<%--                                 		                                    <c:forEach items="${myReservationList}" var="my" varStatus="status">--%>
<%--                                 		                                    	<c:if test="${status.count <5}">--%>
<%--                                 		                                    	 <tr role="row" class="odd" onclick="OpenWindow('<%=request.getContextPath()%>/reservation/reservationDetail?meetRoomVO.meet_Room_Reservation_Id=${my.meet_Room_Reservation_Id}', 'JoinWorkGW', 1000, 700);">--%>
<%--                                 		                                            <td>${my.meet_Room_Name }</td>--%>
<%--                                 		                                            <td><span style="text-overflow: ellipsis;">${my.meet_Room_No }</span></td>--%>
<%--                                 		                                            <td>${my.reservation_Date } / ${my.reservation_Start_Time }시 ~ ${my.reservation_End_Time }시</td>--%>
<%--&lt;%&ndash;                                <!-- 		                                    	 </tr> -->&ndash;%&gt;--%>
<%--                                 		                                    	</c:if>--%>
<%--                                 		                                    </c:forEach>--%>
                                <c:if test="${empty myReservationList}">
                                    <tr>
                                        <td colspan="6" style="text-align: center;"><strong>예약이 존재하지 않습니다.</strong></td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="card" style="padding: 5px 15px;">
                    <h4 style="margin-top: 10px; font-size: 22px;">팀 예약</h4>
                    <div class="body" style="font-family: S-CoreDream-6Bold">
                        <div class="table-responsive" style="overflow-x: hidden;">
                            <table class="table table-hover m-b-0 c_list">
                                <thead>
                                <tr>
                                    <th>회의실</th>
                                    <th>예약자</th>
                                    <th>예약시간</th>
                                </tr>
                                </thead>
                                <tbody style="cursor: pointer;">
                                <c:forEach items="${deptReservationList  }" var="deptReservation" varStatus="status">
                                    <c:if test="${status.count <5}">
                                        <tr role="row" class="odd" onclick="location.href='<%=request.getContextPath()%>/reservation/reservationDetail?meet_Room_Reservation_Id=${deptReservation.meet_Room_Reservation_Id}', 'WorkConGW', 1000, 700;">
                                            <td style="width: 115px;">${deptReservation.meet_Room_Name }<br/>(${deptReservation.meet_Room_No})</td>
                                            <td><span style="text-overflow: ellipsis;">${deptReservation.emp_Name }</span><span class="badge badge-danger">${deptReservation.dept_Name }</span></td>
                                            <td style="width: 205px;">${deptReservation.reservation_Date } / ${deptReservation.reservation_Start_Time }시 ~ ${deptReservation.reservation_End_Time }시</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${empty deptReservationList}">
                                    <tr>
                                        <td colspan="6" style="text-align: center;"><strong>예약이  존재하지 않습니다.</strong></td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="body" style="padding: 5px 15px;">
                        <h4 style="margin-top: 10px; font-size: 22px;">공지사항</h4>
                        <div class="body" style="font-family: S-CoreDream-6Bold">
                            <div class="table-responsive" style="overflow-x: hidden;">
                                <table class="table table-hover m-b-0 c_list">
                                    <thead>
                                    <tr>
                                        <th>날짜</th>
                                        <th>제목</th>
                                    </tr>
                                    </thead>
                                    <tbody style="cursor: pointer;">
                                    <c:forEach items="${reservationNoticeList}" var="notice" varStatus="status">
                                        <c:if test="${status.count <5}">
                                            <tr role="row" class="odd" onclick="location.href='<%=request.getContextPath()%>/reservation/reservationNoticeDetail?reservation_Notice_Id=${notice.reservation_Notice_Id}', 'WorkConGW', 1000, 700;">
                                                <td>${notice.reservation_Notice_Create_Date }</td>
                                                <td>${notice.reservation_Notice_Title }</td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${empty reservationNoticeList}">
                                        <tr>
                                            <td colspan="6" style="text-align: center;"><strong>공지가  존재하지 않습니다.</strong></td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card" style="padding: 5px 15px;">
                    <%--@elvariable id="meetRoomFormVO" type="MeetRooMFormVO"--%>
                    <form:form modelAttribute="meetRoomFormVO" name="complainModifyForm" action="${pageContext.request.contextPath}/reservation/registComplain" enctype="multipart/form-data">
                        <form:hidden path="reservationComplainVO.complain_Create_Date" id="dateComplain"/>
                        <form:hidden path="reservationComplainVO.emp_Id" value="${loginUser.emp_Id }"/>
                        <p style="display: none;" id="dateComplain"></p>
                        <div class="header" style="padding-top: 0px; padding-bottom: 0px; ">
                            <h4 style="margin-top: 10px; font-size: 22px; padding: 0;">
                                회의실 민원함
                            </h4>
                            <span style="font-size: 13px; margin-bottom: 15px; display: inline-block;">*회의실 관련 이슈를 적어주시면 개선에 최선을 다하겠습니다</span>
                        </div>
                        <div class="form-group body widget newsletter" style="padding-top: 0px;padding-bottom: 0px;margin-bottom: 0px; font-family: S-CoreDream-6Bold" >
                            <form:select path="reservationComplainVO.meet_Room_Id" class="form-control show-tick" >
                                <option value="default">회의실 선택</option>
                                <c:forEach items="${allRoomList}" var="listRoom">
                                    <option value="${listRoom.meet_Room_Id}">${listRoom.meet_Room_Name}(${listRoom.meet_Room_No})</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="body widget newsletter" style="padding-top: 5px; font-family: S-CoreDream-6Bold">
                            <div class="input-group">
<%--                                    <input type="text" class="form-control" placeholder="이슈 사항을 적어주세요">--%>
                                <form:input  path="reservationComplainVO.complain_Content"  class="form-control" placeholder="이슈 사항을 적어주세요"/>
                                <div class="input-group-append">
                                    <form:button class="btn btn-primary">전송</form:button>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>

    </div>
</div>
</section>




<!-- 스케줄러 -->

    <script src="<%=request.getContextPath() %>/resources/vendor/js/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/vendor/js/fullcalendar.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/vendor/js/ko.js"></script>
<script src="<%=request.getContextPath() %>/resources/vendor/js/select2.min.js"></script>
<%--<script src="<%=request.getContextPath() %>/resources/vendor/js/bootstrap-datetimepicker.min.js"></script>--%>
<%--<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>--%>
<script src="<%=request.getContextPath() %>/resources/js/addEvent.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/etcSetting.js"></script>

<script>


    <%--let imageURL = "<%=request.getContextPath()%>/pds/Sign/${}--%>

    var calendar = $('#calendar').fullCalendar({
        locale                    : 'ko',
        timezone                  : "local",
        nextDayThreshold          : "09:00:00",
        allDaySlot                : false,
        displayEventTime          : true,
        displayEventEnd           : true,
        firstDay                  : 0, //월요일이 먼저 오게 하려면 1
        weekNumbers               : false,
        selectable                : false,
        weekNumberCalculation     : "ISO",
        eventLimit                : true,
        views                     : {
            month : { eventLimit : 12 } // 한 날짜에 최대 이벤트 12개, 나머지는 + 처리됨
        },
        eventLimitClick           : 'week', //popover
        navLinks                  : true,
        defaultDate               : moment(),
        timeFormat                : 'HH:mm',
        defaultTimedEventDuration : '01:00:00',
        editable                  : true,
        minTime                   : '00:00:00',
        maxTime                   : '24:00:00',
        slotLabelFormat           : 'HH:mm',
        weekends                  : true,
        nowIndicator              : true,
        dayPopoverFormat          : 'MM/DD dddd',
        longPressDelay            : 0,
        eventLongPressDelay       : 0,
        selectLongPressDelay      : 0,
        dayClick: false,
        header: {
            left: 'prev,today,next'
            ,center: ''
            ,right: 'title'
        },

        eventAfterRender: function () {
            // add titles to "+# more links"
            $('.fc-more-cell a').each(function () {
                this.title = this.textContent;
            });
        },

        // add event name to title attribute on mouseover
        eventMouseover: function (event, jsEvent, view) {
            if (view.name !== 'agendaDay') {
                $(jsEvent.target).attr('title', event.title);
            }
        },
        eventClick:function(e){
            alert(e.title+" "+e.url);
        },
        editable: false,
        eventLimit: true, // allow "more" link when too many events

    });




    // 날짜 선택 불가능   selectDate
    $(".fc-day-number").removeAttr("data-goto");
    $(".fc-prev-button").click(function(){
        $(".fc-day-number").removeAttr("data-goto");
    });
    $(".fc-today-button").click(function(){
        $(".fc-day-number").removeAttr("data-goto");
    });
    $(".fc-next-button").click(function(){
        $(".fc-day-number").removeAttr("data-goto");
    });

    //날짜 클릭시 이벤트
    $(document).on("click",".fc-day-top",function(){
        var $date = $(this);
        var clickDate = $date.attr("data-date");
        insertDayName($date.attr("data-date"));

        //시간입력해주기
        changeDate(clickDate);

        return;
        $.ajax({
            type:"POST",
            url:"<c:url value='getScheduleList' />",
            contentType:"application/json",
            async: false,
            data: clickDate,
            processData:true,
            success: function(data) {
                var scheduleList1 = data.scheduleList1;
                var scheduleList2 = data.scheduleList2;
                var scheduleList3 = data.scheduleList3;
                var str1 = "";
                var str2 = "";
                var str3 = "";
                if(scheduleList1.length > 0){
                    for(var i = 0; i < scheduleList1.length; i++){
                        str1 += "<div><strong style='display: inline-block;font-weight: bold;max-width: 240px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;'><i class='fa fa-check-circle'></i>"+scheduleList1[i].scheduleTitle+"</strong><br><span>"+scheduleList1[i].scheduleStartDt+" ~ "+scheduleList1[i].scheduleEndDt+"</span><br></div>";
                    }
                }else{
                    str1 = '<tr><td colspan="6" style="text-align: center;"><strong>해당 일정이 존재하지 않습니다.</strong></td></tr>';
                }

                if(scheduleList2.length > 0){
                    for(var i = 0; i < scheduleList2.length; i++){
                        str2 += "<div><strong style='display: inline-block;font-weight: bold;max-width: 240px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;'><i class='fa fa-check-circle'></i>"+scheduleList2[i].scheduleTitle+"</strong><br><span>"+scheduleList2[i].scheduleStartDt+" ~ "+scheduleList2[i].scheduleEndDt+"</span><br></div>";
                    }
                }else{
                    str2 = '<tr><td colspan="6" style="text-align: center;"><strong>해당 일정이 존재하지 않습니다.</strong></td></tr>';
                }

                if(scheduleList3.length > 0){
                    for(var i = 0; i < scheduleList3.length; i++){
                        str3 += "<div><strong style='display: inline-block;font-weight: bold;max-width: 240px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;'><i class='fa fa-check-circle'></i>"+scheduleList3[i].scheduleTitle+"</strong><br><span>"+scheduleList3[i].scheduleStartDt+" ~ "+scheduleList3[i].scheduleEndDt+"</span><br></div>";
                    }
                }else{
                    str3 = '<tr><td colspan="6" style="text-align: center;"><strong>해당 일정이 존재하지 않습니다.</strong></td></tr>';
                }
                $(".scheduleList1").html(str1);
                $(".scheduleList2").html(str2);
                $(".scheduleList3").html(str3);
            }

        });
    })




    insertDayName();
    function insertDayName(date){
        var week = new Array('일', '월', '화', '수', '목', '금', '토');
        var today;
        var year;
        var month;
        var day;
        var dayName;

        //처음 로딩시
        if(!date){
            today = new Date();
            day = today.getDate();
            dayName = week[today.getDay()];

            $(".oneDate").html(day);
            $(".oneDayName").html(dayName);

            today.setDate(today.getDate() + 1);
            day = today.getDate();
            dayName = week[today.getDay()];
            $(".twoDate").html(day);
            $(".twoDayName").html(dayName);

            today.setDate(today.getDate() + 1);
            day = today.getDate();
            dayName = week[today.getDay()];
            $(".threeDate").html(day);
            $(".threeDayName").html(dayName);
        }else{
            //일정 클릭시
            today = new Date(date);
            day = today.getDate();
            dayName = week[today.getDay()];

            $(".oneDate").html(day);
            $(".oneDayName").html(dayName);

// 		today.setDate(today.getDate() + 1);
            day = today.getDate();
            dayName = week[today.getDay()];
            $(".twoDate").html(day);
            $(".twoDayName").html(dayName);

            today.setDate(today.getDate() + 1);
            day = today.getDate();
            dayName = week[today.getDay()];
            $(".threeDate").html(day);
            $(".threeDayName").html(dayName);
        }

    }


    //월별 일정 갯수를 가져와주는 함수
    countMonthSchedule();
    function countMonthSchedule(){
        var dayLength = $(".fc-day-top").length;
    }




    //선택 된 날을 변경해준다
    function changeDate(clickDate) {
        var innerDate = clickDate;
        $('#guide').text('');
        $('#selectDate').text(clickDate);
        $('#availableTime').fadeIn( 250 ).show();
    }

    function clearList() {
        // 목록을 초기화하는 코드 작성
        //조회버튼을 클릭하면 초기화하고 다시 보여주기위한 함수
        $('#availableRoom').empty(); // 예시로 목록을 비우는 코드

    }

    function searchRoom() {
        clearList();
        let data = new Object();
        data.reservation_Date = $('#selectDate').text();
        data.reservation_Start_Time = $('#slider-margin-value-min').text();
        data.reservation_End_Time = $('#slider-margin-value-max').text();

        // let reservationDate = {
        //     reservation_Date : $('#selectDate').text()
        //     ,reservation_Start_Time : $('#slider-margin-value-min').text()
        //     ,reservation_End_Time : $('#slider-margin-value-max').text();
        // };
            console.log(JSON.stringify(data))
        $.ajax({
            type:"POST",
            url:"<c:url value='/reservation/searchRoom'/>",
            data: JSON.stringify(data),
            dataType: "json",
            contentType:"application/json;charset=utf-8",
            success: function(list) {
                showAvailableRoom (list)
            }
        });

        $('#searchAvailableRoom').fadeIn( 250 ).show();


    }

    //옵션바 검색 결과로 변견해주기
    function showAvailableRoom (list) {
        var listOfRoom = list;

        // $('#availableRoom').empty();
        for (var count = 0; count < listOfRoom.length; count++) {
            var roomId = listOfRoom[count].meet_Room_Id;
            var option = $("<option value ='"+roomId+"'>" + listOfRoom[count].meet_Room_Name +"("+listOfRoom[count].meet_Room_Capacity+"인)"+ "</option>");
            $('#availableRoom').append(option);
        }

    };
    //민원 옵션바 검색 결과로 변견해주기
    // function showComplainRoom () {
    // 	var listOfRoom

    //         $('#availableRoom').empty();
    //         for (var count = 0; count < listOfRoom.length; count++) {
    //         	var roomId = listOfRoom[count].meetRoomId;
    //             var option = $("<option value ='"+roomId+"'>" + listOfRoom[count].meetRoomName +"("+listOfRoom[count].meetRoomCapacity+"인)"+ "</option>");
    //             $('#avail ableRoom').append(option);
    //         }
    // };


    //roomId를 가지고 방정보를 가져온다
    $("select[id=availableRoom]").change(function(){ //변경 이벤트가 발생하면 실행
        var meet_Room_Id = $(this).val();
        var allData = { "meet_Room_Id": meet_Room_Id };

        $.ajax({
            type:"GET",
            url:"<c:url value='/reservation/searchRoomInfo?meet_Room_id='/>"+meet_Room_Id,
            data: allData,
            success: function(room) {
                console.log(room);
                $('#roomName').text(room.meet_Room_Name);
                $('#roomCapacity').text("정원 : "+room.meet_Room_Capacity+"명");
                makeContent(room.meet_Room_Content);
                makeImage(room.meet_Room_Attach_Origin);
                $('#infoOfRoom').fadeIn( 250 ).show();
            }
        });

    });

    function makeContent(str) {
        var content = str.split('/');
        var ulList = $("#roomContent");
        ulList.empty();
        for (var i = 0; i < content.length; i++) {
            ulList.append("<li><p>"+content[i]+"</p></li>"); //ul_list안쪽에 li추가
        }
    }
    function makeImage(str) {
        var image =  $("#roomImg");
        image.empty();
        image.append("<img class='img-fluid img-thumbnail' alt='Awesome Image' src='getPicture?picture="+str+"' style='width: 400px; height: 300px;' >");
    }

    //최종 예약을 해주는 함수
    function makeReservation() {
        var data = new Object();
        data.reservation_Date = $('#selectDate').text();
        data.reservation_Start_Time = $('#slider-margin-value-min').text();
        data.reservation_End_Time = $('#slider-margin-value-max').text();
        data.meet_Room_Detail = $('#roomReason').val();
        data.meet_Room_Id = $('#availableRoom').val();

        console.log(data.meet_Room_Detail);
        console.log(JSON.stringify(data));
        if(!data.meet_Room_Detail){
            alert('회의실 사용 목적을 입력해주세요.');
            return;
        }

        if(confirm('신청하신 날짜 : '+data.reservation_Date+' 시간 : '+data.reservation_Start_Time+'시 부터'+data.reservation_End_Time+'시 까지 예약을 진행 하시겠습니까?')){
            console.log("ajax호출")
            $.ajax({
                type:"POST",
                url:"<c:url value='/reservation/makeReservation' />",
                contentType:"application/json",
                data: JSON.stringify(data),
                success: function(list) {
                    console.log("헤헤헤헤");
                    if(confirm('예약이 등록 되었습니다. 목록페이지로 가시겠습니까?')){
                        location.href="<c:url value='/reservation/reservationList' />";
                    }else {
                        location.href="<c:url value='/reservation/main' />";
                    }
                },
                error:function(){
                    alert('서버 장애가 발생하였습니다. 다시 시도해주세요.');
                }
            });
        }else {
            alert('예약이 취소됩니다');
        }
    }



    //시간 선택을 해주는 메서드
    var marginSlider = document.getElementById('slider-margin');

    noUiSlider.create(marginSlider, {
        start: [8, 22],
        margin: 1,
        range: {
            'min': 8,
            'max': 22
        }
    });


    //변경되는 값을 실시간으로 변경해준다
    var marginMin = document.getElementById('slider-margin-value-min'),
        marginMax = document.getElementById('slider-margin-value-max');

    marginSlider.noUiSlider.on('update', function (values, handle) {
        if (handle) {
            var max = values[handle];
            max = Math.floor(max);
            marginMax.innerHTML = max;
        } else {
            var min = values[handle];
            min = Math.floor(min);
            marginMin.innerHTML = min;
        }
    });
    </script>


<script>
    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    var day = today.getDate();
    var format = year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+day.toString()).slice(-2));
    $('#dateComplain').text(format);
    $('#dateComplain').val(format);
</script>

<script>
window.onload = function(){
        var navBar = $('.reservationHome');
        navBar.addClass('active');
    }
</script>


</body>

</html>