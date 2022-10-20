package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@WebServlet("/loginOK")
public class LoginOK extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		if(dao.isMember(id, pwd)) {
			MemberVO m = dao.findById(id);
			//HttpSession session = req.getSession();
			//session.setAttribute("member", m);
			req.getSession().setAttribute("member", m);
			resp.sendRedirect("main.jsp");
		}else {
			resp.sendRedirect("login.jsp");
		}
		
	}

}
