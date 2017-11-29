package Servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ManagersDAO;
import dao.ManagersDAOImp;
import entity.Managers;

/**
 * Servlet implementation class managersServlet
 */
@WebServlet("/managersServlet")
public class managersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public managersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		Managers m =new Managers();
		ManagersDAO m_dao =new ManagersDAOImp();
		try{
			m.setM_name(request.getParameter("m_name"));
			m.setM_password(request.getParameter("m_password"));
			if(m_dao.usersLogin(m)){
				//跳转到注册成功页面
				request.getSession().setAttribute("loginUser", m);
				request.getRequestDispatcher("/admin/manager_info.jsp").forward(request,response);
				System.out.println("管理员成功登录首页");
			}else
				request.getRequestDispatcher("/admin/admin_login.jsp").forward(request,response);
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

}
