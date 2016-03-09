import de.bezier.guido.*;
public final static int NUM_ROWS = 20;
public final static int NUM_COLS = 20;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new ArrayList <MSButton>(); //ArrayList of just the minesweeper buttons that are mined


void setup ()
{
  size(400, 400);
  textAlign(CENTER, CENTER);

  // make the manager
  Interactive.make( this );

  buttons = new MSButton[NUM_ROWS][NUM_COLS];

  for (int i = 0; i < NUM_ROWS; i++) {

    for (int j = 0; j < NUM_COLS; j++) {

      buttons[i][j] = new MSButton(i, j);
    }
  }
  setBombs();
}
public void setBombs()
{
  int row, col;

  for (int i = 0; i < 100; i++) {
    row=(int)(Math.random()*20);
    col=(int)(Math.random()*20);
    if (bombs.contains(buttons[row][col]) == false) {
      bombs.add(buttons[row][col]);
    }
  }
}

public void draw ()
{
  background(0);
  if (isWon())
    displayWinningMessage();
}
public boolean isWon()
{
  //your code here
  return false;
}
public void displayLosingMessage()
{
  //your code here
}
public void displayWinningMessage()
{
  //your code here
}

public class MSButton
{
  private int r, c;
  private float x, y, width, height;
  private boolean clicked, marked;
  private String label;

  public MSButton ( int rr, int cc )
  {
    width = 400/NUM_COLS;
    height = 400/NUM_ROWS;
    r = rr;
    c = cc; 
    x = c*width;
    y = r*height;
    label = "";
    marked = clicked = false;
    Interactive.add( this ); // register it with the manager
  }
  public boolean isMarked()
  {
    return marked;
  }
  public boolean isClicked()
  {
    return clicked;
  }
  // called by manager

  public void mousePressed () 
  {
    clicked = true;
    //your code here
  }

  public void draw () 
  {    
    if (marked)
      fill(0);
    else if ( clicked && bombs.contains(this) ) 
      fill(255, 0, 0);
    else if (clicked)
      fill( 200 );
    else 
    fill( 100 );

    rect(x, y, width, height);
    fill(0);
    text(label, x+width/2, y+height/2);
  }
  public void setLabel(String newLabel)
  {
    label = newLabel;
  }
  public boolean isValid(int r, int c)
  {
    if (r >= 0 && r <= 9 && c <= 9 && c >= 0) {
      return true;
    } else {

      return false;
    }
  }
  public int countBombs(int row, int col)
  {
    int numBombs = 0;
    //your code here
    for (int i = 0; i < NUM_COLS; i++) {
      for (int j = 0; i < NUM_ROWS; j++) {
        if (isValid(row+1, col) == true && bombs.contains(buttons[row+1][col]) == true) {

          numBombs++;
        }
        if (isValid(row, col+1) == true && bombs.contains(buttons[row][col+1]) == true) {

          numBombs++;
        }
        if (isValid(row-1, col) == true && bombs.contains(buttons[row-1][col]) == true) {

          numBombs++;
        }
        if (isValid(row, col-1) == true && bombs.contains(buttons[row+1][col-1]) == true) {

          numBombs++;
        }
        if (isValid(row+1, col+1) == true && bombs.contains(buttons[row+1][col+1]) == true) {

          numBombs++;
        }
        if (isValid(row-1, col-1) == true && bombs.contains(buttons[row+1][col]) == true) {

          numBombs++;
        }
                  if(isValid(row+1,col-1) == true && bombs.contains(buttons[row+1][col-1]) == true){
          
            numBombs++;
          }
                    if(isValid(row-1,col+1) == true && bombs.contains(buttons[row-1][col+1]) == true){
          
            numBombs++;
          }
      }
    } 
    return numBombs;
  }
}