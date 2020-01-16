<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">댓글:</h5>
          <div class="card-body">
            <form name="replyWrite" method="post" 
	action="<c:url value='/freeBoard/reply/replyWrite.do'/>" >
              <div class="form-group">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">작성완료</button>
            </form>
          </div>
        </div>