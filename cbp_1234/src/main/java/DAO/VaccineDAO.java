package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.ExpiresFilter.XHttpServletResponse;

import DTO.Query;
public class VaccineDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static Connection getConnection() throws Exception {
		 Class.forName("oracle.jdbc.OracleDriver");
		 Connection con  = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "sys1234");
		 return con;
	}
	
	public int insert(HttpServletRequest request, HttpServletResponse response) {
		String resvno = request.getParameter("resvno");
		String jumin = request.getParameter("jumin");
		String vcode= request.getParameter("vcode");
		String hospcode = request.getParameter("hospcode");
		String resvdate = request.getParameter("resvdate");
		String resvtime = request.getParameter("resvtime");
		int result = 0;
		
		//System.out.println("111 :" + resvno +":" + jumin);
		try {
			conn = getConnection();
			String sql = " insert into tbl_vaccresv_202108 values(?, ?, ?, ?, ?, ?)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, resvno);
			ps.setString(2, jumin);
			ps.setString(3, vcode);
			ps.setString(4, hospcode);
			ps.setString(5, resvdate);
			ps.setString(6, resvtime);
			
			//System.out.println("2222 :"+ resvno +":" + jumin);
			result = ps.executeUpdate();
			System.out.println(result);
			
			conn.close();
			ps.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	
	 public String select(HttpServletRequest request, HttpServletResponse response) {
		 String resvno = request.getParameter("resvno");
		 ArrayList<Query> list = new ArrayList<Query>();
		 
		 try {
			conn = getConnection();
			String sql=" SELECT T2.PNAME, T1.JUMIN, DECODE(SUBSTR(T1.JUMIN, 8, 1), '1', '남', '2', '여') GENDER,  "
					+ "T2.TEL, TO_CHAR(TO_DATE(T1.RESVDATE , 'YYYY-MM-DD'), 'YYYY\"년\"MM\"월\"DD\"일\"') RESVDTE,  "
					+ "SUBSTR(T1.RESVTIME,1,2) || ':' || SUBSTR(T1.RESVTIME,3,4) RESVTIME,  "
					+ "T3.HOSPNAME, T3.HOSPTEL, T3.HOSPADDR,  "
					+ "DECODE(T1.VCODE, 'V001', 'A백신','V002','B백신','V003', 'C백신') VCODE "
					+ "FROM TBL_VACCRESV_202108 T1 "
					+ "JOIN TBL_JUMIN_201808 T2 "
					+ "ON T1.JUMIN = T2.JUMIN "
					+ "JOIN TBL_HOSP_202108 T3  "
					+ "ON T1.HOSPCODE = T3.HOSPCODE where  T1.resvno = '"+ resvno +"'"
					;
			
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Query query = new Query();
				query.setPname(rs.getString(1));
				query.setJumin(rs.getString(2));
				query.setGender(rs.getString(3));
				query.setTel(rs.getString(4));
				query.setResvdate(rs.getString(5));
				query.setResvtime(rs.getString(6));
				query.setHospname(rs.getString(7));
				query.setHosptel(rs.getString(8));
				query.setHospaddr(rs.getString(9));
				query.setVcode(rs.getString(10));
				
				list.add(query);
			}
			
			request.setAttribute("list", list);  //("key", value):value 要看成是object，
			request.setAttribute("resvno", resvno);//接收单一值的时候要强制形变。
			
			conn.close();
			ps.close();
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "select.jsp";
	 }
	 
	}