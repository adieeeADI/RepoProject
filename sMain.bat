1
#list or combo box
#list.html
<html>   
<body>   
<h1>Computer Science</h1>   
<ul> 
<li>GP</li>  
<li>Web Programming</li>   
<li>Python</li>   
<li>Java</li>   
<li>C Programming</li>   
<li>.NET</li>   
</ul>   
Choose a Character :   
<select>   
<option>Tarzan </option>   
<option>Doraemon</option> 
<option>Shinchan</option>   
<option>Pokaemon</option>   
</select>   
<body>   
</html>   
-----------------------------------------------------------------------
import java.util.List; 
import org.openqa.selenium.By; 
import org.openqa.selenium.WebDriver; 
import org.openqa.selenium.chrome.ChromeDriver;

public class STQAPract8 {
     public static void main(String[] args) {   
          
System.setProperty("webdriver.chrome.driver","C:\\Users\\ompra\\OneDrive\\Desktop\\files\\chromedriver.exe");          
WebDriver driver = new ChromeDriver();   
        driver.get("C:\\xampp\\htdocs\\stqa\\pract8.html");   
        driver.manage().window().maximize();   
        List list2 = driver.findElements(By.xpath("//select/option"));   
        List list1 = driver.findElements(By.xpath("//ul/li"));   
        System.out.println("Total no. of List: " +list1.size());   
        System.out.println("Total no. of Character: " + list2.size());   
   
    }
}
=====================================================================================================
2
#Checkbox
#checkbox.html
<html>   
<body>   
<input type="checkbox" checked>CS    
<br>   
<input type="checkbox" checked>IT   
<br>   
<input type="checkbox"checked>MBA   
<br>   
<input type="checkbox">EVS   
<br>   
<input type="checkbox">BMS   
<br>   
<input type="checkbox" checked>DS   
</body>   
</html>   

--------------------------------------------------------------------
import java.util.List; 
import org.openqa.selenium.By; 
import org.openqa.selenium.WebDriver;   
import org.openqa.selenium.WebElement; 

public class STQAPract9 {
     public static void main(String[] args) {  
System.setProperty("webdriver.chrome.driver","C:\\Users\\ompra\\OneDrive\\Desktop\\files\\chromedriver.exe");         
WebDriver driver = new  org.openqa.selenium.chrome.ChromeDriver();   
        driver.get("C:\\xampp\\htdocs\\stqa\\pract9.html");   
        driver.manage().window().maximize();   
        List<WebElement> check   =driver.findElements(By.xpath("//input[@type='checkbox']"));         
        System.out.println("Total no of checkboxes : " + check.size());          
        int checked_Count=0,unchecked_Count=0;          
for(int i=0;i<check.size();i++)    
        {              if(check.get(i).isSelected())   
            {   
                checked_Count++;   
            }             else   
            {    
                unchecked_Count++;    
            }   
        }   
        System.out.println("Number of selected checkboxes are : "   +checked_Count);   
        System.out.println("Number of unselected checkboxes are : "   +unchecked_Count);   
   
    }   

    
}
==========================================================================================================
3
#pass or fail
package pract5;
import java.io.FileInputStream; 
import java.io.FileOutputStream;  
import jxl.Sheet; 
import jxl.Workbook; 
import jxl.write.Label; 
import jxl.write.WritableSheet;   
import jxl.write.WritableWorkbook; 

public class Pract5 {
     private static Object WorkBook;
    public static void main(String[] args) throws Exception{
        FileInputStream fi=new FileInputStream("C:\\Users\\ompra\\OneDrive\\Desktop\\files\\Book1.xls");
        Workbook w=Workbook.getWorkbook(fi);
        Sheet s=w.getSheet(0);
        String a[][]=new String[s.getRows()][s.getColumns()];
        
        FileOutputStream fo=new FileOutputStream("C:\\Users\\ompra\\OneDrive\\Desktop\\files\\Book3.xls");
        WritableWorkbook wwb=Workbook.createWorkbook(fo);
        WritableSheet ws=wwb.createSheet("result1",0);
        for (int i=0;i<s.getRows();i++){
            for(int j=0;j<s.getColumns();j++){
                a[i][j]=s.getCell(j,i).getContents();
                Label l=new Label(j,i,a[i][j]);
                ws.addCell(l);
            }
        }
        Label l=new Label(6,0,"Result");
        ws.addCell(l);
        for (int i=1;i<s.getRows();i++){
            for(int j=5;j<s.getColumns();j++){
                a[i][j]=s.getCell(j,i).getContents();
                int x=Integer.parseInt(a[i][j]);
                if (x > 50) {
                    Label l1 = new Label(6, i, "PASS");
                    ws.addCell(l1);
                    } 
                else {
                    Label l1 = new Label(6, i, "FAIL");
                    ws.addCell(l1);
                    break; // This will stop checking further columns for this row
                }
            }
        }
        wwb.write();
        wwb.close();
    }

}
===================================================================================
4
#login 
#login.php
<?php
session_start();

$username = "sies";
$password = "sies1234";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if ($_POST["username"] === $username && $_POST["password"] === $password) {
        // Successful login
        $_SESSION["loggedin"] = true;
        header("Location: welcome.php"); // Redirect to welcome page
        exit();
    } else {
        $error = "Invalid username or password.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
</head>
<body>
    <h2>Login</h2>
    <form method="POST" action="">
        <label for="username">Username:</label>
        <input type="text" id="user" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="pass" name="password" required><br><br>
        <input type="submit" id="login" value="Login">
    </form>

    <?php
    if (isset($error)) {
        echo "<p style='color:red;'>$error</p>";
    }
    ?>
</body>
</html>
--------------------------------------------------------------------------------
#welcome.php
<?php
session_start();
if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("Location: prac4.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
</head>
<body>
    <h1>Welcome to the Dashboard!</h1>
    <p>You are now logged in.</p>
    <a href="prac4.php">Logout</a>
</body>
</html>

--------------------------------------------------------------------------------
package stqapract4;
import org.openqa.selenium.By; 
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;  
import org.openqa.selenium.WebElement;

public class STQAPract4 {
       public static void main(String[] args) {   
          
System.setProperty("webdriver.chrome.driver","C:\\Users\\ompra\\OneDrive\\Desktop\\files\\chromedriver.exe");          
WebDriver driver = new ChromeDriver();         
driver.get("http://localhost/STQA/login.php");         
driver.manage().window().maximize();         
driver.findElement(By.id("user")).sendKeys("sies");         
driver.findElement(By.id("pass")).sendKeys("sies123");   
        driver.findElement(By.id("login")).click();          
        if(driver.getTitle().contains("welcome"))   
        {   
            System.out.print("Login Successful!");   
        }         else   
        {   
            System.out.print("Login Failed!");   
   
        }   
    }   
    
}
===========================================================================================================
5
##open any website
package stqapract3;
import java.util.List; 
import org.openqa.selenium.By; 
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.WebElement;

public class STQApract3 {
      public static void main(String[] args) {   
          
System.setProperty("webdriver.chrome.driver","C:\\Users\\ompra\\OneDrive\\Desktop\\files\\chromedriver.exe");          
WebDriver driver = new ChromeDriver();         
driver.get("http://www.spotify.com");         
driver.manage().window().maximize();   
        List lists = driver.findElements(By.xpath("//select/option"));   
        System.out.println("Total no. of lists: " + lists.size());   
    }  
    
}
===================================================================================================
6
#percentage

import java.io.FileInputStream; 
import java.io.FileOutputStream;  
import jxl.Sheet; 
import jxl.Workbook; 
import jxl.write.Label; 
import jxl.write.WritableSheet;   
import jxl.write.WritableWorkbook; 

public class Pract6 {
    public static void main(String[] args) throws Exception{
        FileInputStream fi =new FileInputStream("C:\\Users\\ompra\\OneDrive\\Desktop\\files\\Book1.xls");
        Workbook w=Workbook.getWorkbook(fi);
        Sheet s=w.getSheet(0);
        String a[][]=new String[s.getRows()][s.getColumns()];
        
        FileOutputStream fo =new FileOutputStream("C:\\Users\\ompra\\OneDrive\\Desktop\\files\\Book2.xls");
        WritableWorkbook wb=Workbook.createWorkbook(fo);
        WritableSheet ws=wb.createSheet("result1",0);
        System.out.println();
        for (int i=0;i<s.getRows();i++){
            String temp[]=new String[s.getColumns()];
            boolean flag=false;
            for(int j=0;j<s.getColumns();j++){
                temp[j]=s.getCell(j,i).getContents();
                if(i>=1&&j>=2&&j<=4){
                    if(Integer.parseInt(temp[j])>=60){
                        flag=true;
                    }
                }
            }
            if(flag){
                for(int k=0;k<temp.length;k++){
                    Label l2=new Label(k,i,temp[k]);
                    ws.addCell(l2);
                }
            }
    }
        wb.write();
        wb.close();

  }

    
}

========================================================================================
7
#totallinksbuyttonfield
import java.util.List; import org.openqa.selenium.By; import 
org.openqa.selenium.WebDriver; import org.openqa.selenium.WebElement;   
import org.openqa.selenium.chrome.ChromeDriver;   
   
public class STQAPrac7 {       public static void main(String[] 
args) {   
          
System.setProperty("webdriver.chrome.driver","C:\\Users\\GR0012  
AU\\Documents\\Practical  
Downloads\\chromedriverwin32\\chromedriver.exe");          WebDriver driver = new 
ChromeDriver();         driver.get("http://www.google.com");         
driver.manage().window().maximize();          List<WebElement> links = 
driver.findElements(By.tagName("a"));          List<WebElement> buttons =  
driver.findElements(By.tagName("button"));         List<WebElement> fields =   
driver.findElements(By.tagName("input"));   
        System.out.println("Total No. of links = " +links.size());   
        System.out.println("Total No. of buttons = " +buttons.size());   
        System.out.println("Total No. of fields = " +fields.size());   
    }   
} 
===============================================================================================