package Servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Java_dxtDAO;
import dao.Java_dxtsDAO;
import dao.Java_pdtDAO;
import dao.Java_stDAO;
import dao.KjDAO;
import dao.KjDAOImp;
import dao.Stu_gradeDAO;
import dao.Stu_gradeDAOImp;
import dao.Stu_resultDAO;
import dao.Stu_resultDAOImp;
import entity.Java_dxt;
import entity.Java_dxts;
import entity.Java_pdt;
import entity.Kj;
import entity.Stu_grade;
import entity.Stu_result;

/**
 * Servlet implementation class do_on_ksServlet
 */
@WebServlet("/do_on_ksServlet")
public class do_on_ksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public do_on_ksServlet() {
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
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		Java_dxt java_dxt = new Java_dxt();
		Java_dxts java_dxts = new Java_dxts();
		Java_pdt java_pdt = new Java_pdt();
		Java_dxtDAO java_dxtDAO = new Java_dxtDAO();
		Java_dxtsDAO java_dxtsDAO = new Java_dxtsDAO();
		Java_pdtDAO java_pdtDAO = new Java_pdtDAO();
		Java_stDAO java_stDAO = new Java_pdtDAO();
		Kj kj = new Kj();
		KjDAO kjDAO = new KjDAOImp();
		Stu_result stu_r = new Stu_result();
		Stu_resultDAO stu_rDAO = new Stu_resultDAOImp();
		Stu_grade stu_g = new Stu_grade();
		Stu_gradeDAO stu_gDAO = new Stu_gradeDAOImp();
		String list1 = "", list2 = "", list3 = "", list_dxts="";
		String[] dxts1 = {}, dxts2 = {}, dxts3 = {};
		int count1 = 1, count2 = 1, count3 = 1;
		int c_dxt_true = 0, c_dxt_false = 0, c_dxts_true = 0, c_dxts_false = 0, c_pdt_true = 0, c_pdt_false = 0;
		int java_dxt_id, java_dxts_id, java_pdt_id;
		String stu_dxt_xx = "", stu_dxt_r = "", stu_dxt_c = "";
		String stu_dxts_r = "", stu_dxts_c = "", stu_pdt_r = "", stu_pdt_c = "";
		String[] stu_dxts_xx = {};
		int xuanxiang;
		int stu_dxt_g = 0, stu_dxts_g = 0, stu_pdt_g = 0, stu_total_g = 0;		
		String[]  get_quest_dxt={},get_quest_dxts={},get_quest_x_dxts={},get_quest_pdt={};
		String[] java_dxt_xx={};
		try {
			String flag = request.getParameter("kj_id");
			System.out.println("输出从on_ks获取的考卷编号:" + flag);
			stu_r.setKj_id(Integer.parseInt(request.getParameter("kj_id")));
			stu_r.setSid(Integer.parseInt(request.getParameter("sid")));
			stu_g.setKj_id(Integer.parseInt(request.getParameter("kj_id")));
			stu_g.setSid(Integer.parseInt(request.getParameter("sid")));
			System.out.println("输出从on_ks获取的考卷编号" + flag);
			kj = (Kj) kjDAO.getKtById(Integer.parseInt(request.getParameter("kj_id")));
			System.out.println("输出从on_ks获取的考卷对象kj成功" + kj);
			// String list1="",list_dxts="",list2="";
            //遍历单选题答案
			get_quest_dxt = request.getParameterValues("quest_dxt");
			System.out.println("输出从on_ks获取的考卷单选题题干" + get_quest_dxt);
			if (get_quest_dxt != null) {
				for (int i = 0; i < get_quest_dxt.length; i++) {
					System.out.println("输出从on_ks获取的考卷单选题题干具体选项内容get_quest_dxt[i]:" + get_quest_dxt[i]);
					System.out.println("输出从on_ks获取的考卷单选题题干具体选项内容:" + request.getParameter(get_quest_dxt[i]));
					java_dxt_id = Integer.parseInt(get_quest_dxt[i]);
					System.out.println("输出从on_ks获取的考卷单选题题题号java_dxt_id:" + java_dxt_id);
					if (request.getParameter(get_quest_dxt[i]) != null) {

						// stu_dxt_r += request.getParameter(get_quest_dxt[i]) +
						// "#";
						// java_dxt_xx[i]=request.getParameter(get_quest_dxt[i]).trim();这种方法不对
						// System.out.println("输出从on_ks获取的考试该单选题详细答案" + list1);

						stu_dxt_xx = request.getParameter(get_quest_dxt[i]);// 返回的是考生提供的详细答案
						System.out.println("输出从on_ks获取的单选题编号java_dxt_id对应的考生提供的详细答案成功" + stu_dxt_xx);
						list1 = getKs_dxtr(java_dxt_id, stu_dxt_xx);
						System.out.println("输出从on_ks获取的单选题编号java_dxt_id对应的考生提供的详细答案转换成1234成功" + list1);
						stu_dxt_r += list1 + "#";
						System.out.println("输出从on_ks获取的所有的单选题编号java_dxt_id对应的考生提供的答案1234成功" + stu_dxt_r);
						if (isKs_dxtr_true(java_dxt_id, list1)) {
							c_dxt_true++;
							xuanxiang = 1;
							stu_dxt_c += xuanxiang + "#";
							System.out.println("考生该单选题答案正确" + stu_dxt_c);
						} else {
							c_dxt_false++;
							xuanxiang = 0;
							stu_dxt_c += xuanxiang + "#";
							System.out.println("考生该单选题答案错误" + stu_dxt_c);
						}
						System.out.println("输出从on_ks获取的所有的单选题编号java_dxt_id对应的考生提供的答案正确和错误成功" + stu_dxt_c);

					}else {
						stu_dxt_r += "";
						stu_dxt_c += "";
						c_dxt_true =c_dxt_true + 0;
					}}				
					stu_r.setStu_dxt_r(stu_dxt_r);
					stu_r.setStu_dxt_c(stu_dxt_c);
					stu_dxt_g = c_dxt_true * (kj.getKj_dxt_g());
					stu_g.setStu_dxt_g(stu_dxt_g);
				
			}
//获取多选题题号
			get_quest_dxts = request.getParameterValues("quest_dxts");
			System.out.println("输出从on_ks获取的考卷多选题题干" + get_quest_dxts);
			if(get_quest_dxts!=null){
				
			   for (int i = 0; i < get_quest_dxts.length; i++) {
				
			
				System.out.println("输出从on_ks获取的考卷多选题题干具体选项内容:" + get_quest_dxts[i]);
				System.out.println("输出从on_ks获取的考卷多选题题干具体选项内容:" + request.getParameterValues(get_quest_dxts[i]));
				java_dxts_id = Integer.parseInt(get_quest_dxts[i]);
				System.out.println("输出从on_ks获取的考卷单选题题题号java_dxts_id:" + java_dxts_id);
				if(request.getParameterValues(get_quest_dxts[i])!=null){
					get_quest_x_dxts = request.getParameterValues(get_quest_dxts[i]);
				System.out.println("输出从on_ks获取的考卷多选题题干具体选项内容stu_dxts_xx:" +get_quest_x_dxts);
				if(get_quest_x_dxts !=null){				
				for (int j = 0; j < get_quest_x_dxts.length; j++) {
					list_dxts += get_quest_x_dxts[j] + ":";
					System.out.println("输出从on_ks获取的考试该多选题详细答案" + list_dxts);
				}
				stu_dxts_xx=list_dxts.split(":");
				System.out.println("输出从on_ks获取的考试所有多选题详细答案stu_dxts_xx:" + stu_dxts_xx);
								
				list2 = getKs_dxtsr(java_dxts_id, stu_dxts_xx);				
				System.out.println("输出从on_ks获取的多选题编号java_dxts_id对应的考生提供的详细答案转换成1234成功" + list2);
				}
				stu_dxts_r += list2 + "#";
				System.out.println("输出从on_ks获取的所有的多选题编号java_dxts_id对应的考生提供的答案1234成功" + stu_dxts_r);
				if (isKs_dxtsr_true(java_dxts_id, list2)) {
					c_dxts_true++;
					System.out.println("考生该多选题答案正确个数:" + c_dxts_true);
					xuanxiang = 1;
					stu_dxts_c += xuanxiang + "#";
					System.out.println("考生该多选题答案正确:" + stu_dxts_c);
				} else {
					c_dxts_false++;
					xuanxiang = 0;
					stu_dxts_c += xuanxiang + "#";
					System.out.println("考生该多选题答案错误" + stu_dxts_c);
				}
				System.out.println("输出从on_ks获取的所有的多选题编号java_dxts_id对应的考生提供的答案正确和错误成功" + stu_dxts_c);
			} else {
				stu_dxts_r += "";
				stu_dxts_c += "";
				c_dxts_true += 0;
			}}
			stu_r.setStu_dxts_r(stu_dxts_r);
			stu_r.setStu_dxts_c(stu_dxts_c);
			stu_dxts_g = c_dxts_true * (kj.getKj_dxts_g());
			stu_g.setStu_dxts_g(stu_dxts_g);
		
			}
		
			
			//获取判断题id号
			get_quest_pdt = request.getParameterValues("quest_pdt");
			System.out.println("输出从on_ks获取的考卷判断题题干" + get_quest_pdt);
					if (get_quest_pdt != null) {
						for (int i = 0; i < get_quest_pdt.length; i++) {
							System.out.println("输出从on_ks获取的考卷判断题题干具体选项内容get_quest_pdt[i]:" + get_quest_pdt[i]);
							
							java_pdt_id = Integer.parseInt(get_quest_pdt[i]);
							System.out.println("输出从on_ks获取的考卷单选题题题号java_dxt_id:" + java_pdt_id);
							System.out.println("输出从on_ks获取的考卷判断题题干具体选项内容:" + request.getParameter(get_quest_pdt[i]));
							if (request.getParameter(get_quest_pdt[i]) != null) {

								// stu_dxt_r += request.getParameter(get_quest_dxt[i]) +
								// "#";
								// java_dxt_xx[i]=request.getParameter(get_quest_dxt[i]).trim();这种方法不对
								// System.out.println("输出从on_ks获取的考试该单选题详细答案" + list1);
					
								list3 = request.getParameter(get_quest_pdt[i]);// 返回的是考生提供的详细答案
								System.out.println("输出从on_ks获取的判断题编号java_pdt_id对应的考生提供的答案成功" + list3);

								stu_pdt_r += list3 + "#";
								System.out.println("输出从on_ks获取的所有的判断题编号java_pdt_id对应的考生提供的答案01" + stu_pdt_r);
								if (isKs_pdtr_true(java_pdt_id, list3)) {
									c_pdt_true++;
									xuanxiang = 1;
									stu_pdt_c += xuanxiang + "#";
									System.out.println("考生该判断题答案正确个数" + c_pdt_true);
									System.out.println("考生该判断题答案正确:" + stu_pdt_c);
								} else {
									c_pdt_false++;
									xuanxiang = 0;
									stu_pdt_c += xuanxiang + "#";
									System.out.println("考生该判断题答案错误个数" + c_pdt_false);
									System.out.println("考生该判断题答案错误:" + stu_pdt_c);
								}
								System.out.println("输出从on_ks获取的所有的单选题编号java_pdt_id对应的考生提供的答案记录正确和错误成功" + stu_pdt_c);
							} else {
								stu_pdt_r += "";
								stu_pdt_c += "";
								c_pdt_true += 0;
							}}
							stu_r.setStu_pdt_r(stu_pdt_r);
							stu_r.setStu_pdt_c(stu_pdt_c);
							stu_pdt_g = c_pdt_true * (kj.getKj_pdt_g());
							stu_g.setStu_pdt_g(stu_pdt_g);						
					}
					
					stu_total_g = stu_dxt_g + stu_dxts_g + stu_pdt_g;
					stu_g.setStu_total_g(stu_total_g);
					if (stu_rDAO.addStu_result((Object) stu_r)) {
						request.getRequestDispatcher("/student/on_ks_success.jsp").forward(request, response);
						System.out.println("学生考卷提交成功");
					} else {
						request.getRequestDispatcher("/student/on_ks_failue.jsp").forward(request, response);
						System.out.println("学生考卷提交失败");
					}
					if (stu_gDAO.addStu_grade((Object) stu_g)) {
						System.out.println("学生考卷成绩提交成功");
					} else {
						System.out.println("学生考卷成绩提交失败");
					}
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}


	
	private boolean isKs_pdtr_true(int java_pdt_id, String list3) {
		// TODO Auto-generated method stub
		Java_pdt java_pdt = new Java_pdt();
		// Java_pdtDAO java_pdtDAO = new Java_pdtDAO();
		Java_stDAO java_stDAO = new Java_pdtDAO();
		if (list3 != null) {
			if (java_stDAO.getJava_stById(java_pdt_id) != null) {
				java_pdt = (Java_pdt) java_stDAO.getJava_stById(java_pdt_id);
				if (java_pdt.getJava_pdt_question().equals(list3)) {
					return true;
				} else
					return false;
			} else
				return false;
		} else
			return false;
	}

	private boolean isKs_dxtsr_true(int java_dxts_id, String list2) {
		// TODO Auto-generated method stub
		// String[] arr = {};
		Java_dxts java_dxts = new Java_dxts();
		Java_dxtsDAO java_dxtsDAO = new Java_dxtsDAO();
		if (list2 != null) {
			if (java_dxtsDAO.getJava_dxtsById(java_dxts_id) != null) {
				java_dxts = java_dxtsDAO.getJava_dxtsById(java_dxts_id);
				if (list2.equals(java_dxts.getJava_dxts_question())) {
					return true;
				} else
					return false;
			} else
				return false;
		} else
			return false;
	}

	private String getKs_dxtsr(int java_dxts_id, String[] stu_dxts_xx) {
		// TODO Auto-generated method stub

		Java_dxts java_dxts = new Java_dxts();
		Java_dxtsDAO java_dxtsDAO = new Java_dxtsDAO();
		String list = "";
		if (stu_dxts_xx != null) {
			if (java_dxtsDAO.getJava_dxtsById(java_dxts_id) != null) {
				java_dxts = java_dxtsDAO.getJava_dxtsById(java_dxts_id);
				if (stu_dxts_xx.length > 0) {
					for (int i = 0; i < stu_dxts_xx.length; i++) {
						if (stu_dxts_xx[i].equals(java_dxts.getJava_dxts_opt1())) {
							list += 1 + ":";
							System.out.println("为答案加入选项记号1" + list);
						} else if (stu_dxts_xx[i].equals(java_dxts.getJava_dxts_opt2())) {
							list += 2 + ":";
							System.out.println("为答案加入选项记号2" + list);
						} else if (stu_dxts_xx[i].equals(java_dxts.getJava_dxts_opt3())) {
							list += 3 + ":";
							System.out.println("为答案加入选项记号3" + list);
						} else if (stu_dxts_xx[i].equals(java_dxts.getJava_dxts_opt4())) {
							list += 4 + ":";
							System.out.println("为答案加入选项记号4" + list);
						} else
							list += "";
					}
					return list;
				} else
					return null;
			} else
				return null;
		} else
			return null;
	}

	private boolean isKs_dxtr_true(int java_dxt_id, String list1) {
		// TODO Auto-generated method stub

		Java_dxt java_dxt = new Java_dxt();
		Java_dxtDAO java_dxtDAO = new Java_dxtDAO();
		String isResult = "";
		if (list1 != null) {
			if (java_dxtDAO.getJava_dxtById(java_dxt_id) != null) {
				java_dxt = java_dxtDAO.getJava_dxtById(java_dxt_id);
				if (java_dxt.getJava_dxt_result().equals(java_dxt.getJava_dxt_opt1())) {
					isResult = "1";
				} else if (java_dxt.getJava_dxt_result().equals(java_dxt.getJava_dxt_opt2())) {
					isResult = "2";
				} else if (java_dxt.getJava_dxt_result().equals(java_dxt.getJava_dxt_opt3())) {
					isResult = "3";
				} else if (java_dxt.getJava_dxt_result().equals(java_dxt.getJava_dxt_opt4())) {
					isResult = "4";
				}
				if (isResult.equals(list1)) {//把list1放在括号中不用判断它是否为空
					return true;
				} else
					return false;
			} else
				return false;
		} else
			return false;
	}

	private String getKs_dxtr(int java_dxt_id, String stu_dxt_xx) {
		// TODO Auto-generated method stub
		Java_dxt java_dxt = new Java_dxt();
		Java_dxtDAO java_dxtDAO = new Java_dxtDAO();
		if (stu_dxt_xx != null) {
			if (java_dxtDAO.getJava_dxtById(java_dxt_id) != null) {
				java_dxt = java_dxtDAO.getJava_dxtById(java_dxt_id);
				if (java_dxt.getJava_dxt_opt1().equals(stu_dxt_xx)) {
					return "1";
				} else if (java_dxt.getJava_dxt_opt2().equals(stu_dxt_xx)) {
					return "2";
				} else if (java_dxt.getJava_dxt_opt3().equals(stu_dxt_xx)) {
					return "3";
				} else if (java_dxt.getJava_dxt_opt4().equals(stu_dxt_xx)) {
					return "4";
				} else
					return null;
			} else
				return null;
		} else
			return null;
	}
	
	
}
