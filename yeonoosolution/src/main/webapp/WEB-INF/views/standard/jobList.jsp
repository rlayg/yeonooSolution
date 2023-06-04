<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style type="text/css">
	.jobListContainer{
		width: 100%;
		display: flex;
	}
	.content{
		margin:0 auto;
		width: 75%;
		display: inline-block;
	}
	.side-bar {
	   	width: 200px;
	   	background-color: #f2f2f2;
	   	border: 1px solid #ddd;
	   	padding: 20px;
	   	float: left;
	   	height: auto;
	}
	
	.crudBtn{
	   	display: flex; 
	   	margin-bottom: 50px;
	   	margin-top: 10px;
	}
	.crudBtn button{
	  	width: 70px;
	  	height: 30px;
	  	font-weight: bold;
	  	font-size:13px;
	  	background-color: white;
	  	border: 1px solid #D6DAE2;
	  	outline: none;
	  	border-radius: 5px;
	  	padding: 0 12px;
	  	margin-right: 5px;
	}
	
	#memberSearchBtn{
	  	width: 70px;
	  	height: 32px;
	  	font-weight: bold;
	  	font-size:13px;
	  	background-color: white;
	  	border: 1px solid #D6DAE2;
	  	outline: none;
	  	border-radius: 5px;
	  	padding: 0 12px;
	  	margin-left: 9px;
	}

	.filter {
	  	display: flex;
	  	flex-wrap: wrap;
	  	margin-bottom: 10px;
	}
	
	#filterJobName, #filterMemberName{
	  	height: 32px;
	  	border: 1px solid black;
	  	border-radius: 5px;
	}
	
	.jobTableTitle, .form-data, .tableTitle{
	  	margin-right: 10px;
	  	width: 120px;
	  	height: 2rem;
	  	border: 1px solid black;
	  	display: flex;
	  	justify-content: center; /* 수평 가운데 정렬 */
	  	align-items: center; /* 수직 가운데 정렬 */
	  	border-radius: 5px;
	  	font-weight: bold;
	}
	
	#jobListTable td, th,
	#memberSearchTable td, th{
		margin: auto;
		border : 1px solid black;
		border-collapse: collapse;
		text-align: center;
		padding: 2px;
		
		
	}
	#jobListTable, td, input,
	#memberSearchTable, td, input{
		text-align: center;
		font-size: 16px;
	}
	#jobListTable tr th,
	#memberSearchTable tr th {
		height: 40px;
		background-color: #F6F6F6;
		width: 10px;
	}
	
	#jobListTable input[type="text"]:focus,
	#memberSearchTable input[type="text"]:focus{
	  	border: 1px solid #000; /* 나타낼 border 스타일 설정 */
	 	background-color: white;
	}
	#jobListTable input,
	#memberSearchTable input{
		border: none;
		outline: none;
	}
	
	.jobMember{
	 	margin-top: 20px;
	 	max-width: 500px; 
	}
	
	.rowCount, .tableCheckBox{
		width: 30px;
	}
	.jobListInfo {
	  	margin-top: 10px;
	  	height: auto;
	  	overflow-y: auto;
	  	overflow-x: auto;
	}
	.bg-yellow{
		background-color: #ffffcc;
		width: 200px;
	}
	.bg-gray{
		background-color: #EAEAEA
	}
	#jobListTable tr:hover td ,	
	#jobListTable tr:hover td input	
	{
		background-color: #6799FF;
	}

</style>
</head>
<body>
	<div class = "jobListContainer">
 		<div class="side-bar">
		      <!-- product/ds -->
		      <a href="/product/status/defect">불량현황</a><p>
		      <!-- product/ps -->
		      <a href="/product/status/production">생산현황 검색</a><p>
		      <!-- product/pr -->
		      <!-- product -->
		      <a href="/product/is/item">품목별 재고 현황</a><p>
		      <a href="/product/is/bom">BOM별 재고 현황</a><p>
		      <a href="/product/is/wh">창고별 재고 현황</a><p>
		      <a href="/product/is/wh/">창고별 재고 현황 상세</a><p>
		      <a href="/item/search">제품 검색</a><p>
		      <a href="/product/sim">입고</a><p>
		      <a href="/wo">제품 생산 지시</a><p>
		      
		      <!-- sales -->
		      <a href="/sales/receive-order">수주서 관리</a><p>
		      <a href="/sales/analysis-of-materials">자제요소분석</a><p>
		      <a href="/sales/order">구매</a><p>
		      <a href="/sales/stock-in">구매입고등록</a><p>
		      
		      <!-- standard -->
		      <a href="/standard/login">로그인</a><p>
		      <a href="/standard/user-admin">사용자 계정관리</a><p>
		      <a href="/standard/imi">품목 관리 및 등록</a><p>
		      <a href="/standard/ipi">품목 단가 관리</a><p>
		      <a href="/standard/pmi">품목 관리 정보</a><p>
		      
		              기본정보<p>
 			  <a href="/standard/companyInfo/">회사정보</a><p>
 			  <a href="/standard/customerInfo/">거래처정보</a><p>
 			     사용자관리<p>
 			  <a href="/standard/myPage/">개인정보수정</a><p>
 			  <a href="/standard/dept/">부서등록 및 확인</a><p>
 			  <a href="/standard/job/">직급등록 및 확인</a><p>
		      
		      <!-- 로그아웃 -->
		      <c:if test="${sessionScope.member != null}">
		         <form action="/standard/logout" method="POST">
		            <button type="submit">로그아웃</button>
		         </form>
		      </c:if>
		      
	    </div>
		
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel">신규 직급 입력</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="">
		        	  <div class="mb-3">
			            <label for="modalJobName" class="col-form-label">직급명:</label>
			            <input type="text" class="form-control" id="modalJobName" name="jobName" required="required">
			          </div>
			          <button type="reset" class="btn btn-primary" >초기화</button>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" onclick="insertJobList()">등록</button>
		      </div>
		    </div>
		  </div>
		</div>
		<div class = "content">
			
			<div class = "crudBtn">
				<button id = "searchBtn" onclick="searchJobList()">조회</button>
				<button id = "insertBtn" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">등록</button>
				<button id = "saveBtn" 	 onclick="modifyJobListBtn('1')">저장</button>
				<button id = "deleteBtn" onclick="modifyJobListBtn('2')">삭제</button>
				<button id = "resetBtn"  onclick="resetJobList()">초기화</button>
			</div>
			
			
			<div class = "filter">
	
	 			<div class = "form-data">직급명</div>
	 			
	 			<div class = "form-content">
	 				<input type="text" name="jobName" id ="filterJobName">
	 			</div>
	 			
	 		</div>
		
		
			<div class = "jobList">
				<div class = "jobTableTitle">
					직급 리스트
				</div>
				<div class="jobListInfo">
					<table id="jobListTable">
						<tr>
							<th></th>
	 						<th><input type="checkbox" class="tableCheckBox" id="allCheck" onclick ="checkBoxAllCheck()"></th>	 						
							<th>직급코드</th>
							<th>직급이름</th>
							<th>생성일자</th>
							<th>생성자</th>
							<th>수정일자</th>
							<th>수정자</th>
							<th>사용여부</th>
						</tr>
						<tbody id ="jobTableTbody">
							<c:forEach var ="jobList" items ="${jobDtoList }" varStatus="status">
								<tr onclick="showMemberOfJob(${status.index})">
									<td>
										<input type="text" class="rowCount" value="${status.count }" disabled="disabled">
									</td>
									<td>
										<input type="checkbox" class="tableCheckBox" id="tableCheckBox${status.index }" name="tableCheckBox">
									</td>
									<td class ="bg-gray">
									  	<input type="text" class ="bg-gray"   id="jobCode${status.index }" 	 name="jobCode" value="${jobList.jobCode }" disabled="disabled">
									</td>
									<td class ="bg-yellow">
										<input type="text" class ="bg-yellow" id="jobName${status.index }" 	 name="jobName" value="${jobList.jobName }">
									</td>
									<td class ="bg-yellow">
										<input type="text" class ="bg-yellow" id="regDate${status.index }" 	 name="regDate" value="${jobList.regDate }" disabled="disabled">
									</td>					
									<td class ="bg-yellow">
										<input type="text" class ="bg-yellow" id="regUser${status.index }" 	 name="regUser" value="${jobList.regUser }" disabled="disabled">
									</td>					
									<td class ="bg-yellow">
										<input type="text" class ="bg-yellow" id="updateDate${status.index }" name="updateDate" value="${jobList.updateDate }" disabled="disabled">
									</td>					
									<td class ="bg-yellow">
										<input type="text" class ="bg-yellow" id="updateUser${status.index }" name="updateUser" value="${jobList.updateUser }" disabled="disabled">
									</td>					
									<td class ="bg-gray">
										<input type="text" class ="bg-gray"   id="jobYn${status.index }"  name="jobYn" value="${jobList.jobYn }" disabled="disabled">
									</td>					
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class = "jobMember">
				</div>
			</div>
		</div>
 	</div> 
 	<script type="text/javascript">
 	 // 전부 로딩완료가 되면 실행되게 하기
    $(document).ready(function(){
 	 // 테이블 로우 클릭하면 체크박스가 체크되게 하기
 	 $("table tr").not("tr th").click(function(event){
 		 // 이벤트 버블링 방지. 이거 안하면 이벤트가 겹쳐서 될때가 있고 안될 때가 있음.
 		 // 체크박스를 직접 누를 때 체크가 되는 이벤트와 테이블 로우를 눌렀을 때 체크되는 이벤트가 겹치게 됨.
 		 // stopPropagation()를 이용해서 겹치게 안할 수 있음. 
 		 event.stopPropagation();
 		 
 		 // 클릭한 엘리먼트가 th인 경우 처리하지 않음
 		 // this = $("table tr").not("tr th").click
 		 // this를 했을 때 th가 발견 되는 것이 0개보다 크면 체크하지 말아라
         if ($(this).find('th').length > 0) {
             return false;
         }
 		 
 		 // 클릭 된 로우의 체크박스 체크되게 하기 
 		 // this = $("table tr").not("tr th").click
 		 var checkbox = $(this).find('input[type = "checkbox"]');
 		 
 		 // 체크박스의 체크 상태 변경
 		 // 체크 박스가 체크를 햇을 때  체크가 안되어 있다면 체크를 해줘라 
 		 checkbox.prop('checked', !checkbox.prop('checked'));
 	 });
 	 
 	 // 진짜 체크박스를 클릭하면 체크가 되게
 	 $("table input[type = 'checkbox']").click(function(event){
 		 // 이벤트 중복 금지되게
 		 event.stopPropagation();
 		 
 	 });
 	 
    });
 	
 	// 가장 상단 체크박스 누르면 전부 체크되게 하기
 	function checkBoxAllCheck(){
 		var checkBoxes = document.querySelectorAll("input[name='tableCheckBox']");
 		var allCheck = document.getElementById("allCheck");
 		
 		for(var i = 0; i < checkBoxes.length; i++){
 			// allcheck가 체크가 되면 check박스 전부 체크해라
 			checkBoxes[i].checked = allCheck.checked;
 		} 
 	}
 	
 	function getCheckBoxData(rowIndex, kindNumber){
		var jobCode = $("#jobCode"+rowIndex).val();
		var jobName = $("#jobName"+rowIndex).val();
		var jobYn	 = $("#jobYn"+rowIndex).val();
		var kind 	 = kindNumber;
		
		var checkBoxRowData = {
				jobCode   : jobCode,
				jobName   : jobName,
				jobYn 	  : jobYn,
				kind 	  : kind
		};
		
		return checkBoxRowData;
	}
 	
 	
 	function modifyJobList(kindStatus){
 		var kindNumber = kindStatus;
 		/* if(kindNumber == 1){
 			alert("수정시작");
 		}else{
 			alert("삭제시작");
 		} */
 		
 		// 체크박스가 2개 체크되어있으면 length가 2
 		var checkBoxes = document.querySelectorAll('input[name="tableCheckBox"]:checked');
 		/* console.log("몇개선택함?-> "+ checkBoxes.length); */
 		
 		if(checkBoxes.length == 0){
 			alert("품목을 선택해 주세요");
 		}
 		
 		// for문에서 마지막 for문에서만 alert를 내기 위해 사용
 		var updateCount = 0;
 		
 		for(var i = 0; i<checkBoxes.length; i++){
 			// rowindex는 1부터 시작하므로 -1을 해주어야 ${status.index}와 맞출 수 잇다.
			// 체크 된 체크 박스가 몇번째 테이블 로우 인지 알아내는 법
			var rowIndex = (checkBoxes[i].parentNode.parentNode.rowIndex)-1;
 			/* console.log("로우 인덱스-> "+rowIndex); */
			
 			var jobDto 	= getCheckBoxData(rowIndex, kindNumber);
 			var jobCode	= document.getElementById("jobCode"+rowIndex).value;
 			
 			$.ajax({
 				url 	 : "/standard/job/"+jobCode,
 				dataType : "json",
 				type 	 : "PUT",
 				data	 : jobDto,
 				success	 : data =>{
 					updateCount++;
 					if(updateCount == checkBoxes.length && data === 1 && kindNumber == 1){
						alert("수정되었습니다.")
						location.reload();
					} else if(updateCount == checkBoxes.length && data != 1 && kindNumber == 1){
						alert("수정에 실패하였습니다.")
					}
					if(updateCount == checkBoxes.length && data === 1 && kindNumber == 2){
						alert("삭제되었습니다.")
						location.reload();
					} else if(updateCount == checkBoxes.length && data != 1 && kindNumber == 2){
						alert("삭제 실패하였습니다.")
					}
					location.reload();
 				}
 			});
 		}
 	}
 	
	 // 컨펌을 사용하기 위해 모듈화.
	function modifyJobListBtn(kindStatus){
		// kindStatus 파라미터 1 = 수정
		// kindStatus 파라미터 2 = 삭제
		var result = false;
		
		if(kindStatus == 1){
			result = confirm("수정하시겠습니까?");
			if(result){
				modifyJobList(kindStatus);
			}else{
				return false;
			}
		}else if(kindStatus == 2){
			result = confirm("삭제하시겠습니까?");
			if(result){
				modifyJobList(kindStatus);
			}else{
				return false;
			}
		}
	}
 	
 	
 	function searchJobList(){
 		/* alert("검색시작"); */
 		
 		var jobName = $("#filterjobName").val();
 		alert("jobName ->"+jobName);
 		
 		var html = "";
 		 
 		$.ajax({
 			url : "/standard/job/search/"+jobName,
 			dataType : "json",
 			type : "GET",
 			data : {
 				jobName : jobName
 			},
 			success : function(data){
 				var count = 1;
 				$(data).each(function(index){
 					html += "<tr onclick='showMemberOfJob("+index+")'>";
 					html += "<td><input type='text' name='rn' value ='"+ count++ +"' disabled='disabled'></td>";
 			        html += "<td><input type='checkbox' name='tableCheckBox' id='tableCheckBox"+index+"'></td>";
 			        html += "<td class ='bg-gray'><input type='text class ='bg-gray'' name='jobCode' id='jobCode"+index+"' value='"+this.jobCode+"' disabled='disabled'></td>";
 			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='jobName' id='jobName"+index+"' value='"+this.jobName+"' required='required'></td>";
 			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='regDate' id='regDate"+index+"' value='"+this.regDate+"' required='required'></td>";
 			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='regUser' id='regUser"+index+"' value='"+this.regUser+"' required='required'></td>";
 			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='updateDate' id='updateDate"+index+"' value='"+this.updateDate+"' required='required'></td>";
 			        html += "<td class ='bg-yellow'><input type='text' class ='bg-yellow' name='updateUser' id='updateUser"+index+"' value='"+this.updateUser+"' required='required'></td>";
 			        html += "<td class ='bg-gray'><input type='text class ='bg-gray'' name='jobYn' id='jobYn"+index+"' value='"+this.jobYn+"' disabled='disabled'></td>";
 					html += "</tr>";
 				})
 				$("#jobTableTbody").html(html);
 			}
 		}); 
 	}
 	
 	function resetJobList(){
 		location.reload();
 	}
 	
 	function insertJobList(){
 		var result = confirm("등록하시겠습니까?");
 		
 		if(result){
 			
	 		var jobName = $("#modalJobName").val();
	 		/* console.log("등록할 직급이름-> "+jobName); */
	 		
	 		$.ajax({
	 			url : "/standard/job/"+jobName,
	 			dataType : "json",
	 			type : "POST",
	 			data : {
	 				jobName : jobName
	 			},
	 			success : data =>{
	 				if(data == 1){
	 					alert("등록되었습니다.");
	 				}else if(data == 2){
	 					alert("같은 이름의 부서가 존재합니다.");
	 				}else{
	 					alert("등록에 실패하였습니다.");
	 				}
	 				location.reload();
	 			}
	 		}) 
 		}else{
 			return false;
 		}
 	}
 	
 	function showMemberOfJob(index){
 		var jobCode = $("#jobCode"+index).val();
 		console.log(jobCode);
 		var html = "";
 		
 		$.ajax({
 			url: "/standard/job/member/" + jobCode,
 			dataType : "json",
 			type : "GET",
 			data : {
 				jobCode : jobCode
 			},
 			success : function(data){
 				var count = 1;
 				
 				if(data == null || data.length == 0){
 					html = "데이터가 없습니다."
 				} else {
 					
	 				html += "<div class='filter'>";
	 				html += "<div class='form-data'>직원명</div>";
	 				html += "<div class='form-content'><input type='text' name='memberName' id = 'filterMemberName'>";
	 				html += "<button name='memberSearch' id='memberSearchBtn' onclick='memberSearch(\"" + jobCode + "\",1)'>조회</button></div>";
	 				html += "</div>";
					html += "<table id ='memberSearchTable'>";
					html += "<tr>";
					html += "<th></th>";
					html += "<th>이름</th>";
					html += "<th>이메일</th>";
					html += "<th>부서</th>";
					html += "<th>직급</th>";
					html += "<th>연락처</th>";
					html += "</tr>";
	 				$(data).each(function(){
	 					// 여기부터 tbody
	 					html += "<tr>";
	 					
	 					html += "<td><input type='text' id='rn' name='rn' value='"+ count++ +"' disable='disable'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='memberName' name='memberName' value='"+this.memberName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text  class ='bg-gray'' id='memberId' name='memberId' value='"+this.memberId+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='deptName' name='deptName' value='"+this.deptName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='jobName' name='jobName' value='"+this.jobName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='tel' name='tel' value='"+this.tel+"' disabled='disabled'></td>";
	 					html += "</tr>";
	 					
	 				})
	 				html += "</table>";
 				}
 				$(".jobMember").html(html);
 			}
 		}); 
 	}
 	function memberSearch(ajaxJobCode, kind){
 		/* alert("맴버서치 시작"+ajaxJobCode); */
 		
 		var memberName = $("#filterMemberName").val();
 		var jobCode = ajaxJobCode;
 		/* console.log("검색-> "+memberName);
 		console.log("검색-> "+jobCode);
 		console.log("검색-> "+kind); */
 		
 		var html = "";
 		
 		$.ajax({
 			url: "/standard/job/member/" + jobCode,
 			dataType : "json",
 			type : "GET",
 			data : {
 				jobCode 	: jobCode,
 				memberName 	: memberName,
 				kind		: kind
 			},
 			success : function(data){
 				if(data == null || data.length == 0){
 					html += "데이터가 없습니다."
 				}else{
	 				var count = 1;
	 				html += "<div class='filter'>";
	 				html += "<div class='form-data'>직원명</div>";
	 				html += "<div class='form-content'><input type='text' name='memberName' id = 'filterMemberName'>";
	 				html += "<button name='memberSearch' id='memberSearchBtn' onclick='memberSearch(\"" + jobCode + "\",1)'>조회</button></div>";
	 				html += "</div>";
					html += "<table id ='memberSearchTable'>";
					html += "<tr>";
					html += "<th></th>";
					html += "<th>이름</th>";
					html += "<th>이메일</th>";
					html += "<th>부서</th>";
					html += "<th>직급</th>";
					html += "<th>연락처</th>";
					html += "</tr>";
	 				$(data).each(function(){
	 					// 여기부터 tbody
	 					html += "<tr>";
	 					
	 					html += "<td><input type='text' id='rn' name='rn' value='"+ count++ +"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='memberName' name='memberName' value='"+this.memberName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='memberId' name='memberId' value='"+this.memberId+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='deptName' name='deptName' value='"+this.deptName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='jobName' name='jobName' value='"+this.jobName+"' disabled='disabled'></td>";
	 					html += "<td class ='bg-gray'><input type='text' class ='bg-gray' id='tel' name='tel' value='"+this.tel+"' disabled='disabled'></td>";
	 					html += "</tr>";
	 					
	 				})
	 				html += "</table>";
 				}
 				$(".jobMember").html(html);
 			}
 		}); 
 		
 	}
 	
 	</script>
</body>
</html>