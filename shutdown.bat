Time Server WebService In Java PHP and WCF
JavaServer---------------------------------
package mypack;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
@WebService(serviceName = "TimeServer1")
public class TimeServer1 {
@WebMethod(operationName = "getTimeAsString")
public String getTimeAsString() {
return new java.util.Date().toString();
}
@WebMethod(operationName = "getTimeElapsed")
public long getTimeElapsed() {
return new java.util.Date().getTime();
}
}
Java Client---------------------------------
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Time client</title>
</head>
<body>
<center>
<h1>Current System Date and Time</h1>
<%
try {
mypack.TimeServer1_Service service = new mypack.TimeServer1_Service();
mypack.TimeServer1 port = service.getTimeServer1Port();
java.lang.String result = port.getTimeAsString();
out.println("Time as string = " + result);
} catch (Exception ex) {
ex.printStackTrace();
}
%>
<br>
<br>
<%
try {
mypack.TimeServer1_Service service = new mypack.TimeServer1_Service();
mypack.TimeServer1 port = service.getTimeServer1Port();
long result = port.getTimeElapsed();
out.println("Elapsed time = " + result);
} catch (Exception ex) {
ex.printStackTrace();
}
%>
<hr/>
</center>
</body>
</html>
PHP Client-------------------------------------
<?php
$client=new SoapClient("http://localhost:8080/TimeServerApp1/TimeServer1?WSDL");
$t1=$client->getTimeAsString();
echo " Current time as string: ",$t1->return,"<br>";
$t2=$client->getTimeElapsed();
echo "Elapsed time: ",$t2->return;
?>
WCF----------------------------------------
NET client:
aspx:------------------------
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" 
Inherits="TimeClient.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div style="height: 391px">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get time as 
string" />
<br />
<br />
<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
<br />
<br />
<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Get elapsed 
time" />
</div>
</form>
</body>
</html>
aspx.cs:--------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TimeClient
{
public partial class WebForm1 : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{
}
protected void Button1_Click(object sender, EventArgs e)
{
ServiceReference1.TimeServer1Client client = new
ServiceReference1.TimeServer1Client();
Label1.Text = client.getTimeAsString();
}
protected void Button2_Click(object sender, EventArgs e)
{
ServiceReference1.TimeServer1Client client = new
ServiceReference1.TimeServer1Client();
Label2.Text = Convert.ToString(client.getTimeElapsed());
}
}
}
====================================================================================
arithmetic calculations like addition, subtraction, multiplication and division
Web service:---------------------------------------
package ops;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
@WebService(serviceName = "ArithmeticOperations")
public class ArithmeticOperations {
@WebMethod(operationName = "add")
public int add(@WebParam(name = "first") int first, @WebParam(name = "second") int
second) {
int sum = first + second;
return sum;
}
@WebMethod(operationName = "subtract")
public int subtract(@WebParam(name = "first") int first, @WebParam(name = "second") int
second) {
int sub = first - second;
return sub;
}
@WebMethod(operationName = "multiply")
public int multiply(@WebParam(name = "first") int first, @WebParam(name = "second") int
second) {
int mult = first * second;
return mult;
}
@WebMethod(operationName = "divide")
public int divide(@WebParam(name = "first") int first, @WebParam(name = "second") int
second) {
int div = first / second;
return div;
}
}
Client:----------------------------------------------------------
<!DOCTYPE html>
<html>
<head>
<title>Arithmetic Operations</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<center>
<h1>Arithmetic operations</h1>
<form action="ops.jsp">
Enter first number: <input type="text" name="firstnumber" value="" /> <br><br>
Enter second number: <input type="text" name="secondnumber" value="" /><br><br>
<input type="radio" name="ops" value="addition" />Add <br>
<input type="radio" name="ops" value="subtraction" />Subtract <br>
<input type="radio" name="ops" value="multiplication" />Multiply <br>
<input type="radio" name="ops" value="division" />Divide <br><br>
<input type="submit" value="Calculate" name="submit" />
</form>
</center>
</body>
</html>
ops.jsp:----------------------------------------------------------------------
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Arithmetic operations</title>
</head>
<body>
<center>
<h1>Arithmetic operations</h1>
<%
int num1 = Integer.parseInt(request.getParameter("firstnumber"));
int num2 = Integer.parseInt(request.getParameter("secondnumber"));
String c = request.getParameter("ops");
if (c.equals("addition")) {
try {
ops.ArithmeticOperations_Service service = new
ops.ArithmeticOperations_Service();
ops.ArithmeticOperations port = service.getArithmeticOperationsPort();
int result = port.add(num1, num2);
out.println("Addition = " + result);
} catch (Exception ex) {
ex.printStackTrace();
}
} else if (c.equals("subtraction")) {
try {
ops.ArithmeticOperations_Service service = new
ops.ArithmeticOperations_Service();
ops.ArithmeticOperations port = service.getArithmeticOperationsPort();
int result = port.subtract(num1, num2);
out.println("Subtraction = " + result);
} catch (Exception ex) {
ex.printStackTrace();
}
} else if (c.equals("multiplication")) {
try {
ops.ArithmeticOperations_Service service = new
ops.ArithmeticOperations_Service();
ops.ArithmeticOperations port = service.getArithmeticOperationsPort();
int result = port.multiply(num1, num2);
out.println("Multiplication = " + result);
} catch (Exception ex) {
ex.printStackTrace();
}
9
} else {
try {
ops.ArithmeticOperations_Service service = new
ops.ArithmeticOperations_Service();
ops.ArithmeticOperations port = service.getArithmeticOperationsPort();
int result = port.divide(num1, num2);
out.println("Division = " + result);
} catch (Exception ex) {
ex.printStackTrace();
}
}
%>
</center>
</body>
</html>
==================================================================================================
web service which gives NSE Index, BSE Index and Gold Rate. The values are stored in a database.
Web service:
package first;
import java.sql.*;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
@WebService(serviceName = "Stockservice")
public class Stockservice {
@WebMethod(operationName = "getNSE")
public int getNSE() {
int nse = 0;
try{
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con =
DriverManager.getConnection("jdbc:derby://localhost:1527/StockData", "root", "69420");
Statement stmt = con.createStatement();
ResultSet rest = stmt.executeQuery("SELECT * FROM STOCKTABLE");
rest.next();
nse = rest.getInt("NSE");
}catch(Exception e){
e.printStackTrace();
}
return nse;
}
@WebMethod(operationName = "getBSE")
public int getBSE() {
int bse = 0;
try{
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con =
DriverManager.getConnection("jdbc:derby://localhost:1527/StockData", "root", "69420");
Statement stmt = con.createStatement();
ResultSet rest = stmt.executeQuery("SELECT * FROM STOCKTABLE");
rest.next();
bse = rest.getInt("BSE");
}catch(Exception e){
e.printStackTrace();
}
return bse;
}
@WebMethod(operationName = "getGoldRate")
public int getGoldRate() {
int goldrate = 0;
try{
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con =
DriverManager.getConnection("jdbc:derby://localhost:1527/StockData", "root", "69420");
Statement stmt = con.createStatement();
ResultSet rest = stmt.executeQuery("SELECT * FROM STOCKTABLE");
rest.next();
goldrate = rest.getInt("GOLDRATE");
}catch(Exception e){
e.printStackTrace();
}
return goldrate;
}
}
Client:--------------------------------------------------------------------
<!DOCTYPE html>
<html>
<head>
<title>Fetch stock prices</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<center>
<h1>Get stock price</h1>
<form action="index.jsp">
<input type="radio" name="stock" value="BSE" />BSE<br>
<input type="radio" name="stock" value="NSE" />NSE<br>
<input type="radio" name="stock" value="GOLDRATE" />Gold rate<br><br>
<input type="submit" value="Get price" name="getprice" />
</form>
</center>
</body>
</html>
index.jsp:-------------------------------------------------------------------------------------
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stock price</title>
</head>
<body>
<center>
<h1>Stock price</h1>
<%
String choice = request.getParameter("stock");
if (choice.equals("BSE")) {
try {
fetch.Stockservice_Service service = new fetch.Stockservice_Service();
fetch.Stockservice port = service.getStockservicePort();
int result = port.getBSE();
out.println("BSE = " + result);
} catch (Exception ex) {
ex.printStackTrace();
}
} else if (choice.equals("NSE")) {
try {
fetch.Stockservice_Service service = new fetch.Stockservice_Service();
fetch.Stockservice port = service.getStockservicePort();
int result = port.getNSE();
out.println("NSE = " + result);
} catch (Exception ex) {
ex.printStackTrace();
}
} else {
try {
fetch.Stockservice_Service service = new fetch.Stockservice_Service();
fetch.Stockservice port = service.getStockservicePort();
int result = port.getGoldRate();
out.println("Gold rate = " + result);
} catch (Exception ex) {
ex.printStackTrace();
}
}
%>
</center>
</body>
</html>
===================================================================================================
web service for UGC that contains a method which accepts college name as parameter and returns the NAAC rating
Web service:-------------------------------------------------
package gradepack;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import java.sql.*;
@WebService(serviceName = "NAACGrade")
public class NAACGrade {
@WebMethod(operationName = "getGrade")
public String getGrade(@WebParam(name = "name") String name) {
String grade="";
try{
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection
con=DriverManager.getConnection("jdbc:derby://localhost:1527/NAAC","root","123");
Statement smt=con.createStatement();
ResultSet rs= smt.executeQuery("SELECT GRADE FROM NAACGRADE WHERE 
COLLEGE='"+name+"'");
rs.next();
grade =rs.getString("GRADE");
}
catch(Exception e){
e.printStackTrace();
}
return grade;
}
}
Client:-------------------------------------------------------------------------
<!DOCTYPE html>
<html>
<head>
<title>NAAC Grade</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<center>
<h1>Select the college name to display grade </h1>
<form name="form1" action="grade.jsp">
College Name: <select name="college">
<option value="SIES">SIES</option>
<option value="Ruia">Ruia</option>
<option value="Pendharkar">Pendharkar</option>
<option value="Birla">Birla</option>
</select>
<input type="submit" value="Get Grade" name="submit" />
</form>
</center>
</body>
</html>
grade.jsp:-----------------------------------------------------------------------
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NAAC Grade</title>
</head>
<body>
<center>
<%
try {
gradepack.NAACGrade_Service service = new gradepack.NAACGrade_Service();
gradepack.NAACGrade port = service.getNAACGradePort();
String choice = request.getParameter("college");
java.lang.String result = port.getGrade(choice);
out.println("Grade = " + result);
} catch (Exception ex) {
}
%>
</center>
</body>
</html>
==============================================================================================================
channel containing 2 functions – 1st function called getBreakingNews which accepts date as string parameter and returns special news of that day, 
2nd function called getPrediction accepts sunsign
Web service:-----------------------------------------------------------------------------------------------
package news;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
@WebService(serviceName = "NewsWebservice")
public class NewsWebservice {
@WebMethod(operationName = "getBreakingNews")
public String getBreakingNews() {
String breaking = "";
try {
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con =
DriverManager.getConnection("jdbc:derby://localhost:1527/NewsDatabase", "root", "1234569");
Statement stmt = con.createStatement();
ResultSet rest = stmt.executeQuery("SELECT * FROM BREAKINGNEWS");
rest.next();
breaking += rest.getString("NEWS");
} catch (Exception e) {
e.printStackTrace();
}
return breaking;
}
@WebMethod(operationName = "getPrediction")
public String getPrediction(@WebParam(name = "sunsign") String sunsign) {
String prediction = "";
try {
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con =
DriverManager.getConnection("jdbc:derby://localhost:1527/NewsDatabase", "root", "1234569");
Statement stmt = con.createStatement();
ResultSet rest = stmt.executeQuery("SELECT * FROM LUCK WHERE 
SUNSIGN='"+sunsign+"'");
rest.next();
prediction += rest.getString("PREDICTION");
} catch (Exception e) {
e.printStackTrace();
}
return prediction;
}
}
Client:-----------------
index.html:---------------------------------------------
<!DOCTYPE html>
<html>
<head>
<title>Newspaper service</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<center>
<form action="prediction.jsp">
<select name="sunsign">
<option value="Aries">Aries</option>
<option value="Taurus">Taurus</option>
<option value="Gemini">Gemini</option>
<option value="Cancer">Cancer</option>
<option value="Leo">Leo</option>
<option value="Virgo">Virgo</option>
<option value="Libra">Libra</option>
<option value="Scorpio">Scorpio</option>
<option value="Sagittarius">Sagittarius</option>
<option value="Capricorn">Capricorn</option>
<option value="Aquarius">Aquarius</option>
<option value="Pisces">Pisces</option>
</select>
<br><br>
<input type="submit" value="Get prediction" name="prediction" /><br><br>
</form>
<input type="submit" value="Get breaking news" name="news" onclick="location.href =
'final.jsp'" /><br><br>
</center>
</body>
</html>
prediction.jsp:------------------------------------------------------
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your prediction</title>
</head>
<body><center>
<hr/>
<%
String choice = request.getParameter("sunsign");
try {
news.NewsWebservice_Service service = new news.NewsWebservice_Service();
news.NewsWebservice port = service.getNewsWebservicePort();
java.lang.String result = port.getPrediction(choice);
out.println("Your prediction is: " + result);
} catch (Exception ex) {
ex.printStackTrace();
}
%>
<hr/>
</center>
</body>
</html>
final.jsp:-------------------------------------------------------------------
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Output</title>
</head>
<body>
<hr/>
<%
try {
news.NewsWebservice_Service service = new news.NewsWebservice_Service();
news.NewsWebservice port = service.getNewsWebservicePort();
java.lang.String result = port.getBreakingNews();
out.println("<center><h1>Breaking news = " + result+"</h1></center>");
} catch (Exception ex) {
ex.printStackTrace();
}
%>
<hr/>
</body>
</html>
==============================================================================================
Restful webservice from a database table Employee with columns empid,empname and Designation.
Web service:-----------
employee.java:---------------------------------------------------------
package emppack;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
@Entity
@Table(name = "EMPLOYEE")
@XmlRootElement
@NamedQueries({
@NamedQuery(name = "Employee.findAll", query = "SELECT e FROM Employee e"),
@NamedQuery(name = "Employee.findByEmpid", query = "SELECT e FROM Employee e WHERE 
e.empid = :empid"),
@NamedQuery(name = "Employee.findByEmpname", query = "SELECT e FROM Employee e WHERE 
e.empname = :empname"),
@NamedQuery(name = "Employee.findByDesignation", query = "SELECT e FROM Employee e WHERE 
e.designation = :designation")})
public class Employee implements Serializable {
private static final long serialVersionUID = 1L;
@Id
@Basic(optional = false)
@NotNull
@Size(min = 1, max = 50)
@Column(name = "EMPID")
private String empid;
@Basic(optional = false)
@NotNull
@Size(min = 1, max = 100)
@Column(name = "EMPNAME")
private String empname;
@Basic(optional = false)
@NotNull
@Size(min = 1, max = 100)
@Column(name = "DESIGNATION")
private String designation;
public Employee() {
}
public Employee(String empid) {
this.empid = empid;
}
public Employee(String empid, String empname, String designation) {
this.empid = empid;
this.empname = empname;
this.designation = designation;
}

public String getEmpid() {
return empid;
}
public void setEmpid(String empid) {
this.empid = empid;
}
public String getEmpname() {
return empname;
}
public void setEmpname(String empname) {
this.empname = empname;
}
public String getDesignation() {
return designation;
}
public void setDesignation(String designation) {
this.designation = designation;
}
@Override
public int hashCode() {
int hash = 0;
hash += (empid != null ? empid.hashCode() : 0);
return hash;
}
@Override
public boolean equals(Object object) {
// TODO: Warning - this method won't work in the case the id fields are not set
if (!(object instanceof Employee)) {
return false;
}
Employee other = (Employee) object;
if ((this.empid == null && other.empid != null) || (this.empid != null &&
!this.empid.equals(other.empid))) {
return false;
}
return true;
}
@Override
public String toString() {
return "emppack.Employee[ empid=" + empid + " ]";

}
}
EmployeeFacadeREST.java:----------------------------------------------------------------
package emppack.service;
import emppack.Employee;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
@Stateless
@Path("emppack.employee")
public class EmployeeFacadeREST extends AbstractFacade<Employee> {
@PersistenceContext(unitName = "RESTEmployeePU")
private EntityManager em;
public EmployeeFacadeREST() {
super(Employee.class);
}
@POST
@Override
@Consumes({"application/json"})
public void create(Employee entity) {
super.create(entity);
}
@PUT
@Path("{id}")
@Consumes({"application/json"})
public void edit(@PathParam("id") String id, Employee entity) {
super.edit(entity);
}
26
@DELETE
@Path("{id}")
public void remove(@PathParam("id") String id) {
super.remove(super.find(id));
}
@GET
@Path("{id}")
@Produces({"application/json"})
public Employee find(@PathParam("id") String id) {
return super.find(id);
}
@GET
@Override
@Produces({"application/json"})
public List<Employee> findAll() {
return super.findAll();
}
@GET
@Path("{from}/{to}")
@Produces({"application/json"})
public List<Employee> findRange(@PathParam("from") Integer from, @PathParam("to") Integer
to) {
return super.findRange(new int[]{from, to});
}
@GET
@Path("count")
@Produces("text/plain")
public String countREST() {
return String.valueOf(super.count());
}
@Override
protected EntityManager getEntityManager() {
return em;
}
}
==================================================================================================
Restful webservice from a database table Student with columns rollno, name and totalmarks
Web service:
student.java:
package studentpack;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
@Entity
@Table(name = "STUDENT")
@XmlRootElement
@NamedQueries({
@NamedQuery(name = "Student.findAll", query = "SELECT s FROM Student s"),
@NamedQuery(name = "Student.findByRollno", query = "SELECT s FROM Student s WHERE 
s.rollno = :rollno"),
@NamedQuery(name = "Student.findByName", query = "SELECT s FROM Student s WHERE s.name = 
:name"),
@NamedQuery(name = "Student.findByTotalmarks", query = "SELECT s FROM Student s WHERE 
s.totalmarks = :totalmarks")})
public class Student implements Serializable {
private static final long serialVersionUID = 1L;
@Id
@Basic(optional = false)
@NotNull
@Column(name = "ROLLNO")
private Integer rollno;
@Basic(optional = false)
@NotNull
@Size(min = 1, max = 50)
@Column(name = "NAME")
private String name;
@Basic(optional = false)
@NotNull
@Column(name = "TOTALMARKS")
private int totalmarks;
public Student() {
}
public Student(Integer rollno) {
this.rollno = rollno;
}
public Student(Integer rollno, String name, int totalmarks) {
this.rollno = rollno;
this.name = name;
this.totalmarks = totalmarks;
}
public Integer getRollno() {
return rollno;
}
public void setRollno(Integer rollno) {
this.rollno = rollno;
}
public String getName() {
return name;
}
public void setName(String name) {
this.name = name;
}
public int getTotalmarks() {
return totalmarks;
}
public void setTotalmarks(int totalmarks) {
this.totalmarks = totalmarks;
}
@Override
public int hashCode() {
int hash = 0;
hash += (rollno != null ? rollno.hashCode() : 0);
return hash;
}
@Override
public boolean equals(Object object) {
// TODO: Warning - this method won't work in the case the id fields are not set
if (!(object instanceof Student)) {
return false;
}
Student other = (Student) object;
if ((this.rollno == null && other.rollno != null) || (this.rollno != null &&
!this.rollno.equals(other.rollno))) {
return false;
}
return true;
}
@Override
public String toString() {
return "studentpack.Student[ rollno=" + rollno + " ]";
}
}
StudentFacadeREST.java:----------------------------------------------------------
package studentpack.service;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import studentpack.Student;
@Stateless
@Path("studentpack.student")
public class StudentFacadeREST extends AbstractFacade<Student> {
@PersistenceContext(unitName = "StudentDataServicePU")
private EntityManager em;
public StudentFacadeREST() {
super(Student.class);
}
@POST
@Override
@Consumes({"application/json"})
public void create(Student entity) {
super.create(entity);
}
@PUT
@Path("{id}")
@Consumes({"application/json"})
public void edit(@PathParam("id") Integer id, Student entity) {
super.edit(entity);
}
@DELETE
@Path("{id}")
public void remove(@PathParam("id") Integer id) {
super.remove(super.find(id));

}
@GET
@Path("{id}")
@Produces({"application/json"})
public Student find(@PathParam("id") Integer id) {
return super.find(id);
}
@GET
@Override
@Produces({"application/json"})
public List<Student> findAll() {
return super.findAll();
}
@GET
@Path("{from}/{to}")
@Produces({"application/json"})
public List<Student> findRange(@PathParam("from") Integer from, @PathParam("to") Integer
to) {
return super.findRange(new int[]{from, to});
}
@GET
@Path("count")
@Produces("text/plain")
public String countREST() {
return String.valueOf(super.count());
}
@Override
protected EntityManager getEntityManager() {
return em;
}
}
Client:------------
index.html:---------------------------------------------------------
<html>
<head>
<title>Student Details table</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
table {font-family: Arial, sans-serif;
border-collapse: collapse;}
td, th {
border: 2px solid #000000;
padding: 20px;
text-align: center;
}
</style>
<script>
var request = new XMLHttpRequest();
request.open('GET', 
'http://localhost:8080/StudentDataService/webresources/studentpack.student', true);
request.onload = function () {
if (request.status >= 200 && request.status < 400) {
var data = JSON.parse(this.response);
for (var i = 0; i < data.length; i++) {
var table = document.getElementById("myTable");
var row = table.insertRow();
var cell0 = row.insertCell(0);
var cell1 = row.insertCell(1);
var cell2 = row.insertCell(2);
cell0.innerHTML = data[i].rollno;
cell1.innerHTML = data[i].name;
cell2.innerHTML = data[i].totalmarks;
}
} else {
console.error('Error fetching data');
}
};
request.onerror = function () {
console.error('Request failed');
};
35
request.send();
</script>
</head>
<body>
<center>
<h1>Students Details</h1>
<div>
<table id="myTable">
<tr>
<th>Roll No.</th>
<th>Name</th>
<th>Total Marks</th>
</tr>
</table>
</div>
</center>
</body>
</html>
=============================================================================
WCF web service for arithmetic calculations
Web service:------------------
IService1.cs:-----------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
namespace ArtihmeticWCF
{
[ServiceContract]
public interface IService1
{
[OperationContract]
double add(double x, double y);
[OperationContract]
double subtract(double x, double y);
[OperationContract]
double multiply(double x, double y);
[OperationContract]
double divide(double x, double y);
}
}
IService1.svc.cs:-------------------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
namespace ArtihmeticWCF
{
public class Service1 : IService1
{
double IService1.add(double x, double y)
{
return x + y;
}
double IService1.divide(double x, double y)
{
return x / y;
}
double IService1.multiply(double x, double y)
{
return x * y;
}
double IService1.subtract(double x, double y)
{
return x - y;
}
}
}
Client:
Webform1.aspx:-------------------------------------------------------------------------
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" 
Inherits="ArtihmeticClient.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Arithmetic 
Operations"></asp:Label>
<br />
<br />
<asp:Label ID="Label2" runat="server" Text="Enter first number:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="Enter second number:"></asp:Label>
&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" />
&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Subtract"
/>
&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Multiply"
/>
&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Divide" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb
sp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label4" runat="server"></asp:Label>
</div>
</form>
</body>
</html>
Webform1.aspx.cs:-------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace ArtihmeticClient
{
public partial class WebForm1 : System.Web.UI.Page
{
protected void Button1_Click(object sender, EventArgs e)
{
ServiceReference1.Service1Client client = new ServiceReference1.Service1Client();
double x = double.Parse(TextBox1.Text);
double y = double.Parse(TextBox2.Text);
Label4.Text ="Addition: " + Convert.ToString(client.add(x, y));
}
protected void Button2_Click(object sender, EventArgs e)
{
ServiceReference1.Service1Client client = new ServiceReference1.Service1Client();
double x = double.Parse(TextBox1.Text);
double y = double.Parse(TextBox2.Text);
Label4.Text ="Subtraction: " + Convert.ToString(client.subtract(x, y));
}
protected void Button3_Click(object sender, EventArgs e)
{
ServiceReference1.Service1Client client = new ServiceReference1.Service1Client();
double x = double.Parse(TextBox1.Text);
double y = double.Parse(TextBox2.Text);
Label4.Text ="Multiplication: " + Convert.ToString(client.multiply(x, y));
}
protected void Button4_Click(object sender, EventArgs e)
{
ServiceReference1.Service1Client client = new ServiceReference1.Service1Client();
double x = double.Parse(TextBox1.Text);
double y = double.Parse(TextBox2.Text);
Label4.Text ="Division: " + Convert.ToString(client.divide(x, y));
}
}
}
=====================================================================================







