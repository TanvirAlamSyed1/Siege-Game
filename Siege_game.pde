PImage background;// creates image variable
//https://www.maxpixel.net/Castle-Gate-Medieval-Towers-Animal-Castle-Wall-156676
defenders player1;// calls an empty defender object
ArrayList<ball>ball_list;// initiate lists of ball and attackers
ArrayList<attackers>attacker_list;
boolean gamemode = true;// allows the game to carry on if true
int score = 0;//stores the score
PrintWriter scoresheet;

void setup()
{

  size (1500, 750);
  background = loadImage("background.png");//loads background image
  background.resize(width, height);//makes image of the size of the screen
  player1 = new defenders(750, 150, 10, 10);// creates an instance of the defender
  ball_list = new ArrayList<ball>();// empty lists of objects
  attacker_list = new ArrayList<attackers>();
  enemyspawner();//spawns in new enemies
}

void draw()
{
  if (gamemode == false)// if the player has lost, it takes you to a waiting screen
  {
    textSize(100);
    fill(255); //white screen
    rect(0, 0, width, height);
    fill(0);// black text
    text("GAME ENDED", 100, 100);
    text("SCORE: " + str(score), 100, 500);
    text("press B to restart", 100, 300);
    highscorechecker(score);
  } else
  {
    image(background, 750, 375);//refreshes the background
    textSize(50);
    fill(0);// black text
    text("Score: "+score, 550, 100);
    player1.update();//updates players movements
    for (attackers a : attacker_list)
    {
      if (player1.collision(a))
      {
        player1.collisiondraw();//draws collision/blood
        gamemode = false;//gamemode is off
      }
      a.update();
    }
    if (ball_list.isEmpty() == false)// if ball list isn't empty
    {
      for (int b = ball_list.size()-1; b>0; b--)// for every ball in the list
      {
        for ( int a = attacker_list.size()-1; a>=0; a--)//and for every attacker on the screen
        {
          if (attacker_list.get(a).collision(ball_list.get(b)) == true)//if the ball hits the attacker
          {
            attacker_list.remove(attacker_list.get(a));//gets rid of both attacker and ball from their respective lists
            ball_list.remove(ball_list.get(b));
            score = score+1;//adds 1 to the users score
            break;
          }
        }
      }
    }
    for (int b = ball_list.size()-1; b>0; b-- )// once  all collisions are cleared, you can update the balls and aliens
    {
      ball_list.get(b).update();
    }
  }
  if (attacker_list.isEmpty() == true)// this adds attackers once all 4 attackers are killed
  {
    enemyspawner();//uses the spawner code
  }
}


void keyPressed()
{
  if (player1.x <= 200)// if player hits left side wall
  {
    player1.x = 220;//stop image from moving past wall
  } else if (player1.x >= width-200)// if player hits right side wall
  {
    player1.x = width-220;//stop player from passing right side wall
  } else
  {
    player1.move();// locate players new location
  }
  if (key == 'b' || key == 'B' && gamemode == false)
  {
    gamemode = true;
    ball_list.clear();//clears all the balls in the previous game
    score = 0;//makes score 0
    attacker_list.clear();//removes all the attackers from previous game
    enemyspawner();//adds new enemies into the game
  }

  if ( key == 'x' || key == 'X' /*&& gamemode == false*/)// if player shoots ball
  {
    ball_list.add(new ball(player1));// add ball to list
  }
}

boolean highscorechecker(int score)
{
  String [] s = loadStrings("highscore.txt");//loads in the score
  int filescore = int(s[0]);//stores the score from the file
  if (score>filescore)// if score is bigger than score in file
  {
    scoresheet = createWriter("highscore.txt") ;//overwriters the files
    scoresheet.println(str(score));//puts in new score into the file
    scoresheet.close();//close file
    return true;//returns true
  } else
  {
    return false;
  }
}
/*note: I tried to output the message onto the waiting screen but for some reason it never worked. 
The code above still works and is useful as it updates the file , but its true purpose was to output a boolean statement too
*/
void enemyspawner()
{
  for (int num = 4; num >0; num--)//for num is 4, take one away from num each loop
  {
    attacker_list.add(new attackers());//adds attacker to each loop
  }
}
