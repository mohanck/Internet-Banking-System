import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;   
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;
/**
 * Servlet implementation class for Servlet: Jaspertest
 *
 */
 public class Jaspertest extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public Jaspertest() {
		super();
	}  
	
	/* (non-Javadoc)
	 * @see javax.servlet.Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		         
		//}
	}  	
	 
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession ses=request.getSession();
		//if(hs.isNew()){response.sendRedirect("http://localhost:8080/BusinessEPartner/main_orders.jsp");}
		//else{
			String rfile="";
			String rtype=request.getParameter("type");
			System.out.println(ses.getAttribute("acfrom")+"   "+rtype);
			//String person=request.getParameter("reportperson");
			//if(((String)hs.getAttribute("category")).equalsIgnoreCase("manufacturer")){
				rfile="C://Users/SATYA/Desktop/Report1.jrxml";		
				
			Map m=new HashMap();
			System.out.println("reached 1");
			m.put("from",ses.getAttribute("acfrom"));
			try{
				 JasperDesign jasperDesign = JRXmlLoader.load(rfile);
				 System.out.println("rfile in doTag()....."+rfile);
		         JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
		         JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,m, con);
		         List l=jasperPrint.getPages();
		         int i=l.size();
		         System.out.println(i);
		        
		         if(i==0)
		         { PrintWriter out=response.getWriter();
		         out.println("<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /><title>Report</title></head><body style=margin:0px;background-attachment:fixed;background-image:url('images/bc.jpg');><img src='images/banner3.jpg' height='130' width='128%'><br><table style=background-image:url('images/back.jpg'); width='128%'>  <tr><td width='15%' align='left'><a href='ViewProfilep.jsp'/><font color='white'><b>View Criminal Profiles</b></font></td><td width='16%' align='center'><a href='ViewReport.jsp'/><font color='white'><b>View Reports</b></font></td><td width='17%' align='center'><a href='ViewSprofile.jsp'/><font color='white'><b>View Suspect Profiles</b></font></td><td width='10%' align='center'><a href='PoliceHome.jsp'/><font color='white'><b>Home</b></font></td><td width='20%' align='center'><a href='ChargeSheet.html'/><font color='white'><b>Build a ChargeSheet</b></font></td><td width='12%' align='center'><a href='ForumPostP.html'/><font color='white'><b>Post a Forum</b></font></td><td width='10%' align='right'><a href='logout.jsp'/><font color='white'><b>Logout</b></font></td></tr></table>");
		        	
		        	out.println("no reports found.");
		         }
		         else if("html".equalsIgnoreCase(rtype))
		         {	  PrintWriter out=response.getWriter();
		         //out.println("<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /><title>Report</title></head><body style=margin:0px;background-attachment:fixed;background-image:url('images/bg.jpg');><img src='images/bg.jpg' height='130' width='128%'><br><table style=background-image:url('images/bg.jpg'); width='128%'></table>");
		        	 JRHtmlExporter exporter = new JRHtmlExporter();
		         request.getSession().setAttribute(ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jasperPrint);
		         exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,"image?image=");
		         exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		         exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
		         exporter.exportReport();}
			
		         
		          

		         else if("pdf".equalsIgnoreCase(rtype))
		         {
		          	 JasperExportManager.exportReportToPdfFile(jasperPrint, "D://sample_report.pdf");
			        OutputStream out=response.getOutputStream();
			        File f=new File("D://sample_report.pdf");
			        FileInputStream fos=new FileInputStream(f);
			        byte []b=new byte[(int)f.length()];
			        fos.read(b);
			        response.setContentType("application/pdf");
			        for (int j = 0; j < b.length; j++) {
			        out.write(b[j]);
			        	}
			        fos.close();
			      f.delete();
			        
		        }
		         else if("xls".equalsIgnoreCase(rtype))
		         {
		          	 JasperExportManager.exportReportToPdfFile(jasperPrint, "D://sample_report.xls");
			        OutputStream out=response.getOutputStream();
			        File f=new File("D://sample_report.xls");
			        FileInputStream fos=new FileInputStream(f);
			        byte []b=new byte[(int)f.length()];
			        fos.read(b);
			        response.setContentType("application/vnd.ms-excel");
			        for (int j = 0; j < b.length; j++) {
			        out.write(b[j]);
			        	}
			        fos.close();
			      f.delete();
			        
		        }
		    	}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		    	}
	}   	  	  
	Connection con;
	Statement st;
	/* (non-Javadoc)
	 * @see javax.servlet.GenericServlet#init()
	 */
	
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		try{
			
			ServletContext ctx=getServletContext();
		con=(Connection)ctx.getAttribute("Connection");
		st=con.createStatement();
			}catch(Exception e){
				e.printStackTrace();
			}
		
		
	}   
}