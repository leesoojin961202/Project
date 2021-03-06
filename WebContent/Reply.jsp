<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="css_JSP/Reply.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>답변글</title>
<jsp:useBean id="beans" class="Board.BoardBeans" scope="session" />
<script>
	function insertPassword(){
		if(document.replyForm.post_Password.value == ""){
			alert("답변글의 비밀번호를 설정해주세요.");
			document.replyForm.post_Password.focus();
			return ;
		}
	  document.replyForm.submit();
	}
</script>
</head>
<body>
    <table id="read_Table_Head">
     <tr>
        <td>Please write a reply &#128140	</td>
     </tr>
  </table>

  <form name="replyForm" method="post" action="/BoardProject/Board/BoardReply">
      <div id="read_Box">
    		<div id="read_Box_Menu">
             <p>성명 : <input name="writer_Name" value="<%=beans.getWriter_Name() %>" /></p>
        	</div>

          <div id="read_Box_Content">
            <p>제목 : [답변]<input name="writer_Subject" value="&#8627;<%=beans.getWriter_Subject() %>" /></p>

          <div class="readContent">
            <p><%=beans.getWriter_Content() %></p>
          </div>

          <div class="reply_Box">
            <p>답변 :</p>
            <textarea name="writer_Content" rows="8" cols="80"></textarea>
          </div>

          <p>비밀번호 : <input type="password" name="post_Password" /></p>
        </div>

      <div id="read_Box_Bottom">
        <ul>
         <li>
           <input type="button" value="답변 등록" onClick="insertPassword()" />
           <input type="reset" value="다시 쓰기" />
           <input type="button" value="뒤로 가기" onClick="history.go(-1)" />
         </li>
        </ul>
     </div>
   </div>
<%
	String nowPage = request.getParameter("nowPage");
%>
<input type="hidden" name="writer_Ip" value="<%=request.getRemoteAddr() %>" />
<input type="hidden" name="nowPage" value="<%=nowPage %>" />
<input type="hidden" name="reply_Ref" value="<%=beans.getReply_Ref() %>" />
<input type="hidden" name="reply_Pos" value="<%=beans.getReply_Pos() %>" />
<input type="hidden" name="reply_Depth" value="<%=beans.getReply_Depth() %>" />
</form>
</body>
</html>