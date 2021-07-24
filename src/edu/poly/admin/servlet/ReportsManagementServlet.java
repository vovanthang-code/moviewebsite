package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.dao.FavoriteDAO;
import edu.poly.dao.VideoDAO;
import edu.poly.domain.FavoriteReport;
import edu.poly.domain.FavoriteUserReport;
import edu.poly.model.Video;

/**
 * Servlet implementation class ReportsManagementServlet
 */
@WebServlet({"/Admin/ReportsManagement"})
public class ReportsManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reportFavoritesByVideo(request, response);
		reportFavoriteUsersByVideo(request, response);
		
		PageInfo.prepareAndForward(request, response, PageType.REPORT_MANAGEMENT_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reportFavoritesByVideo(request, response);
		reportFavoriteUsersByVideo(request, response);
		PageInfo.prepareAndForward(request, response, PageType.REPORT_MANAGEMENT_PAGE);
	}

	protected void reportFavoritesByVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			FavoriteDAO dao = new FavoriteDAO();
			List<FavoriteReport> list = dao.reportFavoritesByVideos();
			
			request.setAttribute("favList", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
	protected void reportFavoriteUsersByVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String videoUserId = request.getParameter("videoUserId");
			
			VideoDAO vdao = new VideoDAO();
			List<Video> vList = vdao.findAll();
			
			if(videoUserId == null && vList.size() > 0) {
				videoUserId = vList.get(0).getVideoId();
			}
			FavoriteDAO dao = new FavoriteDAO();
			List<FavoriteUserReport> list = dao.reportFavoritesUsersByVideo(videoUserId);
			
			request.setAttribute("videoUserId", videoUserId);
			request.setAttribute("vidList", vList);
			request.setAttribute("favUsers", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

}
