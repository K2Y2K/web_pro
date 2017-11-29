package Servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

import dao.KjDAO;
import dao.KjDAOImp;
import entity.Kj;

/**
 * Servlet implementation class java_st_servlet
 */
@WebServlet("/java_st_servlet")
public class java_st_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public java_st_servlet() {
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");		
		Kj kj = new Kj();
		KjDAO kjDAO = new KjDAOImp();
		String[] xuanzes = {},xuanzes1 = {},xuanzes2 = {};
		String list1 = "",list2 = "",list3 = "";
	/*	String s = "    test ni   ";
		String s1 = "    test 你好啊   ";
		System.out.println("去掉空格前字符串的长度："+s.length());
		System.out.println("去掉空格前字符串的长度："+s1.length());
		s = s.trim();
		s1 = s1.trim();
		System.out.println("去掉空格前字符串的长度："+s.length());
		System.out.println("去掉空格前字符串的长度："+s1.length());*/
		try {
			kj.setKj_name(request.getParameter("kj_name"));
			kj.setKj_dxt_g(Integer.parseInt(request.getParameter("kj_dxt_g").trim()));
			kj.setKj_dxts_g(Integer.parseInt(request.getParameter("kj_dxts_g").trim()));
			kj.setKj_pdt_g(Integer.parseInt(request.getParameter("kj_pdt_g").trim()));
			kj.setKj_type(Integer.parseInt(request.getParameter("kj_type").trim()));
			kj.setC_id(Integer.parseInt(request.getParameter("c_id").trim()));
			kj.setTid(Integer.parseInt(request.getParameter("tid").trim()));//删除空格
			xuanzes = request.getParameterValues("kj_dxt_id");
			System.out.println("kj_dxt_id单选题集合数组" + xuanzes);
			xuanzes1 = request.getParameterValues("kj_dxts_id");
			System.out.println("kj_dxts_id多选题集合数组" + xuanzes1);
			xuanzes2 = request.getParameterValues("kj_pdt_id");
			System.out.println("kj_pdt_id判断题集合数组" + xuanzes2);
			if (xuanzes.length > 0) {
				for (String f : xuanzes) {
					list1 += f + "#";
					System.out.println("servlet获取的单选题号 list1" + list1);
				}
				kj.setKj_dxt_id(list1);
				System.out.println("servlet获取的单选题号 list1总集合" + list1);
			} else
				kj.setKj_dxt_id(list1);
			if (xuanzes1.length > 0) {
				for (String f : xuanzes1) {
					list2 += f + "#";
					System.out.println("servlet获取的多选题号 list2" + list2);
				}
				kj.setKj_dxts_id(list2);
				System.out.println("servlet获取的多选题号 list2总集合" + list2);
			} else
				kj.setKj_dxts_id(list2);
			if (xuanzes2.length > 0) {
				for (String f : xuanzes2) {
					list3 += f + "#";
					System.out.println("servlet list3" + list3);
				}
				kj.setKj_pdt_id(list3);
				System.out.println("servlet获取的判断题号 list3总集合" + list3);
			} else
				kj.setKj_pdt_id(list3);
           if( kjDAO.addKj((Object)kj)){
        	   request.getRequestDispatcher("/teacher/kj_show.jsp").forward(request, response);
        	   System.out.println("KJ添加成功");
           }else			
			request.getRequestDispatcher("/teacher/st_maker.jsp").forward(request, response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}
