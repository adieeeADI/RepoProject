=============================================================
Prac 3
javafile------------------------------
package stqa3;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;



public class STQA3 {

    public static void main(String[] args) {
      System.setProperty("webdriver.chrome.driver","C:\cdriver\chromedriver.exe");
 WebDriver driver = new ChromeDriver();
 driver.get("https://www.amazon.com/");
 driver.manage().window().maximize();
 //driver.close();
    }

}
=============================================================
Prac4
package stqa4;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
public class STQA4 {


    public static void main(String[] args) {
        System.setProperty("webdriver.chrome.driver","C:\cdriver\chromedriver.exe");
 WebDriver driver = new ChromeDriver();
 driver.manage().window().maximize();
 driver.get("http://localhost/stqa4/login.php");
 driver.findElement(By.id("username")).sendKeys("aa");
 driver.findElement(By.id("password")).sendKeys("aa");
 driver.findElement(By.id("submit")).click();
 if (driver.getTitle().contains("welcome")) {
 System.out.println("Logged in successfully");
 //driver.close();
 } else {
 System.out.println("Failed to login");
 //driver.quit();
 }
 }


    }
php------------------
<html>
    <head><title>LOG IN</title> </head>
    <body>
        <form name="form1" method="post" >
            <label> Enter Username:</label>
            <input type="text" name="uname" id="uname" ><br>
            <label> Enter Password:</label>
            <input type="text" name="pass" id="pass" >
            <button type="submit" name="submit" id="submit" >LOG IN</button>
        </form>
    </body>
    <?php
    if(isset($_POST['submit']))
    {
        $u=$_POST['uname'];
        $p=$_POST['pass'];

        if($u=="aa" && $p=="aa")
        {
            echo "Successful LOGIN";
            header("Location: welcome.html");
            exit();
        }
        else{
            echo "INVALID CREDENTIALS";
        }
}
    ?>
</html>
-----------------------------
<!DOCTYPE html>
<html>
    <head>
        <title>
            welcome
        </title>

    </head>
    <body> <h1>Successful login</h1></body>
</html>
=========================================================================
prac5
package stqa5;
import java.util.List;
import org.openqa.selenium.By;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class STQA5 {


    public static void main(String[] args) {
        System.setProperty("webdriver.chrome.driver","C:\cdriver\chromedriver.exe");
 WebDriver driver = new ChromeDriver();
 driver.manage().window().maximize();
 driver.get("https://flipkart.in/");
 List<WebElement> links = driver.findElements(By.tagName("a"));
 List<WebElement> buttons = 
driver.findElements(By.tagName("button"));
 List<WebElement> fields = driver.findElements(By.tagName("input"));
 System.out.println("Total no. of links: " + links.size());
 System.out.println("Total no. of buttons: " + buttons.size());
 System.out.println("Total no. of fields: " + fields.size());

    }

}
=======================================================================================
prac6 excel
Excel Prac 6
package excel;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;



public class Excel {


    public static void main(String[] args) throws FileNotFoundException, IOException, BiffException, WriteException {
        FileInputStream fi=new FileInputStream("C:\Users\s\OneDrive\Desktop\practice\stqa\Marks.xls");
        FileOutputStream fo=new FileOutputStream("C:\Users\\OneDrive\Desktop\practice\stqa\Total.xls");
        Workbook wb=Workbook.getWorkbook(fi);
        Sheet s=wb.getSheet(0);

        WritableWorkbook wwb=Workbook.createWorkbook(fo);
        WritableSheet ws=wwb.createSheet("Total",0);

        int columncount=s.getColumns();

        for (int i=0;i<columncount;i++)
        {
            String label=s.getCell(i,0).getContents();
            ws.addCell(new Label(i,0,label));
        }
        ws.addCell(new Label(columncount,0,"Total"));
        ws.addCell(new Label(columncount+1,0,"Result"));

        for (int i=1;i<s.getRows();i++)
        {
            int totalmarks=0;
            for(int j=0;j<s.getColumns();j++)
            {
                  String label=s.getCell(j,i).getContents();
                  ws.addCell(new Label(j,i,label));
                  if (j>1)
                  {
                      totalmarks+=Integer.parseInt(label);
                  }
            }
            String result=totalmarks/3>35 ? "PASS":"FAIL";
             ws.addCell(new Label(columncount,i,Integer.toString(totalmarks)));
             ws.addCell(new Label(columncount+1,i,result));

        }

        wwb.write();
        wwb.close();
    }

}
prac
======================================================================
prac 8

package stqa8;

import java.util.List;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class STQA8 {
    public static void main(String[] args) {
          System.setProperty("webdriver.chrome.driver","C:\cdriver\chromedriver.exe");
          WebDriver driver = new ChromeDriver();
           driver.get("http://localhost/stqa8.html");
          List<WebElement> lists=driver.findElements(By.xpath("//ul/li"));
          System.out.println("no of list items:"+lists.size());
 
          List<WebElement> option=driver.findElements(By.xpath("//select/option"));
           System.out.println("no of options in combobox:"+option.size());

          List<WebElement> checkboxes=driver.findElements(By.cssSelector("input[type='checkbox']"));
             System.out.println("no of checkboxes:"+checkboxes.size());
        int checked=0; int unchecked=0;
             for (WebElement checkbox:checkboxes)
             {
                 if (checkbox.isSelected())
                 {
                     checked++;
                 }
                 else{
                     unchecked++;
                 }
             }

               System.out.println("Checked:"+checked);
               System.out.println("UnChecked:"+unchecked);
}
}
--------------------------------------------------------
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Combo Box and List Items</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
        }
        .container {
            width: 50%;
            margin: auto;
            text-align: center;
        }
        select {
            width: 200px;
            padding: 10px;
            margin-top: 20px;
        }
        ul {
            margin-top: 20px;
            list-style-type: circle;
        }
    </style>
</head>
<body>
    <h1>Static Page with Combo Box and List</h1>

    <div class="container">
        <h2>Select an Option</h2>
        <!-- Combo box -->
        <select id="optionsCombo">
            <option value="option1">Option 1</option>
            <option value="option2">Option 2</option>
            <option value="option3">Option 3</option>
            <option value="option4">Option 4</option>
        </select>

        <!-- Unordered List -->
        <h2>List of Items</h2>
        <ul>
            <li>Item 1</li>
            <li>Item 2</li>
            <li>Item 3</li>
            <li>Item 4</li>
            <li>Item 5</li>
        </ul>

        <input type="checkbox" id="option1" name="option1" value="option1" checked>
        <label for="option1">Option 1 (Checked)</label><br>

        <input type="checkbox" id="option2" name="option2" value="option2">
        <label for="option2">Option 2 (Unchecked)</label><br>

        <input type="checkbox" id="option3" name="option3" value="option3" checked>
        <label for="option3">Option 3 (Checked)</label><br>

        <input type="checkbox" id="option4" name="option4" value="option4">
        <label for="option4">Option 4 (Unchecked)</label><br>
    </div>
</body>
</html>
==================================================================================
#pract9.html
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