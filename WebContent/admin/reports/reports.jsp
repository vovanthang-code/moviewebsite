<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col ml-4">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="videoEditing-tab" data-toggle="tab"
			href="#videoEditing" role="tab" aria-controls="videoEditing"
			aria-selected="true">Favorites</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="videolist-tab" data-toggle="tab" href="#videolist" role="tab"
			aria-controls="videolist" aria-selected="false">Favorite User</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="shareFriends-tab" data-toggle="tab" href="#shareFriends"
			role="tab" aria-controls="shareFriends" aria-selected="false">Share
				friends</a></li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<!-- Tab1 -->
		<div class="tab-pane fade show active" id="videoEditing"
			role="tabpanel" aria-labelledby="videoEditing-tab">
			<table class="table table-bordered mt-3">
				<tr>
					<td>Video Title</td>
					<td>Favorites Count</td>
					<td>Lasted Date</td>
					<td>Oldest Date</td>
				</tr>
				<c:forEach var="item" items="${favList }">
				<tr>
					<td>${item.videoTitle }</td>
					<td>${item.favoriteCount }</td>
					<td>${item.newestDate }</td>
					<td>${item.oldestDate }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<!-- Tab2 -->
		<div class="tab-pane fade" id="videolist" role="tabpanel"
			aria-labelledby="videolist-tab">
			<form action="" method="post">
				<div class="row mt-3">
					<div class="col">
						<div class="form-inline">
							<div class="form-group">
								<label>Video Title 
								<select name="videoUserId" id="videoUserId"
									class="form-control ml-3">
										<c:forEach var="item" items="${vidList }">
										<option value="${item.videoId }" ${item.videoId == videoUserId?'selected' : '' }>${item.title }</option>
										</c:forEach>
								</select>
								</label>
								<button class="btn btn-info ml-2">Reports</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col mt-3">
						<table class="table table-bordered">
							<tr>
								<td>Username</td>
								<td>Fullname</td>
								<td>Email</td>
								<td>Favorite Date</td>
							</tr>
							<c:forEach var="item" items="${favUsers }">
							<tr>
								<td>${item.username }</td>
								<td>${item.fullname }</td>
								<td>${item.email }</td>
								<td>${item.likeDate }</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</form>
		</div>
		<!-- Tab3 -->
		<div class="tab-pane fade" id="shareFriends" role="tabpanel"
			aria-labelledby="shareFriends-tab">
			<form action="" method="post">
				<div class="row mt-3">
					<div class="col">
						<div class="form-inline">
							<div class="form-group">
								<label>Video Title <select name="" id=""
									class="form-control ml-2">
										<c:forEach var="item" items="${vidList }">
										<option value="${item.videoId }" ${item.videoId == videoUserId?'selected' : '' }>${item.title }</option>
										</c:forEach>
								</select></label>
								<button class="btn btn-info ml-2">Reports</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col mt-3">
						<table class="table table-bordered">
							<tr>
								<td>Sender Name</td>
								<td>Sender Email</td>
								<td>Receiver Email</td>
								<td>Sent Date</td>
							</tr>
							<c:forEach var="item" items="">						
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>