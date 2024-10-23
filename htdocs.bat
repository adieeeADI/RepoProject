python program to perform translation operation on rectangle 
from tkinter import *
root = Tk()
C = Canvas(root, height=800, width=800)
C.create_text(400, 30, text="TCS2425044-AdityaParab-GameProgramming")
a = int(input("Enter x1: "))
b = int(input("Enter y1: "))
c = int(input("Enter x2: "))
d = int(input("Enter y2: "))
C.create_rectangle(a, b, c, d, fill="blue")
x = int(input("Enter translation factor Tx: "))
y = int(input("Enter translation factor Ty: "))
C.create_rectangle(a+x, b+y, c+x, d+y, fill="cyan")
C.pack()
root.mainloop()
=============================================================================================
python program to perform scaling operation on 
triangle by takin
from tkinter import *
root = Tk()
C = Canvas(root, height=800, width=800)
C.create_text(400, 30, text="TCS2425044-AdityaParab-GameProgramming")
a = int(input("Enter x1: "))
b = int(input("Enter y1: "))
c = int(input("Enter x2: "))
d = int(input("Enter y2: "))
e = int(input("Enter x3: "))
f = int(input("Enter y3: "))
C.create_polygon(a, b, c, d, e, f, fill="blue")
x = int(input("Enter scaling factor Sx: "))
y = int(input("Enter scaling factor Sy: "))
C.create_polygon(a * x, b * y, c * x, d * y, e * x, f * y, fill="cyan")
C.pack()
root.mainloop()
==============================================================================================
a python program to perform reflection operation on polygon
from tkinter import *
root = Tk()
C = Canvas(root, height=800, width=800)
C.create_text(400, 30, text="TCS2425044-AdityaParab-GameProgramming", 
font=("Arial", 20))
a = int(input("enter x1: "))
b = int(input("enter y1: "))
c = int(input("enter x2: "))
d = int(input("enter y2: "))
e = int(input("enter x3: "))
f = int(input("enter y3: "))
g = int(input("enter x4: "))
h = int(input("enter y4: "))
i = int(input("enter x5: "))
j = int(input("enter y5: "))
C.create_polygon(a, b, c, d, e, f, g, h, i, j, fill="blue")
k = 300
C.create_polygon(a, -b + 2*k, c, -d + 2*k, e, -f + 2*k, g, -h + 2*k, i, -j +
2*k, fill="cyan")
C.pack()
root.mainloop()
===================================================================================================
an program to rotate right angle triangle by 45 degrees
import math
from tkinter import *
root = Tk()
C = Canvas(root, height=800, width=800)
C.create_text(400, 30, text="TCS2425044-AdityaParab-GameProgramming", 
font=("Arial", 20))
def sine(a):
    return abs(math.sin(math.radians(a)))
def cosine(a):
    return abs(math.cos(math.radians(a)))
a = int(input("Enter x1: "))
b = int(input("Enter y1: "))
c = int(input("Enter x2: "))
d = int(input("Enter y2: "))
e = int(input("Enter x3: "))
f = int(input("Enter y3: "))
C.create_polygon(a, b, c, d, e, f, fill="cyan")
t = 45
a1 = a * cosine(t) - b * sine(t)
b1 = a * sine(t) + b * cosine(t)
c1 = c * cosine(t) - d * sine(t)
d1 = c * sine(t) + d * cosine(t)
e1 = e * cosine(t) - f * sine(t)
f1 = e * sine(t) + f * cosine(t)
print(a1, " ", b1)
C.create_polygon(a1, b1, c1, d1, e1, f1, fill="blue")
C.pack()
root.mainloop()
==============================================================================================
a python program to perform shearing on rectangle in positive direction of x-axis
from tkinter import *
import math
def tan(a):
    return abs(math.tan(math.radians(a)))
root = Tk()
C = Canvas(root, height=600, width=600)
print("Enter the coordinates of the polygon:")
a = int(input("Enter x1: "))
b = int(input("Enter y1: "))
c = int(input("Enter x2: "))
d = int(input("Enter y2: "))
e = int(input("Enter x3: "))
f = int(input("Enter y3: "))
g = int(input("Enter x4: "))
h = int(input("Enter y4: "))
t = 45
a1 = a + b * tan(t)
c1 = c + d * tan(t)
# Original Polygon
C.create_polygon(a, b, c, d, e, f, g, h, fill="blue")
# Sheared Polygon
C.create_polygon(a1, b, c1, d, e, f, g, h, fill="green")
C.create_text(300, 20, text="TCS2425044-Aditya Parab", font=("Arial", 20), fill="black")
C.pack()
mainloop()
==================================================================================================
a python program to create below shape and perform reflection about parallel to yaxis, followed by translation and scaling operation
from tkinter import *
root=Tk()
a=434
b=127
c=434
d=150
e=519
f=150
g=520
h=196
i=434
j=196
k=434
l=217
m=350
n=171
C=Canvas(root,height=1000,width=1000)
C.create_text(500, 50, text="TCS2425044-Aditya Parab", font=("Arial", 20), 
fill="black")
C.create_text(570,155,text="Original Figure")
C.create_polygon(a,b,c,d,e,f,g,h,i,j,k,l,m,n, fill="black")
y=350
C.create_text(120,171,text="Reflected Figure")
a1=-a+2*y
c1=-c+2*y
e1=-e+2*y
g1=-g+2*y
i1=-i+2*y
k1=-k+2*y
m1=-m+2*y
C.create_polygon(a1,b,c1,d,e1,f,g1,h,i1,j,k1,l,m1,n, fill="purple")
tx=400
ty=400
C.create_text(120+tx,171+ty,text="Translated Figure")
C.create_polygon(a1+tx,b+ty,c1+tx,d+ty,e1+tx,f+ty,g1+tx,h+ty,i1+tx,j+ty,k1+tx,l+ty,m1+tx,n+ty, fill="orange")
sx=2
sy=2
C.create_text(120+tx-200,171+ty-200,text="Scaled Figure")
C.create_polygon(a1*sx,b*sy,c1*sx,d*sy,e1*sx,f*sy,g1*sx,h*sy,i1*sx,j*sy,k1*sx,l*sy,m1*sx,n*sy, fill="orange")
C.pack()
mainloop()
===========================================================================
SPaceInvader
import pygame
import random
import math
from pygame import mixer

pygame.init()  # initializing pygame module
screen = pygame.display.set_mode((800, 600))  # Creating Screen, Screen size
pygame.display.set_caption("Space Invaders_71")  # Change game name
icon = pygame.image.load("C:/Users/ADITY/OneDrive/Desktop/SEM 5/practicalExams/Game Programming/GameProgramming/Practical/pract3gp/ufo.png")  # Change icon for game
pygame.display.set_icon(icon)

# background Image
background = pygame.image.load("C:/Users/ADITY/OneDrive/Desktop/SEM 5/practicalExams/Game Programming/GameProgramming/Practical/pract3gp/background.png")

# background sound
mixer.music.load('C:/Users/ADITY/OneDrive/Desktop/SEM 5/practicalExams/Game Programming/GameProgramming/Practical/pract3gp/background.wav')
mixer.music.play(-1)

# player
playerimg = pygame.image.load("C:/Users/ADITY/OneDrive/Desktop/SEM 5/practicalExams/Game Programming/GameProgramming/Practical/pract3gp/player.png")
playerX = 370
playerY = 480
playerX_change = 0

# enemy
enemyimg = []
enemyX = []
enemyY = []
enemyX_change = []
enemyY_change = []
num_of_enemies = 6
for i in range(num_of_enemies):
    enemyimg.append(pygame.image.load("C:/Users/ADITY/OneDrive/Desktop/SEM 5/practicalExams/Game Programming/GameProgramming/Practical/pract3gp/enemy.png"))
    enemyX.append(random.randint(0, 735))
    enemyY.append(random.randint(50, 150))
    enemyX_change.append(3)
    enemyY_change.append(40)

# Bullet
bulletimg = pygame.image.load("C:/Users/ADITY/OneDrive/Desktop/SEM 5/practicalExams/Game Programming/GameProgramming/Practical/pract3gp/bullet.png")
bulletX = 0
bulletY = 480
bulletX_change = 0
bulletY_change = 10
bullet_state = "ready"

# Score
score_value = 0
font = pygame.font.Font('freesansbold.ttf', 32)
over_font = pygame.font.Font('freesansbold.ttf', 64)
name_roll_font = pygame.font.Font('freesansbold.ttf', 24)  # Font for name and roll number
textX = 10
textY = 10

# Game Over Flag
game_over = False

def show_score(x, y):
    score = font.render("Score : " + str(score_value), True, (255, 255, 255))
    screen.blit(score, (x, y))

def game_over_text():
    over_text = over_font.render("GAME OVER", True, (255, 255, 255))
    screen.blit(over_text, (200, 250))

def player(x, y):
    screen.blit(playerimg, (x, y))

def enemy(x, y, i):
    screen.blit(enemyimg[i], (x, y))  # drawing enemy on screen

def fire_bullet(x, y):
    global bullet_state
    bullet_state = "fire"
    screen.blit(bulletimg, (x + 16, y + 10))

def isCollision(enemyX, enemyY, bulletX, bulletY):
    distance = math.sqrt((math.pow(enemyX - bulletX, 2)) + (math.pow(enemyY - bulletY, 2)))
    return distance < 27

def show_name_roll():
    name_roll_text = name_roll_font.render("Aditya", True, (255, 255, 255))
    screen.blit(name_roll_text, (screen.get_width() // 2 - name_roll_text.get_width() // 2, 10))

# Stop Condition
running = True
while running:
    screen.fill((0, 0, 0))  # Change background
    screen.blit(background, (0, 0))

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        if not game_over:
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT:  # left key is pressed
                    playerX_change = -4
                if event.key == pygame.K_RIGHT:  # right key is pressed
                    playerX_change = 4
                if event.key == pygame.K_SPACE:
                    if bullet_state == "ready":
                        bullet_sound = mixer.Sound('C:/Users/ADITY/OneDrive/Desktop/SEM 5/practicalExams/Game Programming/GameProgramming/Practical/pract3gp/laser.wav')
                        bullet_sound.play()
                        bulletX = playerX
                        fire_bullet(bulletX, bulletY)

            if event.type == pygame.KEYUP:
                if event.key == pygame.K_LEFT or event.key == pygame.K_RIGHT:
                    playerX_change = 0

    if not game_over:
        playerX += playerX_change
        # player boundary
        if playerX <= 0:
            playerX = 0
        elif playerX >= 736:
            playerX = 736

        # enemy movement
        for i in range(num_of_enemies):
            # Game over condition
            if enemyY[i] > 400:
                for j in range(num_of_enemies):
                    enemyY[j] = 2000  # move enemies off the screen
                game_over = True
                break

            enemyX[i] += enemyX_change[i]
            if enemyX[i] <= 0:
                enemyX_change[i] = 1
                enemyY[i] += enemyY_change[i]
            elif enemyX[i] >= 736:
                enemyX_change[i] = -1
                enemyY[i] += enemyY_change[i]

            # Collision detection
            collision = isCollision(enemyX[i], enemyY[i], bulletX, bulletY)
            if collision:
                explosion_sound = mixer.Sound('C:/Users/ADITY/OneDrive/Desktop/SEM 5/practicalExams/Game Programming/GameProgramming/Practical/pract3gp/explosion.wav')
                explosion_sound.play()
                bulletY = 480
                bullet_state = "ready"
                score_value += 1
                enemyX[i] = random.randint(0, 735)
                enemyY[i] = random.randint(50, 150)

            enemy(enemyX[i], enemyY[i], i)

        # Bullet movement
        if bulletY <= 0:
            bulletY = 480
            bullet_state = "ready"
        if bullet_state == "fire":
            fire_bullet(bulletX, bulletY)
            bulletY -= bulletY_change

    else:
        game_over_text()

    player(playerX, playerY)
    show_score(textX, textY)
    show_name_roll()

    pygame.display.update()  
==================================================================================
snake
import pygame
import time
import random

pygame.init()


snake_color = (16, 76, 227)  
food_color = (255, 69, 0)  
text_color = (70, 70, 70)
black = (0, 0, 0)  


width = 800
height = 600


bg_image = pygame.image.load("C:/Users/ADITY/Downloads/Newfolder/backgroung.jpg")
bg_image = pygame.transform.scale(bg_image, (width,height))

dis = pygame.display.set_mode((width, height))
pygame.display.set_caption('Snake Game-TCS2425019')


clock = pygame.time.Clock()

snake_size = 10
snake_speed = 15

font_style = pygame.font.SysFont("arial", 25)
score_font = pygame.font.SysFont("aptos narrow", 35)

def snake(snake_size, snake_list):
    for x in snake_list:
        pygame.draw.circle(dis, snake_color, (x[0], x[1]), snake_size // 2)

def final_score(score):
    value = score_font.render("Your Score: " + str(score), True, text_color)
    dis.blit(value, [0, 0])

def end_message(msg, color):
    mesg = font_style.render(msg, True, color)
    dis.blit(mesg, [width / 6, height / 3])

def show_name_roll():
    name_roll_text = font_style.render("Vignesh Hebbar - TCS2425019", True, black)
    dis.blit(name_roll_text, [300,0])

def gameLoop():
    game_over = False
    game_close = False
    x1 = width / 2
    y1 = height / 2
    x2 = 0
    y2 = 0
    snake_List = []
    snake_length = 1
    foodx = round(random.randrange(0, width - snake_size) / 10.0) * 10.0
    foody = round(random.randrange(0, height - snake_size) / 10.0) * 10.0

    while not game_over:

        while game_close:
            dis.blit(bg_image, (0, 0))
            end_message("You Lost! Press Space-Play Again or Esc-Quit", text_color)
            final_score(snake_length - 1)
            show_name_roll()
            pygame.display.update()

            for event in pygame.event.get():
                if event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_ESCAPE:
                        game_over = True
                        game_close = False
                    if event.key == pygame.K_SPACE:
                        gameLoop()

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                game_over = True
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT:
                    x2 = -snake_size
                    y2 = 0
                elif event.key == pygame.K_RIGHT:
                    x2 = snake_size
                    y2 = 0
                elif event.key == pygame.K_UP:
                    y2 = -snake_size
                    x2 = 0
                elif event.key == pygame.K_DOWN:
                    y2 = snake_size
                    x2 = 0

        if x1 >= width or x1 < 0 or y1 >= height or y1 < 0:
            game_close = True
        x1 += x2
        y1 += y2
        dis.blit(bg_image, (0, 0)) 
        pygame.draw.circle(dis, food_color, (int(foodx), int(foody)), snake_size // 2)
        snake_start = [x1, y1]
        snake_List.append(snake_start)
        if len(snake_List) > snake_length:
            del snake_List[0]

        for x in snake_List[:-1]:
            if x == snake_start:
                game_close = True

        snake(snake_size, snake_List)
        final_score(snake_length - 1)
        show_name_roll()

        pygame.display.update()

        if x1 == foodx and y1 == foody:
            foodx = round(random.randrange(0, width - snake_size) / 10.0) * 10.0
            foody = round(random.randrange(0, height - snake_size) / 10.0) * 10.0
            snake_length += 1

        clock.tick(snake_speed)

    pygame.quit()
    quit()

gameLoop()
===================================================================================================================================
Unity 3d Balls:
CameraController------------------
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class cameracontroller : MonoBehaviour
{
    // Start is called before the first frame update
            private Vector3 offset;
            public GameObject player;


    void Start()
    {
        offset = transform.position - player.transform.position;
    }

    

    // Update is called once per frame
    void Update()
    {
        transform.position = player.transform.position + offset;

    }
   

}
playercontroller---------------------------------------------
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class playercontroller : MonoBehaviour
{
    // Start is called before the first frame update
    public Text winText;
    public Text countText;
    public int count;
    private Rigidbody rb;
    public float speed;

    void Start()
    {
        count = 0;
        winText.text = "";
        rb = GetComponent<Rigidbody>();
        SetCountText();

    }

    // Update is called once per frame
    void Update()
    {
        float moveHorizontal = Input.GetAxis("Horizontal"); 
        float moveVertical = Input.GetAxis("Vertical");
        Vector3 movement = new Vector3(moveHorizontal, 0.0f, moveVertical); 
        rb.AddForce(movement*speed);

    }
    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("PickUp"))
        {
            other.gameObject.SetActive(false);
            count = count + 1;
            SetCountText();
        }
    }
    void SetCountText()
    {
        countText.text = "Count : " + count.ToString();
        if (count >= 8)
        {
            winText.text = "You win!";
        }

    }

}
rotator-----------------------------------------------
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class rotator : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        transform.Rotate(new Vector3(15, 30, 45) * Time.deltaTime);
    }
}
===============================================================================
unity 2d ball
cameracontroller----------------------------------------------
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class cameracontroller : MonoBehaviour
{
    public GameObject player;
    private Vector3 offset;
    // Start is called before the first frame update
    void Start()
    {
        offset = transform.position - player.transform.position;
    }

    // Update is called once per frame
    void Update()
    {
        transform.position = player.transform.position + offset;
    }
}
playercontroller----------------------------------------------
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class playercontroller : MonoBehaviour
{
    // Start is called before the first frame update
    public Text winText;
 public Text countText;
 public int count=0;
 private Rigidbody2D rbd;
 public float speed;

    

    void Start()
    {
        rbd = GetComponent<Rigidbody2D>();
    }

    // Update is called once per frame
    void Update()
    {
         float moveHorizontal = Input.GetAxis("Horizontal");
float moveVertical = Input.GetAxis("Vertical");
 Vector2 movement = new Vector2(moveHorizontal, moveVertical);
rbd.AddForce(movement * speed);

    }
    void OnTriggerEnter2D(Collider2D other)
 {
 if (other.tag == "pickup")
 {
 other.gameObject.SetActive(false);
 count++;
 SetCountText();
 }
 }
 void SetCountText()
 {
 countText.text = "Count" + count.ToString();
 if (count == 5)
 {
 winText.text = "You Win";
 }
 }

}
rotator-----------------------------------------------------------
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewBehaviourScript : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        transform.Rotate(new Vector3(0, 0, 45) * Time.deltaTime);

    }
}
======================================


