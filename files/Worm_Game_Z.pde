/* author: Nicolas Hurt
           15-102 D
           nhurt@andrew.cmu.edu
           copyright © Nicolas Hurt
           August 2009
           Pittsburgh 15213
           All Rights Reserved
*/

/**
<B>The Worm Game</B><P>
<HR>

*/

  //W
  float [] wX = {75.8, 79.8, 81.1, 81.5, 81.8, 83.1, 85.3, 87.4, 90.4, 97.8, 105.2, 110.5, 114.3, 118.9, 125.8, 
                 132.5, 135.2, 137.7,142.3, 150.3, 156.6, 160.2, 162.5, 163.4, 163.7, 165.2, 166.8, 167.6, 167.8, 167.8};
  float [] wY = {73.4, 80.3, 88.2, 96.2, 104.2, 112.1, 119.8, 127.5, 134.9, 137.9, 134.9, 128.9, 121.9, 115.3, 111.3,
                 115.7, 123.2, 130.9, 137.3, 137.7, 132.7, 125.5, 117.9, 109.9, 101.9, 94.1, 86.2, 78.3, 70.3, 70.3};
  //O
  float [] oX = {201.5, 199.9, 198.1, 197.4, 198.2, 200.0, 203.7, 208.0, 213.5, 220.3, 228.1, 236.1, 243.2, 247.7, 250.9,
                 253.1, 254.3, 254.6, 254.8, 254.9, 254.3, 252.8, 249.7, 244.8, 238.5, 231.1, 223.2, 215.7, 210.1, 205.0};
  float [] oY = {102.3, 110.1, 117.9, 125.9, 133.8, 141.6, 148.7, 155.4, 161.3, 165.6, 167.1, 166.4, 162.8, 156.2,
                 148.8, 141.2, 133.2, 125.3, 117.3, 109.3, 101.3, 93.4, 86.1, 79.7, 74.8, 71.7, 71.2, 74.1, 79.8, 86.0};
  //R
  float [] rX = {297.7, 297.9, 297.9, 297.9, 297.9, 297.9, 297.9, 297.9, 297.9, 297.9, 299.9, 307.7, 315.7, 323.3, 330.3,
                 336.7, 340.6, 341.4, 337.9, 331.7, 324.7, 317.7, 312.2, 316.3, 322.6, 329.5, 335.8, 342.2, 347.8, 347.8};
  float [] rY = {138.7, 130.7, 122.7, 114.7, 106.7, 98.7, 90.7, 82.7, 74.7, 66.7, 58.9, 57.2, 57.7, 60.1, 64.0, 68.9,
                 75.8, 83.8, 91.0, 96.0, 99.9, 103.8, 109.6, 116.5, 121.4, 125.4, 130.4, 135.2, 140.8, 140.8};
  //M
  float [] mX = {368.6, 369.2, 370.9, 372.4, 373.3, 374.9, 376.9, 379.2, 381.5, 383.6, 390.1, 395.1, 399.3, 403.4,406.9,
                 412.9, 417.6, 421.3, 425.7, 429.1, 434.4, 437.2, 438.3, 440.3, 441.8, 443.2, 445.6, 447.9, 449.9, 449.9};
  float [] mY = {137.4, 129.4, 121.6, 113.7, 105.8, 97.9, 90.2, 82.5, 74.9, 67.1, 71.8, 78.0, 84.8, 91.7, 98.9,
                 93.5, 87.1,80.0, 73.3, 66.0, 72.0, 79.5, 87.4, 95.2, 103.0, 110.9, 118.5, 126.2, 133.9, 133.9};

float theta;
float theta2_, theta3_, theta4_;
float [] wormPartsX = new float[30];
float [] wormPartsY = new float[30];
float [] wormParts2X = new float[30];
float [] wormParts2Y = new float[30];
float [] wormParts3X = new float[30];
float [] wormParts3Y = new float[30];
float [] wormParts4X = new float[30];
float [] wormParts4Y = new float[30];
float wormdx, wormdy;
float mousedx, mousedy;
int wormRadius = 12;
boolean contact;
int tempframe;
int wormColors;
int segmentcolor = color(255,150,120);

float blobRadius = 10;
float [] blobsx1_ = {380,300, 65,375, 80,400,125,225,180};
float [] blobsy1_ = {240,290,410,100, 60,400,330,360,140};
boolean [] blobsdead1;


float [] blobsx2_ = { 100, 100, 250, 250, 400, 400,-500,1000,1000,-700,1200,1200,-700, 250, 250,-900,1400,  100,  200,  300,  400,-1200,-1300,-1400,-1500,-1200,-1200,-1200,-1200,-1200,2200,2300,2400,2500};
float [] blobsy2_ = {-100,-300, 600, 800,-100,-300, 250, 100, 400,-700,-700,1200,1200,-900,1400, 250, 250,-1200,-1300,-1400,-1500,  100,  200,  300,  400,   50,  150,  250,  350,  450, 100, 200, 300, 400};
float [] blobsdx2 = {   0,   0,   0,   0,   0,   0,   2,  -2,  -2,   2,  -2,  -2,   2,   0,   0,   2,  -2,    0,    0,    0,    0,    2,    2,    2,    3,   1.3,  1.3,  1.3,  1.3,  1.3,  -2,  -2,  -2,  -2};
float [] blobsdy2 = {   2,   2,  -2,  -2,   2,   2,   0,   0,   0,   2,   2,  -2,  -2,   2,  -2,   0,   0,    2,    2,    2,    2,    0,    0,    0,    0,    0,    0,    0,    0,    0,   0,   0,   0,   0};
boolean [] blobsdead2;

float [] blobsx3_ = {-100,-200,-350, 700, 200,   0,-100,   0, 350, 600,1000,-1000,-1200,1400,1600,-100, -200,2300,-2400, 360, 120,2400,-2600, 2100,2400,6000,-6000,-3000,-3000,3500,  120, 200, 300,  380};
float [] blobsy3_ = {  70, 100, 150, 400,-200, 800,-200,-500,-200,  50, 800, 1000, -100,-300, 800,1800,-2000,2300,  300,2400,2600, 700,-2500,-1200, 300,4800, 6000,  150,  350, 250,-2500,3000,3000,-2500};
float [] blobsdx3 = {   3,   5,   3,  -8,   1,   2,   2,   1,  -1,  -2,  -3,    2,    5,  -6,  -4,   1,    2,  -6,    5,   0,   0,  -5,    6,   -1,  -2,  -9,    8,    6,    6,  -6,    0,   0,   0,    0};
float [] blobsdy3 = {   0,   0,   0,   0,   3,  -3,   3,   5,   2,   1,  -4,   -2,    1,   2,  -2,  -8,    7,  -6,    0,   4,  -7,  -1,    6,    2,   1,  -12,  -8,    0,    0,   0,    4,  -4,  -4,    4};
boolean [] blobsdead3;

float ratio; //for seeking blob, level 4 & 5
float blobsx4_ = 25;
float blobsy4_ = 25;
float blobsdx4,blobsdy4;
boolean blobsdead4 = false;

float [] blobsx5_  = {150,350,350,150};
float [] blobsy5_  = {150,150,350,350};
float [] blobsdx5  = {  0,  0,  0,  0};
float [] blobsdy5  = {  0,  0,  0,  0};
boolean [] blobsdead5;
float blobx5 = 500;
float bloby5 = 500;
boolean blobdead5 = false;
float [] blobsRadius5;
float [] blobsdRadius5;
float [] blobsStroke5;
float [] blobsdStroke5;
float blobdx5,blobdy5;

float [] blobsx6_ = {-150,-150,-150,-150,-150,-150,-150,-150,-150,-250,-250,-250,-250,-250,-250,-250,-250,-250,-350,-350,-350,-350,-350,-350,-350,-350,-350,  25,  75, 125, 175, 225, 275, 325, 375, 425, 475,  25,  75, 125, 175, 225, 275, 325, 375, 425, 475,  25,  75, 125, 175, 225, 275, 325, 375, 425, 475,-200,700,700,-200};
float [] blobsy6_ = {  50, 100, 150, 200, 250, 300, 350, 400, 450,  50, 100, 150, 200, 250, 300, 350, 400, 450,  50, 100, 150, 200, 250, 300, 350, 400, 450,-150,-150,-150,-150,-150,-150,-150,-150,-150,-150,-250,-250,-250,-250,-250,-250,-250,-250,-250,-250,-250,-250,-250,-250,-250,-250,-250,-250,-250,-250,-200,-200,700,700};
float [] blobsdx6 = {   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  -1,  -1,  -1,  -1};
float [] blobsdy6 = {   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,  -1,  -1,  -1,  -1};
boolean [] blobsdead6;

float [] blobsx7_ =  {-400,-350,-300,-250,-200,-150,-100, -50,   0,1000, 950, 800, 850, 800, 750, 700, 650, 600, 550, 500,1200,1300,-1000, 1450, 125,1200,-600,-700,-750,-650};
float [] blobsy7_ =  { 450, 500, 550, 600, 650, 700, 750, 800, 850, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 100, 220,-1000,-1000,1200,1200, 350, 300, 450, 200};
float [] blobsdx7_ = {   2,   2,   2,   2,   2,   2,   2,   2,   2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2, -20, -20,   27,  -27,   0, -20,  20,  20,  19,  20};
float [] blobsdy7_ = {  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,  -2,   0,   0,   27,   27, -20, -20,   0,   0,   0,   0};
float [] blobsdx7;
float [] blobsdy7;
boolean [] blobsdead7;

float [] blobsx8_ = {100,100,400,400,-300,-300, 800, 800,1000,1100,1200,1300,1400};
float [] blobsy8_ = {100,400,400,100,-300, 800, 800,-300, 100, 200, 250, 300, 400};
float [] blobsdx8_ ={  0,  0,  0,  0,  -1,  -1,  -1,  -1, -20, -20, -20, -20, -20};
float [] blobsdy8_ ={  0,  0,  0,  0,  -1,  -1,  -1,  -1,   0,   0,   0,   0,   0};
float [] blobsdx8;
float [] blobsdy8;
boolean [] blobsdead8;

float [] blobsx9_ = {100,200,300,400,100,200,300,400,100,200,300,400,100,200,300,400, 650};
float [] blobsy9_ = {100,100,100,100,200,200,200,200,300,300,300,300,400,400,400,400, 250};
float [] blobsdx9 = {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  -1};
float [] blobsdy9 = {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  -1};
float [] blobsRadius9;
float [] blobsdRadius9;
float [] blobsStroke9;
float [] blobsdStroke9;
boolean [] blobsdead9;

float [] blobsx10_ = {250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250,250};
float [] blobsy10_ = {-50,-58,-66,-74,-82,-90,-98,-106,-114,-122,-130,-138,-146,-154,-162,-170,-178,-186,-194,-202};
float [] blobsdx10 = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
float [] blobsdy10 = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
float [] blobsRadius10;
float [] blobsdRadius10;
float [] blobsStroke10;
float [] blobsdStroke10;
boolean [] blobsdead10;

//Blob arrays that will be modified
float [] blobsx1;
float [] blobsy1;
float [] blobsx2;
float [] blobsy2;
float [] blobsx3;
float [] blobsy3;
float blobsx4;
float blobsy4;
float [] blobsx5;
float [] blobsy5;
float [] blobsx6;
float [] blobsy6;
float [] blobsx7;
float [] blobsy7;
float [] blobsx8;
float [] blobsy8;
float [] blobsx9;
float [] blobsy9;
float [] blobsx10;
float [] blobsy10;

//Blobs stunned and killed
boolean [] blobsfrozen1;
boolean [] blobsfrozen2;
boolean [] blobsfrozen3;
boolean blobsfrozen4;
boolean blobfrozen5;
boolean [] blobsfrozen5;
boolean [] blobsfrozen6;
boolean [] blobsfrozen7;
boolean [] blobsfrozen8;
boolean [] blobsfrozen9;
boolean [] blobsfrozen10;
int killed;

//Lasers
float[] laserx1,laserx2,lasery1,lasery2,laserdx,laserdy;
int [] lasertarget, laserstart;
boolean[] shot;
int contactframe = -100;
int laserframe;
int laserReload = 10;

float[] robolaserx1,robolaserx2,robolasery1,robolasery2,robolaserdx,robolaserdy;
boolean[] roboshot;
int robolaserframe;
int robolaserReload = 100;

//Powerups
boolean triplelaser, shockwave, homing, matrix;
float r,g,b,x,y,diam;
float frame;
int framerate;
int bullettime;
boolean space;
float shockx, shocky, shockframe;
int shockammo;
float shockreload = 120;

//HP
int hp;
boolean [] hpcaptured;
float hpx, hpy;
int bosshits = 0;
float bossframe = 360;

//Death screen
int killframe;
float [] bloodx, bloody;
float bx1, bx2, bx3, bx4;

boolean levelstart = false;
boolean mouseclicked = true;
boolean drawworms;
int level;
int mode;

//Typing cheats
String codeinput;
boolean unlocked = false;
boolean enter = false;

PFont menuText;
PFont menuText2;
PFont menuText3;
PFont menuText4;
PFont menuText5;

void setup()
{
  bossframe = 360;
  shockframe = -1000;
  enter = false;
  unlocked = false;
  drawworms = true;
  laserframe= -1000;
  killed = 0;
  blobx5 = 500;
  bloby5 = 500;
  blobdead5 = false;
  blobsdead4 = false;
  bosshits = 0;
  mode = 0;
  blobsx1 = new float[blobsx1_.length];
  blobsy1 = new float[blobsx1_.length];
  blobsx2 = new float[blobsx2_.length];
  blobsy2 = new float[blobsx2_.length];
  blobsx3 = new float[blobsx3_.length];
  blobsy3 = new float[blobsx3_.length];
  blobsx5 = new float[blobsx5_.length];
  blobsy5 = new float[blobsx5_.length];
  blobsfrozen1 = new boolean[blobsx1.length];
  blobsfrozen2 = new boolean[blobsx2.length];
  blobsfrozen3 = new boolean[blobsx3.length];
  blobsfrozen5 = new boolean[blobsx5.length];
  blobsfrozen6 = new boolean[blobsx6_.length];
  blobsfrozen7 = new boolean[blobsx7_.length];
  blobsfrozen8 = new boolean[blobsx8_.length];
  blobsfrozen9 = new boolean[blobsx9_.length];
  blobsfrozen10 = new boolean[blobsx10_.length];
  blobsdRadius5 = new float[blobsx5.length];
  blobsRadius5 = new float[blobsx5.length];
  blobsStroke5 = new float[blobsx5.length];
  blobsdStroke5 = new float[blobsx5.length];
  blobsdRadius9 = new float[blobsx9_.length];
  blobsRadius9 = new float[blobsx9_.length];
  blobsStroke9 = new float[blobsx9_.length];
  blobsdStroke9 = new float[blobsx9_.length];
  blobsdRadius10 = new float[blobsx10_.length];
  blobsRadius10 = new float[blobsx10_.length];
  blobsStroke10 = new float[blobsx10_.length];
  blobsdStroke10 = new float[blobsx10_.length];
  for(int i = 0; i < blobsx1_.length; i++)
  {
    blobsx1[i] = blobsx1_[i];
    blobsy1[i] = blobsy1_[i];
  }
  for(int i = 0; i < blobsx2_.length; i++)
  {
    blobsx2[i] = blobsx2_[i];
    blobsy2[i] = blobsy2_[i];
  }
  for(int i = 0; i < blobsx3_.length; i++)
  {
    blobsx3[i] = blobsx3_[i];
    blobsy3[i] = blobsy3_[i];
  }
  for(int i = 0; i < blobsx5_.length; i++)
  {
    blobsx5[i] = blobsx5_[i];
    blobsy5[i] = blobsy5_[i];
    blobsRadius5[i] = 10;
    blobsdRadius5[i] = .06;
    blobsStroke5[i] = 1;
    blobsdStroke5[i] = .0024;
  }
  blobsx4 = blobsx4_;
  blobsy4 = blobsy4_;
  blobsdead1 = new boolean[blobsx1.length];
  blobsdead2 = new boolean[blobsx2.length];
  blobsdead3 = new boolean[blobsx3.length];
  blobsdead5 = new boolean[blobsx5.length];
  blobsdead6 = new boolean[blobsx6_.length];
  blobsdead7 = new boolean[blobsx7_.length];
  blobsdead8 = new boolean[blobsx8_.length];
  blobsdead9 = new boolean[blobsx9_.length];
  blobsdead10 = new boolean[blobsx10_.length];
  for(int i = 0; i < blobsx1.length; i++)
  {
    blobsdead1[i] = false;
  }
    for(int i = 0; i < blobsx2.length; i++)
  {
    blobsdead2[i] = false;
  }
  for(int i = 0; i < blobsx3.length; i++)
  {
    blobsdead3[i] = false;
  }
  for(int i = 0; i < blobsx5.length; i++)
  {
    blobsdead5[i] = false;
  }
    for(int i = 0; i < blobsfrozen1.length; i++)
  {
    blobsfrozen1[i] = false;
  }
    for(int i = 0; i < blobsfrozen2.length; i++)
  {
    blobsfrozen2[i] = false;
  }
    for(int i = 0; i < blobsfrozen3.length; i++)
  {
    blobsfrozen3[i] = false;
  }
  blobsfrozen4 = false;
  blobfrozen5 = false;
    for(int i = 0; i < blobsfrozen5.length; i++)
  {
    blobsfrozen5[i] = false;
  }
  blobsx6 = new float [blobsx6_.length];
  blobsy6 = new float [blobsy6_.length];
  for(int i = 0; i < blobsx6_.length; i++)
  {
    blobsx6[i] = blobsx6_[i];
    blobsy6[i] = blobsy6_[i];
    blobsdead6[i] = false;
    blobsfrozen6[i] = false;
  }
  blobsx7 = new float [blobsx7_.length];
  blobsy7 = new float [blobsy7_.length];
  blobsdx7 = new float [blobsdx7_.length];
  blobsdy7 = new float [blobsdy7_.length];
  for(int i = 0; i < blobsx7_.length; i++)
  {
    blobsx7[i] = blobsx7_[i];
    blobsy7[i] = blobsy7_[i];
    blobsdx7[i] = blobsdx7_[i];
    blobsdy7[i] = blobsdy7_[i];
    blobsdead7[i] = false;
    blobsfrozen7[i] = false;
  }
  blobsx8 = new float [blobsx8_.length];
  blobsy8 = new float [blobsy8_.length];
  blobsdx8 = new float [blobsdx8_.length];
  blobsdy8 = new float [blobsdy8_.length];
  for(int i = 0; i < blobsx8_.length; i++)
  {
    blobsx8[i] = blobsx8_[i];
    blobsy8[i] = blobsy8_[i];
    blobsdx8[i] = blobsdx8_[i];
    blobsdy8[i] = blobsdy8_[i];
    blobsdead8[i] = false;
    blobsfrozen8[i] = false;
  }
  blobsx9 = new float [blobsx9_.length];
  blobsy9 = new float [blobsy9_.length];
  for(int i = 0; i < blobsx9_.length; i++)
  {
    blobsx9[i] = blobsx9_[i];
    blobsy9[i] = blobsy9_[i];
    blobsdead9[i] = false;
    blobsfrozen9[i] = false;
    blobsRadius9[i] = 10;
    blobsdRadius9[i] = .02;
    blobsStroke9[i] = 1;
    blobsdStroke9[i] = .0024;
  }
  blobsx10 = new float [blobsx10_.length];
  blobsy10 = new float [blobsy10_.length];
  for(int i = 0; i < blobsx10_.length; i++)
  {
    blobsx10[i] = blobsx10_[i];
    blobsy10[i] = blobsy10_[i];
    blobsdead10[i] = false;
    blobsfrozen10[i] = false;
    blobsRadius10[i] = 10;
    blobsdRadius10[i] = .06;
    blobsStroke10[i] = 1;
    blobsdStroke10[i] = .0024;
  }
  menuText = loadFont("f1.vlw");
  menuText2 = loadFont("f2.vlw");
  menuText3 = loadFont("f3.vlw");
  menuText4 = loadFont("f4.vlw");
  menuText5 = loadFont("f5.vlw");
  size(500,500);
  background(255);
  smooth();
  
  frame=0;
  diam=10;
  x=width/2;
  y=height/2;
  //You can temporarily change the level here:
                                                                              level = 1;
  for(int i = 0; i < wX.length; i++)
  {
    wormPartsX[i] = wX[i];
    wormPartsY[i] = wY[i];
    wormParts2X[i] = oX[i];
    wormParts2Y[i] = oY[i];
    wormParts3X[i] = rX[i];
    wormParts3Y[i] = rY[i];
    wormParts4X[i] = mX[i];
    wormParts4Y[i] = mY[i];
  }
  wormColors = color(210,100,60);//color(255,130,190);
  contact = false;
  hp = 3;
  framerate = 60;
  bullettime = -1;
  triplelaser = false;
  homing = false;
  shockwave = false;
  matrix = false;
  frame = 0;
  laserx1 = new float[15];
  laserx2 = new float[15];
  lasery1 = new float[15];
  lasery2 = new float[15];
  laserdx = new float[15];
  laserdy = new float[15];
  shot = new boolean[15];
  robolaserx1 = new float[5];
  robolaserx2 = new float[5];
  robolasery1 = new float[5];
  robolasery2 = new float[5];
  robolaserdx = new float[5];
  robolaserdy = new float[5];
  roboshot = new boolean[5];
  robolaserframe = -1000;
  lasertarget = new int[15];
  laserstart = new int[15];
  for(int i = 0; i < 15; i++){
    if(i<5){
      roboshot[i] = false;
    }
    shot[i] = false;
    lasertarget[i] = -1;
    laserstart[i] = -1000;
  }
  bloodx = new float[1000];
  bloody = new float[1000];
  for(int i = 0; i < bloody.length; i++)
  {
    bloodx[i] = 1000;
    bloody[i] = 1000;
  }
  hpcaptured = new boolean[10];
  for(int i =0; i < hpcaptured.length; i++) hpcaptured[i] = false;
}

void draw()
{
  framerate = 60;
  if(mode == 1 && ((bullettime > 0 && space)) || (frameCount - shockframe < shockreload)){
    noStroke();
    fill(255, 80);
    rect(0, 0, 500, 500);
  }else background(255);//, 55 + 100 * (sin(frameCount * 100) + 1), 55 + 100 * (sin(frameCount * 100) + 1));
  
  if(mode == 1)
  {
    framerate = 60;
    if(bullettime > 0 && space)
    {
      framerate = 30;
      bullettime--;
    }
    if(frameCount - shockframe < 60)
    {
      framerate = 15 + floor((frameCount - shockframe) * .5);
    }
    frameRate(framerate);
    if (hp <= 0)
    {
      killframe = frameCount;
      mode = 4;
      bx1 = random(0,500);
      bx2 = random(0,500);
      bx3 = random(0,500);
      bx4 = random(0,500);
    }
    else{
      if(level == 1 && killed >= blobsx1.length){
        level++;
        frame = 0;
        killed = 0;
      }
      else if(level == 2 && frame >= 1360){
        level++;
        frame = 0;
        killed = 0;
      }
      else if(level == 3 && frame >= 1120){
        level++;
        frame = 0;
        killed = 0;
      }
      else if(level == 4 && killed >= 1){
        level++;
        frame = 0;
        killed = 0;
      }
      else if(level == 5 && killed >= 5){
        level++;
        frame = 0;
        killed = 0;
      }
      else if(level == 6 && killed >= 4){
        level++;
        frame = 0;
        killed = 0;
      }
      else if(level == 7 && killed >= 10){
        level++;
        frame = 0;
        killed = 0;
      }
      else if(level == 8 && killed >= 13){
        level++;
        frame = 0;
        killed = 0;
      }
      else if(level == 9 && killed >= 17){
        level++;
        frame = 0;
        killed = 0;
      }
      else if(level == 10 && killed >= 20){
        level = 1;
        killed = 0;
        mode = 9; 
        frame = 0;
      }
    }
    frame++;
    wormdx = wormRadius;
    wormdy = wormRadius;
    if(frame < 120)
    {
      contact = true;
      contactframe = frameCount;
      storeWormParts();
      drawWorm();
      leveltransition();
    }
    else
    {
      storeWormParts();
      blobContact();
      drawWorm();
      captureBoundary();
      drawBlobs();
      drawPowerups();  
      powerupContact();
      laser();
      displayhud();
    }
    if(frame <= 240) levelstart = true;
    else{
      levelstart = false;
      unlocked = false;
    }
  }
  else
  {
    framerate = 60;
    frameRate(framerate);
  }
  if(mode == 0)
  { menu(); }
  if(mode == 4)
  {
    storeWormParts();
    drawWorm();
    deathscreen();
  }
  if(mode == 2)
  { tutorial(); }
  if(mode == 3)
  { cheatcodes(); }
  if(mode == 5)
  { tutorial2(); }
  if(mode == 6)
  { tutorial3(); }
  if(mode == 7)
  { tutorial4(); }
  if(mode == 8)
  { credits(); }
  if(mode == 9)
  { frame++;winscreen(); }
}

void mousePressed(){
  //laserframe = frameCount;
  //if(mode == 0 && mouseX<=250 && mouseX>=150 && mouseY<=225 && mouseY>=195) mode = 1;
}

void mouseReleased(){
  mouseclicked = true;
}

void menu()
{
  enter = false;
  drawworms = true;
  for(int i = 0; i < wX.length; i++)
  {
    wormPartsX[i] = wX[i];
    wormPartsY[i] = wY[i];
  }
  theta2_ = random(0, 2 * PI);
  theta3_ = random(0, 2 * PI);
  theta4_ = random(0, 2 * PI);
  codeinput = "";
  textAlign(LEFT);
  textFont(menuText,38);
  fill(255,150,120);
  text("The",30,50);
  textAlign(CENTER);
  textFont(menuText2,100);
  text("Game",250,260);
  fill(80);
  textFont(menuText3,34);
  text("Play",250,330);
  text("Tutorial",250,380);
  text("Cheats",250,430);
  textFont(menuText4,16);
  text("From the maker of Pimple Popper",250,490);
  textFont(menuText4,16);
  text("[CREDITS]",455,490);
//      strokeWeight(0);
//      stroke(0);
//      noFill();
//      rect(210,300,78,35);
//      rect(180,350,140,35);
//      rect(190,400,120,35);
//      rect(418,476,73,19);
  if(mousePressed == true && mouseclicked && mouseX<=288 && mouseX>=210 && mouseY<=335 && mouseY>=300)
  {
    mouseclicked = false;
    mode = 1;
  }
  if(mousePressed == true && mouseclicked && mouseX<=320 && mouseX>=180 && mouseY<=385 && mouseY>=350)
  {
    mouseclicked = false;
    mode = 2;
  }
  if(mousePressed == true && mouseclicked && mouseX<=310 && mouseX>=190 && mouseY<=435 && mouseY>=400)
  {
    mouseclicked = false;
    mode = 3;
  }
  if(mousePressed == true && mouseclicked && mouseX<=491 && mouseX>=418 && mouseY<=495 && mouseY>=476)
  {
    mouseclicked = false;
    mode = 8;
  }
  stroke(80);
  strokeWeight(2);
  if(mouseX<=288 && mouseX>=210 && mouseY<=335 && mouseY>=300)
  { line(210,335,288,335); }
  if(mouseX<=320 && mouseX>=180 && mouseY<=385 && mouseY>=350)
  { line(180,385,320,385); }
  if(mouseX<=310 && mouseX>=190 && mouseY<=435 && mouseY>=400)
  { line(190,435,310,435); }
  strokeWeight(1);
  if(mouseX<=491 && mouseX>=418 && mouseY<=495 && mouseY>=476)
  { line(418,493,491,493); }

  for(int i = 0; i < wX.length; i++)
  {
    noStroke();
    fill(210,100,60);
    ellipse(wX[i],wY[i],wormRadius,wormRadius);
    ellipse(oX[i],oY[i],wormRadius,wormRadius);
    ellipse(rX[i],rY[i],wormRadius,wormRadius);
    ellipse(mX[i],mY[i],wormRadius,wormRadius);
  }
  strokeWeight(wormRadius+2);
  stroke(255,150,120);
  line(wX[9],wY[9],wX[10],wY[10]);
  line(wX[10],wY[10],wX[11],wY[11]);
  line(wX[11],wY[11],wX[12],wY[12]);
  line(wX[12],wY[12],wX[13],wY[13]);
  line(oX[9],oY[9],oX[10],oY[10]);
  line(oX[10],oY[10],oX[11],oY[11]);
  line(oX[11],oY[11],oX[12],oY[12]);
  line(oX[12],oY[12],oX[13],oY[13]);
  line(rX[9],rY[9],rX[10],rY[10]);
  line(rX[10],rY[10],rX[11],rY[11]);
  line(rX[11],rY[11],rX[12],rY[12]);
  line(rX[12],rY[12],rX[13],rY[13]);
  line(mX[9],mY[9],mX[10],mY[10]);
  line(mX[10],mY[10],mX[11],mY[11]);
  line(mX[11],mY[11],mX[12],mY[12]);
  line(mX[12],mY[12],mX[13],mY[13]);
}

void leveltransition(){
  fill(255,150,120, 127.0 * (sin(frame * PI / 120) + 1.0));
  textAlign(CENTER);
  textFont(menuText3,48);
  if(level < 10) text("Level " + level, 250, 250);
  else text("BOSS MODE", 250, 250);
  fill(255,0, 0, 127.0 * (sin(frame * PI / 120) + 1.0));
  if(unlocked) text("UNLOCKED", 250, 300);
  else if(level > 1){
    textFont(menuText3,24);
    if(level == 2) text("Level Code: NOOB", 250, 300);
    if(level == 3) text("Level Code: WORMY", 250, 300);
    if(level == 4) text("Level Code: HOMIE", 250, 300);
    if(level == 5) text("Level Code: PWNED", 250, 300);
    if(level == 6) text("Level Code: CHAOS", 250, 300);
    if(level == 7) text("Level Code: LAZER", 250, 300);
    if(level == 8) text("Level Code: HAXOR", 250, 300);
    if(level == 9) text("Level Code: MOOSE", 250, 300);
    if(level == 10) text("Level Code: BOSSY", 250, 300);
  }
}

void storeWormParts()
{
  float stretchFactor = 8;
  mousedx = abs(mouseX - wormPartsX[wormPartsX.length-1]);
  mousedy = abs(mouseY - wormPartsY[wormPartsY.length-1]);
  float theta = atan(mousedy * (1/mousedx));
  wormdx = stretchFactor * cos(theta);
  wormdy = stretchFactor * sin(theta);
  
  if(dist(mouseX,mouseY,wormPartsX[wormPartsX.length-1],wormPartsY[wormPartsY.length-1]) > wormRadius)
  {
    if(hp <= 0){
      for(int i=bloody.length - 1; i > 0; i--){
        bloodx[i] = bloodx[i - 1];
        bloody[i] = bloody[i - 1];
      }
      bloodx[0] = wormPartsX[wormPartsX.length-1];
      bloody[0] = wormPartsY[wormPartsX.length-1];
    }
    if(mouseX > wormPartsX[wormPartsX.length-1])
    { wormPartsX[wormPartsX.length-1] = wormPartsX[wormPartsX.length-1] + wormdx; }
    else if(mouseX < wormPartsX[wormPartsX.length-1])
    { wormPartsX[wormPartsX.length-1] = wormPartsX[wormPartsX.length-1] - wormdx; }
    if(mouseY > wormPartsY[wormPartsY.length-1])
    { wormPartsY[wormPartsY.length-1] = wormPartsY[wormPartsY.length-1] + wormdy; }
    else if(mouseY < wormPartsY[wormPartsY.length-1])
    { wormPartsY[wormPartsY.length-1] = wormPartsY[wormPartsY.length-1] - wormdy; }
    for(int i=0; i<wormPartsX.length-1; i++)
    {
      wormPartsX[i] = wormPartsX[i+1];
      wormPartsY[i] = wormPartsY[i+1];
    }
  }
  
  if(frame < 240 && drawworms)
  {
    float theta2 = theta2_ + sin(frame * .3);
    float theta3 = theta3_ + sin(frame * .3);
    float theta4 = theta4_ + sin(frame * .3);
    
    mousedx = abs(1000 * cos(theta2) - wormParts2X[wormParts2X.length-1]);
    mousedy = abs(1000 * sin(theta2) - wormParts2Y[wormParts2Y.length-1]);
    theta = atan(mousedy * (1/mousedx));
    wormdx = stretchFactor * cos(theta);
    wormdy = stretchFactor * sin(theta);
  
    
      if(1000 * cos(theta2) > wormParts2X[wormParts2X.length-1])
      { wormParts2X[wormParts2X.length-1] = wormParts2X[wormParts2X.length-1] + wormdx; }
      else if(1000 * cos(theta2) < wormParts2X[wormParts2X.length-1])
      { wormParts2X[wormPartsX.length-1] = wormParts2X[wormPartsX.length-1] - wormdx; }
      if(1000 * sin(theta2) > wormParts2Y[wormPartsY.length-1])
      { wormParts2Y[wormPartsY.length-1] = wormParts2Y[wormPartsY.length-1] + wormdy; }
      else if(1000 * sin(theta2) < wormParts2Y[wormPartsY.length-1])
      { wormParts2Y[wormPartsY.length-1] = wormParts2Y[wormPartsY.length-1] - wormdy; }
      for(int i=0; i<wormPartsX.length-1; i++)
      {
        wormParts2X[i] = wormParts2X[i+1];
        wormParts2Y[i] = wormParts2Y[i+1];
      }
    
    mousedx = abs(1000 * cos(theta3) - wormParts3X[wormPartsX.length-1]);
    mousedy = abs(1000 * sin(theta3) - wormParts3Y[wormPartsY.length-1]);
    theta = atan(mousedy * (1/mousedx));
    wormdx = stretchFactor * cos(theta);
    wormdy = stretchFactor * sin(theta);
  
    
      if(1000 * cos(theta3) > wormParts3X[wormPartsX.length-1])
      { wormParts3X[wormPartsX.length-1] = wormParts3X[wormPartsX.length-1] + wormdx; }
      else if(1000 * cos(theta3) < wormParts3X[wormPartsX.length-1])
      { wormParts3X[wormPartsX.length-1] = wormParts3X[wormPartsX.length-1] - wormdx; }
      if(1000 * sin(theta3) > wormParts3Y[wormPartsY.length-1])
      { wormParts3Y[wormPartsY.length-1] = wormParts3Y[wormPartsY.length-1] + wormdy; }
      else if(1000 * sin(theta3) < wormParts3Y[wormPartsY.length-1])
      { wormParts3Y[wormPartsY.length-1] = wormParts3Y[wormPartsY.length-1] - wormdy; }
      for(int i=0; i<wormPartsX.length-1; i++)
      {
        wormParts3X[i] = wormParts3X[i+1];
        wormParts3Y[i] = wormParts3Y[i+1];
      }
    
    mousedx = abs(1000 * cos(theta4) - wormParts4X[wormPartsX.length-1]);
    mousedy = abs(1000 * sin(theta4) - wormParts4Y[wormPartsY.length-1]);
    theta = atan(mousedy * (1/mousedx));
    wormdx = stretchFactor * cos(theta);
    wormdy = stretchFactor * sin(theta);
  
    
    
      if(1000 * cos(theta4) > wormParts4X[wormPartsX.length-1])
      { wormParts4X[wormPartsX.length-1] = wormParts4X[wormPartsX.length-1] + wormdx; }
      else if(1000 * cos(theta4) < wormParts4X[wormPartsX.length-1])
      { wormParts4X[wormPartsX.length-1] = wormParts4X[wormPartsX.length-1] - wormdx; }
      if(1000 * sin(theta4) > wormParts4Y[wormPartsY.length-1])
      { wormParts4Y[wormPartsY.length-1] = wormParts4Y[wormPartsY.length-1] + wormdy; }
      else if(1000 * sin(theta4) < wormParts4Y[wormPartsY.length-1])
      { wormParts4Y[wormPartsY.length-1] = wormParts4Y[wormPartsY.length-1] - wormdy; }
      for(int i=0; i<wormPartsX.length-1; i++)
      {
        wormParts4X[i] = wormParts4X[i+1];
        wormParts4Y[i] = wormParts4Y[i+1];
      }
  } else drawworms = false;
}

void drawWorm()
{
  if(hp <= 0){
    strokeWeight(wormRadius);
    strokeCap(ROUND);
    for(int i = 0; i < bloodx.length-1; i++)
    {
      if(bloodx[i + 1] == 1000) break;
      stroke(255, 0, 0);
      line(bloodx[i], bloody[i], bloodx[i+1], bloody[i+1]);
    }
  }
  strokeCap(ROUND);
  if(hp > 0 && contact == true)
  { 
    if(!levelstart){
      tempframe = 120 + contactframe - frameCount;
      wormColors = color(255,0,0,55 + 100 * (sin(tempframe * tempframe * .004) + 1));
      segmentcolor = color(255,150,120,55 + 100 * (cos(tempframe * tempframe * .004) + 1));
    }
    else
    {
      float oldratio = 0;
      float newratio = 1;
      if(frame < 120)
      {
        newratio = frame / 120.0;
        oldratio = (120 - frame) / 120.0;
      }
      segmentcolor = color(210 * oldratio + 100 * newratio, 100, 60 * oldratio + 255 * newratio, 255 * oldratio + (55 + 100 * (sin(frame * frame * .002) + 1)) * newratio);
      wormColors = color(255 * oldratio + 60 * newratio, 150 * oldratio, 120 * oldratio + 200 * newratio, 255 * oldratio + (55 + 100 * (cos(frame * frame * .002) + 1)) * newratio);
    }
  }
  else
  {
    wormColors = color(210,100,60);//color(255,130,190); }
    segmentcolor = color(255,150,120);
  }
  noStroke();
  for(int i=0; i<wormPartsX.length; i++)
  {
    fill(wormColors);
    ellipse(wormPartsX[i],wormPartsY[i],wormRadius,wormRadius);
    if(frame < 240 && drawworms){
      fill(210,100,60);
      ellipse(wormParts2X[i],wormParts2Y[i],wormRadius,wormRadius);
      ellipse(wormParts3X[i],wormParts3Y[i],wormRadius,wormRadius);
      ellipse(wormParts4X[i],wormParts4Y[i],wormRadius,wormRadius);
    }
  }
    strokeWeight(wormRadius+2);
    stroke(segmentcolor);
    line(wormPartsX[9],wormPartsY[9],wormPartsX[10],wormPartsY[10]);
    line(wormPartsX[10],wormPartsY[10],wormPartsX[11],wormPartsY[11]);
    line(wormPartsX[11],wormPartsY[11],wormPartsX[12],wormPartsY[12]);
    line(wormPartsX[12],wormPartsY[12],wormPartsX[13],wormPartsY[13]);
//    strokeWeight(0);
//    if(triplelaser) drawtriplelaser(wormPartsX[10],wormPartsY[10],7);
//    if(matrix) drawmatrix(wormPartsX[11],wormPartsY[11],7);
//    if(homing) drawhoming(wormPartsX[13],wormPartsY[13],7);
//    if(shockwave) drawshockwave(wormPartsX[14],wormPartsY[14],7);
//    strokeWeight(wormRadius+2);
    if(frame < 240 && drawworms)
    {
      stroke(255,150,120);
      line(wormParts2X[9],wormParts2Y[9],wormParts2X[10],wormParts2Y[10]);
      line(wormParts2X[10],wormParts2Y[10],wormParts2X[11],wormParts2Y[11]);
      line(wormParts2X[11],wormParts2Y[11],wormParts2X[12],wormParts2Y[12]);
      line(wormParts2X[12],wormParts2Y[12],wormParts2X[13],wormParts2Y[13]);
      line(wormParts3X[9],wormParts3Y[9],wormParts3X[10],wormParts3Y[10]);
      line(wormParts3X[10],wormParts3Y[10],wormParts3X[11],wormParts3Y[11]);
      line(wormParts3X[11],wormParts3Y[11],wormParts3X[12],wormParts3Y[12]);
      line(wormParts3X[12],wormParts3Y[12],wormParts3X[13],wormParts3Y[13]);
      line(wormParts4X[9],wormParts4Y[9],wormParts4X[10],wormParts4Y[10]);
      line(wormParts4X[10],wormParts4Y[10],wormParts4X[11],wormParts4Y[11]);
      line(wormParts4X[11],wormParts4Y[11],wormParts4X[12],wormParts4Y[12]);
      line(wormParts4X[12],wormParts4Y[12],wormParts4X[13],wormParts4Y[13]);
    }
}

void captureBoundary()
{
  boolean found;
  if(contact ||
     dist(wormPartsX[0], wormPartsY[0], wormPartsX[wormPartsX.length - 1], wormPartsY[wormPartsY.length - 1]) > 50 ||
     dist(wormPartsX[1], wormPartsY[1], wormPartsX[wormPartsX.length - 1], wormPartsY[wormPartsY.length - 1]) > 50 ||
     dist(wormPartsX[2], wormPartsY[2], wormPartsX[wormPartsX.length - 1], wormPartsY[wormPartsY.length - 1]) > 50 ||
     dist(wormPartsX[3], wormPartsY[3], wormPartsX[wormPartsX.length - 1], wormPartsY[wormPartsY.length - 1]) > 50 ||
     dist(wormPartsX[4], wormPartsY[4], wormPartsX[wormPartsX.length - 1], wormPartsY[wormPartsY.length - 1]) > 50 ||
     dist(wormPartsX[5], wormPartsY[5], wormPartsX[wormPartsX.length - 1], wormPartsY[wormPartsY.length - 1]) > 50) return;
  if(level == 1){
    for(int k = 0; k < blobsx1.length; k++)
    {
      if(blobsdead1[k]) continue; //Skip dead blobs
      //Magical algorithm found using google at http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
      found = false;
      for(int i = 0, j = wormPartsX.length-1; i < wormPartsX.length; j = (j + 1) % wormPartsX.length, i++)
      {
        if (((wormPartsY[i] > blobsy1[k]) != (wormPartsY[j]>blobsy1[k])) && (blobsx1[k] < (wormPartsX[j]-wormPartsX[i]) * (blobsy1[k]-wormPartsY[i]) / (wormPartsY[j]-wormPartsY[i]) + wormPartsX[i]))
        {
          found = !found;
        }
      }
      if(found){
        blobsdead1[k] = true;
        killed++;
      }
    }
  }
  if(level == 2){
    for(int k = 0; k < blobsx2.length; k++)
    {
      if(blobsdead2[k]) continue; //Skip dead blobs
      //Magical algorithm found using google at http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
      found = false;
      for(int i = 0, j = wormPartsX.length-1; i < wormPartsX.length; j = (j + 1) % wormPartsX.length, i++)
      {
        if (((wormPartsY[i] > blobsy2[k]) != (wormPartsY[j]>blobsy2[k])) && (blobsx2[k] < (wormPartsX[j]-wormPartsX[i]) * (blobsy2[k]-wormPartsY[i]) / (wormPartsY[j]-wormPartsY[i]) + wormPartsX[i]))
        {
          found = !found;
        }
      }
      if(found){
        blobsdead2[k] = true;
      }
    }
  }
  if(level == 3){
    for(int k = 0; k < blobsx3.length; k++)
    {
      if(blobsdead3[k]) continue; //Skip dead blobs
      //Magical algorithm found using google at http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
      found = false;
      for(int i = 0, j = wormPartsX.length-1; i < wormPartsX.length; j = (j + 1) % wormPartsX.length, i++)
      {
        if (((wormPartsY[i] > blobsy3[k]) != (wormPartsY[j]>blobsy3[k])) && (blobsx3[k] < (wormPartsX[j]-wormPartsX[i]) * (blobsy3[k]-wormPartsY[i]) / (wormPartsY[j]-wormPartsY[i]) + wormPartsX[i]))
        {
          found = !found;
        }
      }
      if(found){
        blobsdead3[k] = true;
      }
    }
  }
  if(level == 4){
    if(blobsdead4) return; //Skip dead blobs
    //Magical algorithm found using google at http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
    found = false;
    for(int i = 0, j = wormPartsX.length-1; i < wormPartsX.length; j = (j + 1) % wormPartsX.length, i++)
    {
      if (((wormPartsY[i] > blobsy4) != (wormPartsY[j]>blobsy4)) && (blobsx4 < (wormPartsX[j]-wormPartsX[i]) * (blobsy4-wormPartsY[i]) / (wormPartsY[j]-wormPartsY[i]) + wormPartsX[i]))
      {
        found = !found;
      }
    }
    if(found){
      killed++;
      blobsdead4 = true;
    }
  }
  if(level == 5){
    for(int k = 0; k < blobsx5.length; k++)
    {
      if(blobsdead5[k]) continue; //Skip dead blobs
      //Magical algorithm found using google at http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
      found = false;
      for(int i = 0, j = wormPartsX.length-1; i < wormPartsX.length; j = (j + 1) % wormPartsX.length, i++)
      {
        if (((wormPartsY[i] > blobsy5[k]) != (wormPartsY[j]>blobsy5[k])) && (blobsx5[k] < (wormPartsX[j]-wormPartsX[i]) * (blobsy5[k]-wormPartsY[i]) / (wormPartsY[j]-wormPartsY[i]) + wormPartsX[i]))
        {
          found = !found;
        }
      }
      if(found){
        blobsdead5[k] = true;
        killed++;
      }
    }
    if(blobdead5) return;
    found = false;
    for(int i = 0, j = wormPartsX.length-1; i < wormPartsX.length; j = (j + 1) % wormPartsX.length, i++)
    {
      if (((wormPartsY[i] > bloby5) != (wormPartsY[j]>bloby5)) && (blobx5 < (wormPartsX[j]-wormPartsX[i]) * (bloby5-wormPartsY[i]) / (wormPartsY[j]-wormPartsY[i]) + wormPartsX[i]))
      {
        found = !found;
      }
    }
    if(found){
      blobdead5 = true;
      killed++;
    }
  }
  if(level == 6){
    for(int k = 0; k < blobsx6.length; k++)
    {
      if(blobsdead6[k]) continue; //Skip dead blobs
      //Magical algorithm found using google at http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
      found = false;
      for(int i = 0, j = wormPartsX.length-1; i < wormPartsX.length; j = (j + 1) % wormPartsX.length, i++)
      {
        if (((wormPartsY[i] > blobsy6[k]) != (wormPartsY[j]>blobsy6[k])) && (blobsx6[k] < (wormPartsX[j]-wormPartsX[i]) * (blobsy6[k]-wormPartsY[i]) / (wormPartsY[j]-wormPartsY[i]) + wormPartsX[i]))
        {
          found = !found;
        }
      }
      if(found){
        blobsdead6[k] = true;
        if(k > blobsx6.length - 5) killed++;
      }
    }
  }
  if(level == 7){
    for(int k = 0; k < blobsx7.length; k++)
    {
      if(blobsdead7[k]) continue; //Skip dead blobs
      //Magical algorithm found using google at http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
      found = false;
      for(int i = 0, j = wormPartsX.length-1; i < wormPartsX.length; j = (j + 1) % wormPartsX.length, i++)
      {
        if (((wormPartsY[i] > blobsy7[k]) != (wormPartsY[j]>blobsy7[k])) && (blobsx7[k] < (wormPartsX[j]-wormPartsX[i]) * (blobsy7[k]-wormPartsY[i]) / (wormPartsY[j]-wormPartsY[i]) + wormPartsX[i]))
        {
          found = !found;
        }
      }
      if(found){
        blobsdead7[k] = true;
        if(k > blobsdead7.length - 11) killed++;
      }
    }
  }
  if(level == 8){
    for(int k = 0; k < blobsx8.length; k++)
    {
      if(blobsdead8[k]) continue; //Skip dead blobs
      //Magical algorithm found using google at http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
      found = false;
      for(int i = 0, j = wormPartsX.length-1; i < wormPartsX.length; j = (j + 1) % wormPartsX.length, i++)
      {
        if (((wormPartsY[i] > blobsy8[k]) != (wormPartsY[j]>blobsy8[k])) && (blobsx8[k] < (wormPartsX[j]-wormPartsX[i]) * (blobsy8[k]-wormPartsY[i]) / (wormPartsY[j]-wormPartsY[i]) + wormPartsX[i]))
        {
          found = !found;
        }
      }
      if(found){
        blobsdead8[k] = true;
        killed++;
      }
    }
  }
  if(level == 9){
    for(int k = 0; k < blobsx9.length; k++)
    {
      if(blobsdead9[k]) continue; //Skip dead blobs
      //Magical algorithm found using google at http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
      found = false;
      for(int i = 0, j = wormPartsX.length-1; i < wormPartsX.length; j = (j + 1) % wormPartsX.length, i++)
      {
        if (((wormPartsY[i] > blobsy9[k]) != (wormPartsY[j]>blobsy9[k])) && (blobsx9[k] < (wormPartsX[j]-wormPartsX[i]) * (blobsy9[k]-wormPartsY[i]) / (wormPartsY[j]-wormPartsY[i]) + wormPartsX[i]))
        {
          found = !found;
        }
      }
      if(found){
        blobsdead9[k] = true;
        killed++;
      }
    }
  }
  if(level == 10){
    for(int k = 0; k < blobsx10.length; k++)
    {
      if(blobsdead10[k]) continue; //Skip dead blobs
      //Magical algorithm found using google at http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
      found = false;
      for(int i = 0, j = wormPartsX.length-1; i < wormPartsX.length; j = (j + 1) % wormPartsX.length, i++)
      {
        if (((wormPartsY[i] > blobsy10[k]) != (wormPartsY[j]>blobsy10[k])) && (blobsx10[k] < (wormPartsX[j]-wormPartsX[i]) * (blobsy10[k]-wormPartsY[i]) / (wormPartsY[j]-wormPartsY[i]) + wormPartsX[i]))
        {
          found = !found;
        }
      }
      if(found){
        blobsdead10[k] = true;
        killed++;
      }
    }
  }
}

void drawBlobs()
{
  strokeWeight(1);
  if(level == 1)
  {
    stroke(220,0,255);
    fill(255,0,220);
    for(int i=0; i<blobsx1.length; i++)
    {
      if(!blobsdead1[i]) ellipse(blobsx1[i],blobsy1[i],blobRadius,blobRadius);
    }
  }
  if(level == 2)
  {
    stroke(0,255,0);
    fill(200,255,0);
    for(int i=0; i<blobsx2.length; i++)
    {
      if(!blobsfrozen2[i]){
        blobsx2[i] = blobsx2[i] + blobsdx2[i];
        blobsy2[i] = blobsy2[i] + blobsdy2[i];
      }
      if(!blobsdead2[i]) ellipse(blobsx2[i],blobsy2[i],blobRadius,blobRadius);
    }
  }
  if(level == 3)
  {
    stroke(0,255,0);
    fill(200,255,0);
    for(int i=0; i<blobsx3.length; i++)
    {
      if(!blobsfrozen3[i]){
        blobsx3[i] = blobsx3[i] + blobsdx3[i];
        blobsy3[i] = blobsy3[i] + blobsdy3[i];
      }
      if(!blobsdead3[i]) ellipse(blobsx3[i],blobsy3[i],blobRadius,blobRadius);
    }
  }
  if(level == 4)
  {
    stroke(0,255,0);
    fill(200,255,0);
    if(!blobsdead4) 
    {
      if(!blobsfrozen4){
        ratio = sqrt((wormPartsX[wormPartsX.length-1] - blobsx4) * (wormPartsX[wormPartsX.length-1] - blobsx4) + (wormPartsY[wormPartsY.length-1] - blobsy4) * (wormPartsY[wormPartsY.length-1] - blobsy4));
        blobsdx4 = (wormPartsX[wormPartsX.length-1] - blobsx4) / ratio;
        blobsdy4 = (wormPartsY[wormPartsY.length-1] - blobsy4) / ratio;
        blobsx4 = blobsx4 + blobsdx4; 
        blobsy4 = blobsy4 + blobsdy4; 
      }
      fill(255,0,0,100+100*sin(frame*.08));
      strokeWeight(1);
      stroke(255,0,0);
      ellipse(blobsx4,blobsy4,blobRadius,blobRadius);
      noStroke();
      fill(255,0,0,80+80*sin(frame*.08));
      ellipse(blobsx4,blobsy4,blobRadius+2,blobRadius+2);
      fill(255,0,0,50+50*sin(frame*.08));
      ellipse(blobsx4,blobsy4,blobRadius+7,blobRadius+7);
      fill(255,0,0,20+20*sin(frame*.08));
      ellipse(blobsx4,blobsy4,blobRadius+10,blobRadius+10);
    }
  }
  if(level == 5)
  {
    stroke(200,255,0);
    fill(0,190,255);
    for(int i=0; i<blobsx5.length; i++)
    {
      if(!blobsdead5[i]) 
      {
        if(!blobsfrozen5[i]){
          blobsStroke5[i] = blobsStroke5[i] + blobsdStroke5[i];
          strokeWeight(blobsStroke5[i]);
          blobsx5[i] = blobsx5[i] + blobsdx5[i];
          blobsy5[i] = blobsy5[i] + blobsdy5[i];
          blobsRadius5[i] = blobsRadius5[i] + blobsdRadius5[i];
        }
        strokeWeight(blobsStroke5[i]);
        ellipse(blobsx5[i],blobsy5[i],blobsRadius5[i],blobsRadius5[i]);
      }
    }
    if(!blobdead5)
    {
      if(!blobfrozen5){
        ratio = sqrt((wormPartsX[wormPartsX.length-1] - blobx5) * (wormPartsX[wormPartsX.length-1] - blobx5) + (wormPartsY[wormPartsY.length-1] - bloby5) * (wormPartsY[wormPartsY.length-1] - bloby5));
        blobdx5 = (wormPartsX[wormPartsX.length-1] - blobx5) / ratio;
        blobdy5 = (wormPartsY[wormPartsY.length-1] - bloby5) / ratio;
        blobx5 = blobx5 + blobdx5; 
        bloby5 = bloby5 + blobdy5;
      }
      fill(255,0,0,100+100*sin(frame*.08));
      strokeWeight(1);
      stroke(255,0,0);
      ellipse(blobx5,bloby5,blobRadius,blobRadius);
      noStroke();
      fill(255,0,0,80+80*sin(frame*.08));
      ellipse(blobx5,bloby5,blobRadius+2,blobRadius+2);
      fill(255,0,0,50+50*sin(frame*.08));
      ellipse(blobx5,bloby5,blobRadius+7,blobRadius+7);
      fill(255,0,0,20+20*sin(frame*.08));
      ellipse(blobx5,bloby5,blobRadius+10,blobRadius+10);
    }
  }
  if(level == 6)
  {
    stroke(0,255,0);
    fill(200,255,0);
    for(int i=0; i<blobsx6.length - 4; i++)
    {
      if(!blobsfrozen6[i]){
        blobsx6[i] = blobsx6[i] + blobsdx6[i];
        blobsy6[i] = blobsy6[i] + blobsdy6[i];
      }
      if(!blobsdead6[i]) ellipse(blobsx6[i],blobsy6[i],blobRadius,blobRadius);
    }
    for(int i=blobsx6.length - 4; i<blobsx6.length; i++)
    {
      if(!blobsdead6[i]) 
      {
        if(!blobsfrozen6[i]){
          ratio = sqrt((wormPartsX[wormPartsX.length-1] - blobsx6[i]) * (wormPartsX[wormPartsX.length-1] - blobsx6[i]) + (wormPartsY[wormPartsY.length-1] - blobsy6[i]) * (wormPartsY[wormPartsY.length-1] - blobsy6[i]));
          blobsdx6[i] = (wormPartsX[wormPartsX.length-1] - blobsx6[i]) / ratio;
          blobsdy6[i] = (wormPartsY[wormPartsY.length-1] - blobsy6[i]) / ratio;
          blobsx6[i] = blobsx6[i] + blobsdx6[i]; 
          blobsy6[i] = blobsy6[i] + blobsdy6[i]; 
        }
        fill(255,0,0,100+100*sin(frame*.08));
        strokeWeight(1);
        stroke(255,0,0);
        ellipse(blobsx6[i],blobsy6[i],blobRadius,blobRadius);
        noStroke();
        fill(255,0,0,80+80*sin(frame*.08));
        ellipse(blobsx6[i],blobsy6[i],blobRadius+2,blobRadius+2);
        fill(255,0,0,50+50*sin(frame*.08));
        ellipse(blobsx6[i],blobsy6[i],blobRadius+7,blobRadius+7);
        fill(255,0,0,20+20*sin(frame*.08));
        ellipse(blobsx6[i],blobsy6[i],blobRadius+10,blobRadius+10);
      }
    }
  }
  if(level == 7)
  {
    stroke(0,255,0);
    fill(200,255,0);
    for(int i=0; i<blobsx7.length - 10; i++)
    {
      if(!blobsfrozen7[i]){
        blobsx7[i] = blobsx7[i] + blobsdx7[i];
        blobsy7[i] = blobsy7[i] + blobsdy7[i];
      }
      if(!blobsdead7[i]) ellipse(blobsx7[i],blobsy7[i],blobRadius,blobRadius);
    }
    if(frame > 400){
      for(int i=blobsx7.length - 10; i<blobsx7.length; i++)
      {
        if(!blobsfrozen7[i]){
          if(abs(blobsdx7[i]) < .5) blobsdx7[i] = 0;
          if(abs(blobsdy7[i]) < .5) blobsdy7[i] = 0;
          blobsdx7[i] *= .98;
          blobsdy7[i] *= .98;
          blobsx7[i] = blobsx7[i] + blobsdx7[i];
          blobsy7[i] = blobsy7[i] + blobsdy7[i];
        }
        fill(255,255,0);
        stroke(255,0,0);
        if(!blobsdead7[i]) ellipse(blobsx7[i],blobsy7[i],blobRadius,blobRadius);
      }
    }
  }
  if(level == 8)
  {
    for(int i=0; i<4; i++)
    {
      stroke(220,0,255);
      fill(255,0,220);
      if(!blobsdead8[i]) ellipse(blobsx8[i],blobsy8[i],blobRadius,blobRadius);
    }
    for(int i = 4; i < 8; i++)
    {
      if(!blobsdead8[i]) 
      {
        if(!blobsfrozen8[i]){
          ratio = sqrt((wormPartsX[wormPartsX.length-1] - blobsx8[i]) * (wormPartsX[wormPartsX.length-1] - blobsx8[i]) + (wormPartsY[wormPartsY.length-1] - blobsy8[i]) * (wormPartsY[wormPartsY.length-1] - blobsy8[i]));
          blobsdx8[i] = (wormPartsX[wormPartsX.length-1] - blobsx8[i]) / ratio;
          blobsdy8[i] = (wormPartsY[wormPartsY.length-1] - blobsy8[i]) / ratio;
          blobsx8[i] = blobsx8[i] + blobsdx8[i]; 
          blobsy8[i] = blobsy8[i] + blobsdy8[i]; 
        }
        fill(255,0,0,100+100*sin(frame*.08));
        strokeWeight(1);
        stroke(255,0,0);
        ellipse(blobsx8[i],blobsy8[i],blobRadius,blobRadius);
        noStroke();
        fill(255,0,0,80+80*sin(frame*.08));
        ellipse(blobsx8[i],blobsy8[i],blobRadius+2,blobRadius+2);
        fill(255,0,0,50+50*sin(frame*.08));
        ellipse(blobsx8[i],blobsy8[i],blobRadius+7,blobRadius+7);
        fill(255,0,0,20+20*sin(frame*.08));
        ellipse(blobsx8[i],blobsy8[i],blobRadius+10,blobRadius+10);
      }
    }
    if(frame > 400){
      for(int i=8; i<blobsx8.length; i++)
      {
        if(!blobsfrozen8[i]){
          if(abs(blobsdx8[i]) < .5) blobsdx8[i] = 0;
          if(abs(blobsdy8[i]) < .5) blobsdy8[i] = 0;
          blobsdx8[i] *= .98;
          blobsdy8[i] *= .98;
          blobsx8[i] = blobsx8[i] + blobsdx8[i];
          blobsy8[i] = blobsy8[i] + blobsdy8[i];
        }
        fill(255,255,0);
        stroke(255,0,0);
        if(!blobsdead8[i]) ellipse(blobsx8[i],blobsy8[i],blobRadius,blobRadius);
      }
    }
  }
  if(level == 9)
  {
    stroke(200,255,0);
    fill(0,190,255);
    for(int i=0; i<blobsx9.length - 1; i++)
    {
      if(!blobsdead9[i]) 
      {
        if(!blobsfrozen9[i]){
          blobsStroke9[i] = blobsStroke9[i] + blobsdStroke9[i];
          strokeWeight(blobsStroke9[i]);
          blobsx9[i] = blobsx9[i] + blobsdx9[i];
          blobsy9[i] = blobsy9[i] + blobsdy9[i];
          blobsRadius9[i] = blobsRadius9[i] + blobsdRadius9[i];
        }
        strokeWeight(blobsStroke9[i]);
        ellipse(blobsx9[i],blobsy9[i],blobsRadius9[i],blobsRadius9[i]);
      }
    }
    stroke(0,255,0);
    fill(0,200,0);
    if(!blobsdead9[blobsx9.length - 1]) 
    {
      if(!blobsfrozen9[blobsx9.length - 1]){
        ratio = sqrt((wormPartsX[wormPartsX.length-1] - blobsx9[blobsx9.length - 1]) * (wormPartsX[wormPartsX.length-1] - blobsx9[blobsx9.length - 1]) + (wormPartsY[wormPartsY.length-1] - blobsy9[blobsx9.length - 1]) * (wormPartsY[wormPartsY.length-1] - blobsy9[blobsx9.length - 1]));
        blobsdx9[blobsx9.length - 1] = (wormPartsX[wormPartsX.length-1] - blobsx9[blobsx9.length - 1]) / ratio;
        blobsdy9[blobsx9.length - 1] = (wormPartsY[wormPartsY.length-1] - blobsy9[blobsx9.length - 1]) / ratio;
        blobsx9[blobsx9.length - 1] = blobsx9[blobsx9.length - 1] + blobsdx9[blobsx9.length - 1]; 
        blobsy9[blobsx9.length - 1] = blobsy9[blobsx9.length - 1] + blobsdy9[blobsx9.length - 1]; 
      }
      fill(0,200,0,100+100*sin(frame*.08));
      strokeWeight(1);
      stroke(0,200,0);
      ellipse(blobsx9[blobsx9.length - 1],blobsy9[blobsx9.length - 1],blobRadius,blobRadius);
      noStroke();
      fill(0,200,0,80+80*sin(frame*.08));
      ellipse(blobsx9[blobsx9.length - 1],blobsy9[blobsx9.length - 1],blobRadius+2,blobRadius+2);
      fill(0,200,0,50+50*sin(frame*.08));
      ellipse(blobsx9[blobsx9.length - 1],blobsy9[blobsx9.length - 1],blobRadius+7,blobRadius+7);
      fill(0,200,0,20+20*sin(frame*.08));
      ellipse(blobsx9[blobsx9.length - 1],blobsy9[blobsx9.length - 1],blobRadius+10,blobRadius+10);
    }
    bloblaser();
  }
  if(level == 10){
    homing = false;
    float alphafactor = 1.0;
    if(bossframe > frame) alphafactor = .2 + .2* cos(frame * .5);
    for(int i = blobsx10.length - bosshits; i < blobsx10.length; i++){
      if(!blobsdead10[i]) 
      {
        stroke(200,255,0);
        fill(0,190,255);
        if(!blobsfrozen10[i]){
          blobsStroke10[i] = blobsStroke10[i] + blobsdStroke10[i];
          strokeWeight(blobsStroke10[i]);
          blobsRadius10[i] = blobsRadius10[i] + blobsdRadius10[i];
        }
        strokeWeight(blobsStroke10[i]);
        ellipse(blobsx10[i],blobsy10[i],blobsRadius10[i],blobsRadius10[i]);
      }
    }
    if(!blobsdead10[0])
    {
      float targetx = 200 * cos(frame * .01) + wormPartsX[wormPartsX.length-1];
      float targety = 200 * sin(frame * .01) + wormPartsY[wormPartsX.length-1];
      if(!blobsfrozen10[0]){
        ratio = sqrt((targetx - blobsx10[0]) * (targetx - blobsx10[0]) + (targety - blobsy10[0]) * (targety - blobsy10[0]));
        blobsdx10[0] = (targetx - blobsx10[0]) / ratio;
        blobsdy10[0] = (targety - blobsy10[0]) / ratio;
        blobsx10[0] = blobsx10[0] + blobsdx10[0]; 
        blobsy10[0] = blobsy10[0] + blobsdy10[0]; 
      }
      fill(0,200,0,(100+100*sin(frame*.08)) * alphafactor);
      strokeWeight(1);
      stroke(0,200,0, 255 * alphafactor);
      ellipse(blobsx10[0],blobsy10[0],blobRadius,blobRadius);
      noStroke();
      fill(0,200,0,(80+80*sin(frame*.08)) * alphafactor);
      ellipse(blobsx10[0],blobsy10[0],blobRadius+2,blobRadius+2);
      fill(0,200,0,(50+50*sin(frame*.08)) * alphafactor);
      ellipse(blobsx10[0],blobsy10[0],blobRadius+7,blobRadius+7);
      fill(0,200,0,(20+20*sin(frame*.08)) * alphafactor);
      ellipse(blobsx10[0],blobsy10[0],blobRadius+10,blobRadius+10);
    }
    for(int i = 1; i < blobsx10.length - bosshits; i++){
      if(blobsdead10[i]) continue;
      ratio = dist(blobsx10[i-1], blobsy10[i-1], blobsx10[i], blobsy10[i]);
      if(ratio >= 8){
        blobsdx10[0] = (blobsx10[i-1] - blobsx10[i]) / ratio;
        blobsdy10[0] = (blobsy10[i-1] - blobsy10[i]) / ratio;
      }
      else
      {
        blobsdx10[0] = 0;
        blobsdy10[0] = 0;
      }
      blobsx10[i] = blobsx10[i] + blobsdx10[0]; 
      blobsy10[i] = blobsy10[i] + blobsdy10[0];
      fill(0,200,0,(100+100*sin(frame*.08)) * alphafactor);
      strokeWeight(1);
      stroke(0,200,0, 255 * alphafactor);
      ellipse(blobsx10[i],blobsy10[i],blobRadius,blobRadius);
      noStroke();
      fill(0,200,0,(80+80*sin(frame*.08 - i * .3)) * alphafactor);
      ellipse(blobsx10[i],blobsy10[i],blobRadius+2,blobRadius+2);
      fill(0,200,0,(50+50*sin(frame*.08 - i * .3)) * alphafactor);
      ellipse(blobsx10[i],blobsy10[i],blobRadius+7,blobRadius+7);
      fill(0,200,0,(20+20*sin(frame*.08 - i * .3)) * alphafactor);
      ellipse(blobsx10[i],blobsy10[i],blobRadius+10,blobRadius+10);
      bosslaser();
    }
  }
}

void blobContact()
{
  if(contact && frameCount - contactframe > 120) contact = false;
  if(contact == false){
    if(level == 1){
      for(int k = 0; k < blobsx1.length; k++)
      {
        if(blobsdead1[k]) continue; //skip dead ones
        for(int i = 0; i < wormPartsX.length; i++)
        {
          if(dist(blobsx1[k], blobsy1[k], wormPartsX[i], wormPartsY[i]) < (wormRadius + blobRadius) / 2)
          {
            contact = true;
            contactframe = frameCount;
            hp--;
            return;
          }
        }
      }
    }
    if(level == 2){
      for(int k = 0; k < blobsx2.length; k++)
      {
        if(blobsdead2[k]) continue; //skip dead ones
        for(int i = 0; i < wormPartsX.length; i++)
        {
          if(dist(blobsx2[k], blobsy2[k], wormPartsX[i], wormPartsY[i]) < (wormRadius + blobRadius) / 2)
          {
            contact = true;
            contactframe = frameCount;
            hp--;
            return;
          }
        }
      }
    }
    if(level == 3){
      for(int k = 0; k < blobsx3.length; k++)
      {
        if(blobsdead3[k]) continue; //skip dead ones
        for(int i = 0; i < wormPartsX.length; i++)
        {
          if(dist(blobsx3[k], blobsy3[k], wormPartsX[i], wormPartsY[i]) < (wormRadius + blobRadius) / 2)
          {
            contact = true;
            contactframe = frameCount;
            hp--;
            return;
          }
        }
      }
    }
    if(level == 4){
      if(blobsdead4) return; //skip dead ones
      for(int i = 0; i < wormPartsX.length; i++)
      {
        if(dist(blobsx4, blobsy4, wormPartsX[i], wormPartsY[i]) < (wormRadius + blobRadius) / 2)
        {
          contact = true;
          contactframe = frameCount;
          hp--;
          return;
        }
      }
    }
    if(level == 5){
      for(int k = 0; k < blobsx5.length; k++)
      {
        if(blobsdead5[k]) continue; //skip dead ones
        for(int i = 0; i < wormPartsX.length; i++)
        {
          if(dist(blobsx5[k], blobsy5[k], wormPartsX[i], wormPartsY[i]) < (wormRadius + blobsRadius5[k]) / 2)
          {
            contact = true;
            contactframe = frameCount;
            --hp;
            return;
          }
          if(!blobdead5 && dist(blobx5, bloby5, wormPartsX[i], wormPartsY[i]) < (wormRadius + blobRadius) / 2)
          {
            contact = true;
            contactframe = frameCount;
            hp--;
            return;
          }
        }
      }
    }
    if(level == 6){
      for(int k = 0; k < blobsx6.length; k++)
      {
        if(blobsdead6[k]) continue; //skip dead ones
        for(int i = 0; i < wormPartsX.length; i++)
        {
          if(dist(blobsx6[k], blobsy6[k], wormPartsX[i], wormPartsY[i]) < (wormRadius + blobRadius) / 2)
          {
            contact = true;
            contactframe = frameCount;
            hp--;
            return;
          }
        }
      }
    }
    if(level == 7){
      for(int k = 0; k < blobsx7.length; k++)
      {
        if(blobsdead7[k]) continue; //skip dead ones
        for(int i = 0; i < wormPartsX.length; i++)
        {
          if(dist(blobsx7[k], blobsy7[k], wormPartsX[i], wormPartsY[i]) < (wormRadius + blobRadius) / 2)
          {
            contact = true;
            contactframe = frameCount;
            hp--;
            return;
          }
        }
      }
    }
    if(level == 8){
      for(int k = 0; k < blobsx8.length; k++)
      {
        if(blobsdead8[k]) continue; //skip dead ones
        for(int i = 0; i < wormPartsX.length; i++)
        {
          if(dist(blobsx8[k], blobsy8[k], wormPartsX[i], wormPartsY[i]) < (wormRadius + blobRadius) / 2)
          {
            contact = true;
            contactframe = frameCount;
            hp--;
            return;
          }
        }
      }
    }
    if(level == 9){
      for(int k = 0; k < blobsx9.length; k++)
      {
        if(blobsdead9[k]) continue; //skip dead ones
        for(int i = 0; i < wormPartsX.length; i++)
        {
          if(dist(blobsx9[k], blobsy9[k], wormPartsX[i], wormPartsY[i]) < (wormRadius + blobsRadius9[k]) / 2)
          {
            contact = true;
            contactframe = frameCount;
            hp--;
            return;
          }
        }
      }
    }
    if(level == 10){
      for(int k = 0; k < blobsx10.length; k++)
      {
        if(blobsdead10[k]) continue; //skip dead ones
        for(int i = 0; i < wormPartsX.length; i++)
        {
          if(dist(blobsx10[k], blobsy10[k], wormPartsX[i], wormPartsY[i]) < (wormRadius + blobsRadius10[k]) / 2)
          {
            contact = true;
            contactframe = frameCount;
            hp--;
            return;
          }
        }
      }
    }
  }
}


void laser()
{
  int target;
  float distance = 10000;
  float theta2;
  strokeWeight(3);
  stroke(255,0,0);
  for(int i = 0; i < 15; i++){
    if(shot[i] && ((laserx2[i] > 500) || (laserx2[i] < 0) || (lasery2[i] > 500) || (lasery2[i] < 0))) shot[i] = false;
  }
  if(!contact && mousePressed == true && mouseButton == LEFT && frameCount - laserframe > laserReload)
  {
    for(int i = 0; i < 5; i++){
      if(shot[i] == false && shot[i + 5] == false && shot[i + 10] == false){
        target = -1;
        distance = 10000;
        laserx1[i] = wormPartsX[28];
        laserx2[i] = wormPartsX[27];
        lasery1[i] = wormPartsY[28];
        lasery2[i] = wormPartsY[27];
        laserdx[i] = (laserx1[i] - laserx2[i]);
        laserdy[i] = (lasery1[i] - lasery2[i]);
        shot[i] = true;
        laserstart[i] = frameCount;
        if(homing){
          if(level == 1){
            for(int j = 0; j < blobsx1.length; j++){
              if(dist(wormPartsX[28], wormPartsY[28], blobsx1[j], blobsy1[j]) < distance && !blobsdead1[j] && !blobsfrozen1[j])
              {
                distance = dist(wormPartsX[28], wormPartsY[28], blobsx1[j], blobsy1[j]);
                lasertarget[i] = j;
              }
            }
          }
          if(level == 2){
            for(int j = 0; j < blobsx2.length; j++){
              if(dist(wormPartsX[28], wormPartsY[28], blobsx2[j], blobsy2[j]) < distance && !blobsdead2[j] && !blobsfrozen2[j])
              {
                distance = dist(wormPartsX[28], wormPartsY[28], blobsx2[j], blobsy2[j]);
                lasertarget[i] = j;
              }
            }
          }
          if(level == 3){
            for(int j = 0; j < blobsx3.length; j++){
              if(dist(wormPartsX[28], wormPartsY[28], blobsx3[j], blobsy3[j]) < distance && !blobsdead3[j] && !blobsfrozen3[j])
              {
                distance = dist(wormPartsX[28], wormPartsY[28], blobsx3[j], blobsy3[j]);
                lasertarget[i] = j;
              }
            }
          }
          if(level == 4){
            if(!blobsdead4 && !blobsfrozen4) lasertarget[i] = 0;
          }
          if(level == 5){
            if(!blobfrozen5){
              if(dist(wormPartsX[28], wormPartsY[28], blobx5, bloby5) < distance && !blobdead5 && !blobfrozen5)
              {
                distance = dist(wormPartsX[28], wormPartsY[28], blobx5, bloby5);
                lasertarget[i] = 4;
              }
            }
            for(int j = 0; j < blobsx5.length; j++){
              if(dist(wormPartsX[28], wormPartsY[28], blobsx5[j], blobsy5[j]) < distance && !blobsdead5[j] && !blobsfrozen5[j])
              {
                distance = dist(wormPartsX[28], wormPartsY[28], blobsx5[j], blobsy5[j]);
                lasertarget[i] = j;
              }
            }
          }
          if(level == 6){
            for(int j = 0; j < blobsx6.length; j++){
              if(dist(wormPartsX[28], wormPartsY[28], blobsx6[j], blobsy6[j]) < distance && !blobsdead6[j] && !blobsfrozen6[j])
              {
                distance = dist(wormPartsX[28], wormPartsY[28], blobsx6[j], blobsy6[j]);
                lasertarget[i] = j;
              }
            }
          }
          if(level == 7){
            for(int j = 0; j < blobsx7.length; j++){
              if(dist(wormPartsX[28], wormPartsY[28], blobsx7[j], blobsy7[j]) < distance && !blobsdead7[j] && !blobsfrozen7[j])
              {
                distance = dist(wormPartsX[28], wormPartsY[28], blobsx7[j], blobsy7[j]);
                lasertarget[i] = j;
              }
            }
          }
          if(level == 8){
            for(int j = 0; j < blobsx8.length; j++){
              if(dist(wormPartsX[28], wormPartsY[28], blobsx8[j], blobsy8[j]) < distance && !blobsdead8[j] && !blobsfrozen8[j])
              {
                distance = dist(wormPartsX[28], wormPartsY[28], blobsx8[j], blobsy8[j]);
                lasertarget[i] = j;
              }
            }
          }
          if(level == 9){
            for(int j = 0; j < blobsx9.length; j++){
              if(dist(wormPartsX[28], wormPartsY[28], blobsx9[j], blobsy9[j]) < distance && !blobsdead9[j] && !blobsfrozen9[j])
              {
                distance = dist(wormPartsX[28], wormPartsY[28], blobsx9[j], blobsy9[j]);
                lasertarget[i] = j;
              }
            }
          }
          if(level == 10){
            for(int j = 0; j < blobsx10.length; j++){
              if(dist(wormPartsX[28], wormPartsY[28], blobsx10[j], blobsy10[j]) < distance && !blobsdead10[j] && !blobsfrozen10[j])
              {
                distance = dist(wormPartsX[28], wormPartsY[28], blobsx10[j], blobsy10[j]);
                lasertarget[i] = j;
              }
            }
          }
        }
        lasertarget[i + 5] = lasertarget[i];
        lasertarget[i + 10] = lasertarget[i];
        if(triplelaser){
          theta = atan2(laserdy[i], laserdx[i]);
          laserdx[i + 5] = wormRadius * cos(theta - PI / 6);
          laserdy[i + 5] = wormRadius * sin(theta - PI / 6);
          laserdx[i + 10] = wormRadius * cos(theta + PI / 6);
          laserdy[i + 10] = wormRadius * sin(theta + PI / 6);
          laserx2[i + 5] = wormPartsX[27];
          lasery2[i + 5] = wormPartsY[27];
          laserx1[i + 5] = laserx2[i + 5] + laserdx[i + 5];
          lasery1[i + 5] = lasery2[i + 5] + laserdy[i + 5];
          laserx2[i + 10] = wormPartsX[27];
          lasery2[i + 10] = wormPartsY[27];
          laserx1[i + 10] = laserx2[i + 10] + laserdx[i + 10];
          lasery1[i + 10] = lasery2[i + 10] + laserdy[i + 10];
          shot[i+5] = true;
          shot[i+10] = true;
          laserstart[i + 5] = frameCount;
          laserstart[i + 10] = frameCount;
        }
        laserframe = frameCount;
        i = 100;
      }
    }
  }
  if(!contact && mousePressed == true && mouseButton == RIGHT && frameCount - shockframe > shockreload && shockammo > 0)
  {
    shockframe = frameCount;
    shockammo--;
    shockx = wormPartsX[wormPartsX.length - 1];
    shocky = wormPartsY[wormPartsX.length - 1];
  }
  if(frameCount - shockframe < 100)
  {
    strokeWeight(5);
    stroke(50, 50, 255, 200);
    noFill();
    ellipse(shockx, shocky, (frameCount - shockframe) * 4, (frameCount - shockframe) * 4);
    if(level == 1) for(int k = 0; k < blobsx1.length; k++) if(dist(blobsx1[k], blobsy1[k], shockx, shocky) < (frameCount - shockframe) * 2 + blobRadius / 2)
    {
      blobsfrozen1[k] = true;
    }
    if(level == 2) for(int k = 0; k < blobsx2.length; k++) if(dist(blobsx2[k], blobsy2[k], shockx, shocky) < (frameCount - shockframe) * 2 + blobRadius / 2)
    {
      blobsfrozen2[k] = true;
    }
    if(level == 3) for(int k = 0; k < blobsx3.length; k++) if(dist(blobsx3[k], blobsy3[k], shockx, shocky) < (frameCount - shockframe) * 2 + blobRadius / 2)
    {
      blobsfrozen3[k] = true;
    }
    if(level == 4) if(dist(blobsx4, blobsy4, shockx, shocky) < (frameCount - shockframe) * 2 + blobRadius / 2)
    {
      blobsfrozen4 = true;
    }
    if(level == 5)
    {
      for(int k = 0; k < blobsx5.length; k++)
      {
        if(dist(blobsx5[k], blobsy5[k], shockx, shocky) < (frameCount - shockframe) * 2 + (blobsRadius5[k]) / 2)
        {
          blobsfrozen5[k] = true;
        }
      }
      if(dist(blobx5, bloby5, shockx, shocky) < (frameCount - shockframe) * 2 + blobRadius / 2)
      {
        blobfrozen5 = true;
      }
    }
    if(level == 6) for(int k = 0; k < blobsx6.length; k++) if(dist(blobsx6[k], blobsy6[k], shockx, shocky) < (frameCount - shockframe) * 2 + blobRadius / 2)
    {
      blobsfrozen6[k] = true;
    }
    if(level == 7) for(int k = 0; k < blobsx7.length; k++) if(dist(blobsx7[k], blobsy7[k], shockx, shocky) < (frameCount - shockframe) * 2 + blobRadius / 2)
    {
      blobsfrozen7[k] = true;
    }
    if(level == 8) for(int k = 0; k < blobsx8.length; k++) if(dist(blobsx8[k], blobsy8[k], shockx, shocky) < (frameCount - shockframe) * 2 + blobRadius / 2)
    {
      blobsfrozen8[k] = true;
    }
    if(level == 9) for(int k = 0; k < blobsx9.length; k++) if(dist(blobsx9[k], blobsy9[k], shockx, shocky) < (frameCount - shockframe) * 2 + blobRadius / 2)
    {
      blobsfrozen9[k] = true;
    }
    if(level == 10) for(int k = 0; k < blobsx10.length; k++) if(dist(blobsx10[k], blobsy10[k], shockx, shocky) < (frameCount - shockframe) * 2 + blobRadius / 2)
    {
      if(!blobsfrozen10[k]) explosion(blobsx10[k], blobsy10[k]);
      if(k < blobsx10.length - bosshits && bosshits < blobsx10.length)
      {
        if(frame > bossframe){
          bosshits++;
          bossframe = frame + 240;
        }
      }
      else blobsfrozen10[k] = true;
    }
  }
  for(int i = 0; i < 15; i++){
    if(shot[i] == false) continue;
    if(frameCount - laserstart[i] > 240) lasertarget[i] = -1;
    if(lasertarget[i] > -1){ //CHECK TO MAKE SURE THE TARGET IS ALIVE
      if(level == 1 && blobsdead1[lasertarget[i]]) lasertarget[i] = -1;
      if(level == 2 && blobsdead2[lasertarget[i]]) lasertarget[i] = -1;
      if(level == 3 && blobsdead3[lasertarget[i]]) lasertarget[i] = -1;
      if(level == 4 && blobsdead4) lasertarget[i] = -1;
      if(level == 5 && ((lasertarget[i] < 4 && lasertarget[i] > -1 && blobsdead5[lasertarget[i]]) || (lasertarget[i] == 4 && blobdead5))) lasertarget[i] = -1;
      if(level == 6 && blobsdead6[lasertarget[i]]) lasertarget[i] = -1;
      if(level == 7 && blobsdead7[lasertarget[i]]) lasertarget[i] = -1;
      if(level == 8 && blobsdead8[lasertarget[i]]) lasertarget[i] = -1;
      if(level == 9 && blobsdead9[lasertarget[i]]) lasertarget[i] = -1;
      if(level == 10 && blobsdead10[lasertarget[i]]) lasertarget[i] = -1;
    }
    if(frameCount - laserstart[i] > 6){
      if(lasertarget[i] > -1){
        if(level == 1){
          theta = atan2(blobsy1[lasertarget[i]] - lasery2[i], blobsx1[lasertarget[i]] - laserx2[i]);
        }
        if(level == 2){
          theta = atan2(blobsy2[lasertarget[i]] - lasery2[i], blobsx2[lasertarget[i]] - laserx2[i]);
        }
        if(level == 3){
          theta = atan2(blobsy3[lasertarget[i]] - lasery2[i], blobsx3[lasertarget[i]] - laserx2[i]);
        }
        if(level == 4){
          theta = atan2(blobsy4 - lasery2[i], blobsx4 - laserx2[i]);
        }
        if(level == 5){
          if(lasertarget[i] < 4){
            theta = atan2(blobsy5[lasertarget[i]] - lasery2[i], blobsx5[lasertarget[i]] - laserx2[i]);
          } else theta = atan2(bloby5 - lasery2[i], blobx5 - laserx2[i]);
        }
        if(level == 6){
          theta = atan2(blobsy6[lasertarget[i]] - lasery2[i], blobsx6[lasertarget[i]] - laserx2[i]);
        }
        if(level == 7){
          theta = atan2(blobsy7[lasertarget[i]] - lasery2[i], blobsx7[lasertarget[i]] - laserx2[i]);
        }
        if(level == 8){
          theta = atan2(blobsy8[lasertarget[i]] - lasery2[i], blobsx8[lasertarget[i]] - laserx2[i]);
        }
        if(level == 9){
          theta = atan2(blobsy9[lasertarget[i]] - lasery2[i], blobsx9[lasertarget[i]] - laserx2[i]);
        }
        if(level == 10){
          theta = atan2(blobsy10[lasertarget[i]] - lasery2[i], blobsx10[lasertarget[i]] - laserx2[i]);
        }
        theta2 = theta - atan2(laserdy[i], laserdx[i]);
        if(theta2 > PI) theta2 -= 2*PI;
        if(theta2 < -PI) theta2 += 2*PI;
        if(theta2 > .3) theta2 = .3;
        if(theta2 < -.3) theta2 = -.3;
        theta = theta2 + atan2(laserdy[i], laserdx[i]);
        laserdx[i] = wormRadius * cos(theta);
        laserdy[i] = wormRadius * sin(theta);
        laserx1[i] = laserx2[i] + laserdx[i];
        lasery1[i] = lasery2[i] + laserdy[i];
      }
    }
    laserx1[i] += laserdx[i];
    lasery1[i] += laserdy[i];
    laserx2[i] += laserdx[i];
    lasery2[i] += laserdy[i];
    line(laserx1[i],lasery1[i],laserx2[i],lasery2[i]);                                                                              //THE LINE
    if(level == 1) for(int k = 0; k < blobsx1.length; k++) if(dist(blobsx1[k], blobsy1[k], laserx1[i], lasery1[i]) < blobRadius && !blobsdead1[k])
    {
      blobsfrozen1[k] = true;
      shot[i] = false;
      lasertarget[i] = -1;
      explosion(laserx1[i], lasery1[i]);
    }
    if(level == 2) for(int k = 0; k < blobsx2.length; k++) if(dist(blobsx2[k], blobsy2[k], laserx1[i], lasery1[i]) < blobRadius && !blobsdead2[k])
    {
      blobsfrozen2[k] = true;
      shot[i] = false;
      lasertarget[i] = -1;
      explosion(laserx1[i], lasery1[i]);
    }
    if(level == 3) for(int k = 0; k < blobsx3.length; k++) if(dist(blobsx3[k], blobsy3[k], laserx1[i], lasery1[i]) < blobRadius && !blobsdead3[k])
    {
      blobsfrozen3[k] = true;
      shot[i] = false;
      lasertarget[i] = -1;
      explosion(laserx1[i], lasery1[i]);
    }
    if(level == 4) if(dist(blobsx4, blobsy4, laserx1[i], lasery1[i]) < blobRadius && !blobsdead4)
    {
      blobsfrozen4 = true;
      shot[i] = false;
      lasertarget[i] = -1;
      explosion(laserx1[i], lasery1[i]);
    }
    if(level == 5)
    {
      for(int k = 0; k < blobsx5.length; k++)
      {
        if(dist(blobsx5[k], blobsy5[k], laserx1[i], lasery1[i]) < (blobsRadius5[k]) / 2 && !blobsdead5[k])
        {
          blobsfrozen5[k] = true;
          shot[i] = false;
          lasertarget[i] = -1;
          explosion(laserx1[i], lasery1[i]);
        }
      }
      if(dist(blobx5, bloby5, laserx1[i], lasery1[i]) < (blobRadius) && !blobdead5)
      {
        blobfrozen5 = true;
        shot[i] = false;
        lasertarget[i] = -1;
        explosion(laserx1[i], lasery1[i]);
      }
    }
    if(level == 6) for(int k = 0; k < blobsx6.length; k++) if(dist(blobsx6[k], blobsy6[k], laserx1[i], lasery1[i]) < blobRadius && !blobsdead6[k])
    {
      blobsfrozen6[k] = true;
      shot[i] = false;
      lasertarget[i] = -1;
      explosion(laserx1[i], lasery1[i]);
    }
    if(level == 7) for(int k = 0; k < blobsx7.length; k++) if(dist(blobsx7[k], blobsy7[k], laserx1[i], lasery1[i]) < blobRadius && !blobsdead7[k])
    {
      blobsfrozen7[k] = true;
      shot[i] = false;
      lasertarget[i] = -1;
      explosion(laserx1[i], lasery1[i]);
    }
    if(level == 8) for(int k = 0; k < blobsx8.length; k++) if(dist(blobsx8[k], blobsy8[k], laserx1[i], lasery1[i]) < blobRadius && !blobsdead8[k])
    {
      blobsfrozen8[k] = true;
      shot[i] = false;
      lasertarget[i] = -1;
      explosion(laserx1[i], lasery1[i]);
    }
    if(level == 9) for(int k = 0; k < blobsx9.length; k++) if(dist(blobsx9[k], blobsy9[k], laserx1[i], lasery1[i]) < blobsRadius9[k] / 2 && !blobsdead9[k])
    {
      blobsfrozen9[k] = true;
      shot[i] = false;
      lasertarget[i] = -1;
      explosion(laserx1[i], lasery1[i]);
    }
    if(level == 10) for(int k = 0; k < blobsx10.length; k++) if(dist(blobsx10[k], blobsy10[k], laserx1[i], lasery1[i]) < blobsRadius10[k] / 2 && !blobsdead10[k])
    {
      if(k < blobsx10.length - bosshits && bosshits < blobsx10.length)
      {
        if(frame > bossframe){
          bosshits++;
          bossframe = frame + 240;
        }
      }
      else blobsfrozen10[k] = true;
      shot[i] = false;
      lasertarget[i] = -1;
      explosion(laserx1[i], lasery1[i]);
    }
  }
}

void bloblaser()
{
  strokeWeight(3);
  stroke(0,200,0);
  for(int i = 0; i < 5; i++){
    if(roboshot[i] && ((robolaserx2[i] > 500) || (robolaserx2[i] < 0) || (robolasery2[i] > 500) || (robolasery2[i] < 0))) roboshot[i] = false;
  }
  if(!blobsdead9[blobsx9.length - 1] && !blobsfrozen9[blobsx9.length - 1] && frameCount - robolaserframe > robolaserReload){
    for(int i = 0; i < 5; i++){
      if(roboshot[i] == false){
        robolaserx1[i] = blobsx9[16];
        robolasery1[i] = blobsy9[16];
        theta = atan2(wormPartsY[28] - robolasery1[i], wormPartsX[28] - robolaserx1[i]);
        robolaserdx[i] = cos(theta) * wormRadius;
        robolaserdy[i] = sin(theta) * wormRadius;
        robolaserx2[i] = robolaserx1[i] + robolaserdx[i];
        robolasery2[i] = robolasery1[i] + robolaserdy[i];
        robolaserdx[i] /= 5;
        robolaserdy[i] /= 5;
        roboshot[i] = true;
        robolaserframe = frameCount;
        i = 100;
      }
    }
  }
  for(int i = 0; i < 5; i++){
    if(roboshot[i] == false) continue;
    robolaserx1[i] += robolaserdx[i];
    robolasery1[i] += robolaserdy[i];
    robolaserx2[i] += robolaserdx[i];
    robolasery2[i] += robolaserdy[i];
    line(robolaserx1[i],robolasery1[i],robolaserx2[i],robolasery2[i]);                                                                              //THE LINE
    for(int k = 0; k < wormPartsX.length; k++){
      if(dist(wormPartsX[k], wormPartsY[k], robolaserx1[i], robolasery1[i]) < wormRadius / 2)
      {
        contact = true;
        contactframe = frameCount;
        hp--;
        roboshot[i] = false;
        explosion2(robolaserx1[i], robolasery1[i]);
      }
    }
  }
}

void bosslaser()
{
  strokeWeight(3);
  stroke(0,200,0);
  for(int i = 0; i < 5; i++){
    if(roboshot[i] && ((robolaserx2[i] > 500) || (robolaserx2[i] < 0) || (robolasery2[i] > 500) || (robolasery2[i] < 0))) roboshot[i] = false;
  }
  if(!blobsdead10[0] && !blobsfrozen10[0] && frameCount - robolaserframe > robolaserReload * 1.5){
    for(int i = 0; i < 5; i++){
      if(roboshot[i] == false){
        robolaserx1[i] = blobsx10[0];
        robolasery1[i] = blobsy10[0];
        theta = atan2(wormPartsY[28] - robolasery1[i], wormPartsX[28] - robolaserx1[i]);
        robolaserdx[i] = cos(theta) * .1;
        robolaserdy[i] = sin(theta) * .1;
        robolaserx2[i] = robolaserx1[i] + robolaserdx[i] * 100;
        robolasery2[i] = robolasery1[i] + robolaserdy[i] * 100;
        roboshot[i] = true;
        robolaserframe = frameCount;
        i = 100;
      }
    }
  }
  for(int i = 0; i < 5; i++){
    if(roboshot[i] == false) continue;
    robolaserx1[i] += robolaserdx[i];
    robolasery1[i] += robolaserdy[i];
    robolaserx2[i] += robolaserdx[i];
    robolasery2[i] += robolaserdy[i];
    line(robolaserx1[i],robolasery1[i],robolaserx2[i],robolasery2[i]);                                                                              //THE LINE
    for(int k = 0; k < wormPartsX.length; k++){
      if(dist(wormPartsX[k], wormPartsY[k], robolaserx1[i], robolasery1[i]) < wormRadius / 2)
      {
        contact = true;
        contactframe = frameCount;
        hp--;
        roboshot[i] = false;
        explosion2(robolaserx1[i], robolasery1[i]);
      }
    }
  }
}

void explosion(float x, float y)
{
  noStroke();
  fill(255, 0, 0,100);
  ellipse(x,y,10,10);
}

void explosion2(float x, float y)
{
  noStroke();
  fill(0, 200, 0,100);
  ellipse(x,y,10,10);
}

void drawPowerups()
{
  
  noStroke();
  if(level == 2 && !triplelaser)
  {
    x=width/2+(100*cos(frame*.02)) + frame / 4; //x+1;
    y=height/2+(200*sin(frame*.02)) + frame / 4;
    drawtriplelaser(x,y,diam);
  }
  if(level == 3 && !matrix)
  {
    if(frame > 430)
    {
      x -= 10;
      y=height/2+(100*sin(frame*.04));
    }
    else
    {
      x=width/2+(200*cos(frame*.02)); //x+1;
      y=height/2+(100*sin(frame*.04));
    }
    drawmatrix(x,y,diam);
  }
  if(level == 7 && !homing)
  {
    if(frame > 400)
    {
      x -= 5;
    }
    else
    {
      x=40+(20*cos(frame*.02)); //x+1;
      y=40+(20*sin(frame*.02));
    }
    drawhoming(x,y,diam);
  }
  if(level == 8 && !shockwave)
  {
    x=400+(20*cos(frame*.08)); //x+1;
    y=100+(20*sin(frame*.08));
    drawshockwave(x,y,diam);
  }
  if(!hpcaptured[level - 1])      
  {
    if(level == 1)
    {
      hpx = width/2+(200*cos(-frame*.02));
      hpy = height/2+(200*sin(-frame*.02));
    }
    if(level == 2)
    {
      hpx = width/4 + abs(frame % 400 - 200) - 100;
      hpy = height/4 + abs((frame + 100) % 400 - 200) - 100;
    }
    if(level == 3)
    {
      hpx = 3 * width/4 + abs(frame % 400 - 200) - 100;
      hpy = height/4 + abs((frame + 100) % 400 - 200) - 100;
    }
    if(level == 4)
    {
      hpx = -100;
      hpy = -100;
    }
    if(level == 5)
    {
      hpx = -100;
      hpy = -100;
    }
    if(level == 6)
    {
      hpx = width/2 + abs(frame % 400 - 200) - 100;
      hpy = height/2 + abs((frame + 100) % 400 - 200) - 100;
    }
    if(level == 7)
    {
      hpx = -100;
      hpy = -100;
    }
    if(level == 8)
    {
      hpx = width/2 + abs(frame % 400 - 200) - 100;
      hpy = height/2 + abs((frame + 100) % 400 - 200) - 100;
    }
    if(level == 9)
    {
      hpx = -100;
      hpy = -100;
    }
    if(level == 10)
    {
      hpx = width/2+(200*cos(-frame*.02));
      hpy = height/2+(200*sin(-frame*.02));
    }
    hpunit(hpx, hpy, 40 * sin(frameCount*.15));
  }
}

void powerupContact()
{
  for(int i = 0; i < wormPartsX.length; i++)
  {
    if(dist(wormPartsX[i], wormPartsY[i], x, y) < 10)
    {
      if(level == 2 && !triplelaser) triplelaser = true;
      if(level == 3 && !matrix)
      {
        bullettime = 500;
        matrix = true;
      }
      if(level == 7 && !homing) homing = true;
      if(level == 8 && !shockwave){
        shockwave = true;
        shockammo = 3;
      }
    }
    if(!hpcaptured[level - 1] && dist(wormPartsX[i], wormPartsY[i], hpx, hpy) < 10)
    {
      hpcaptured[level - 1] = true;
      hp++;
    }
  }
}

void tutorial()
{
  fill(255,150,120);
  textAlign(CENTER);
  textFont(menuText3,48);
  text("Tutorial",250,50);
  textFont(menuText,38);
  fill(80);
  text("Menu",50,490);
  text("Next",450,490);
  fill(210,100,60);
  textFont(menuText3,28);
  text("Controls",250,80);
//  strokeWeight(1);
//  stroke(0);
//  noFill();
//  rect(410,458,81,34);
  if(mousePressed == true && mouseclicked && mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  {
    mouseclicked = false;
    mode = 0;
  }
  if(mousePressed == true && mouseclicked && mouseX<=491 && mouseX>=410 && mouseY<=492 && mouseY>=458)
  {
    mouseclicked = false;
    mode = 5;
  }
  strokeWeight(2);
  stroke(80);
  if(mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  { line(7,495,92,495); }
  if(mouseX<=491 && mouseX>=410 && mouseY<=492 && mouseY>=458)
  {
    line(410,492,491,492);
    triangle(491,488,491,496,496,492);
  }
  fill(80);
  textAlign(LEFT);
  textFont(menuText5,18);
  text("- Use the mouse to guide your worm",180,190);
  text("- Left-click fires stun-lasers",180,300);
  float [] tutX = {56.6, 57.8, 59.6, 62.2, 65.1, 67.6, 70.3, 72.6, 74.8, 75.4, 75.1, 73.1, 70.7, 67.7, 65.0,
                   62.6,60.3, 59.5, 59.2, 59.0, 59.6, 60.4, 62.0, 64.5, 68.5, 73.6, 80.2, 87.3, 93.5, 93.5};
  float [] tutY = {97.6, 105.5, 113.3, 120.9, 128.4, 136.0, 143.5, 151.2, 158.9, 166.8, 174.8, 182.6, 190.2, 197.6,205.2,
                   212.8, 220.4, 228.4, 236.4, 244.4,252.4, 260.3, 268.2, 275.8, 282.7, 288.9, 293.4, 297.1, 302.1, 302.1};
  for(int i = 0; i < tutX.length; i++)
  {
    noStroke();
    fill(210,100,60);
    ellipse(tutX[i],tutY[i],wormRadius,wormRadius);
  }
  strokeWeight(wormRadius+2);
  stroke(255,150,120);
  line(tutX[9],tutY[9],tutX[10],tutY[10]);
  line(tutX[10],tutY[10],tutX[11],tutY[11]);
  line(tutX[11],tutY[11],tutX[12],tutY[12]);
  line(tutX[12],tutY[12],tutX[13],tutY[13]);
  
  strokeWeight(3);
  stroke(255,0,0);
  line(200,380,215,390);
}

void tutorial2()
{
  fill(255,150,120);
  textAlign(CENTER);
  textFont(menuText3,48);
  text("Tutorial",250,50);
  textFont(menuText,38);
  fill(80);
  text("Menu",50,490);
  text("Next",450,490);
  text("Prev",350,490);
  fill(210,100,60);
  textFont(menuText3,28);
  text("Blobs",250,80);
//  strokeWeight(1);
//  stroke(0);
//  noFill();
//  rect(310,458,81,34);
  if(mousePressed == true && mouseclicked && mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  {
    mouseclicked = false;
    mode = 0;
  }
  if(mousePressed == true && mouseclicked && mouseX<=491 && mouseX>=410 && mouseY<=492 && mouseY>=458)
  {
    mouseclicked = false;
    mode = 6;
  }
  if(mousePressed == true && mouseclicked && mouseX<=391 && mouseX>=310 && mouseY<=492 && mouseY>=458)
  {
    mouseclicked = false;
    mode = 2;
  }
  strokeWeight(2);
  stroke(80);
  if(mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  { line(7,495,92,495); }
  if(mouseX<=491 && mouseX>=410 && mouseY<=492 && mouseY>=458)
  {
    line(410,492,491,492);
    triangle(491,488,491,496,496,492);
  }
  if(mouseX<=391 && mouseX>=310 && mouseY<=492 && mouseY>=458)
  {
    line(310,492,391,492);
    triangle(310,488,310,496,305,492);
  }
  fill(80);
  textAlign(LEFT);
  textFont(menuText5,18);
  text("Non-moving",180,145);
  text("Moving (dodge these)",180,200);
  text("Moving (destroy these)",180,255);
  text("Growing",180,310);
  text("Homing",180,365);
  text("Intelligent",180,415);
  //non-moving
  strokeWeight(1);
  stroke(220,0,255);
  fill(255,0,220);
  ellipse(120,140,blobRadius,blobRadius);
  //moving
  stroke(0,255,0);
  fill(200,255,0);
  ellipse(120+(10*sin(frameCount*.05)),195,blobRadius,blobRadius);
  //growing
  fill(255,255,0);
  stroke(255,0,0);
  ellipse(120+(10*cos(frameCount*.05)),250,blobRadius,blobRadius);
  stroke(200,255,0);
  strokeWeight(2+sin(frameCount*.05));
  fill(0,190,255);
  ellipse(120,305,blobRadius*(2+sin(frameCount*.05)),blobRadius*(2+sin(frameCount*.05)));
  //seeking
//  x=120+(10*cos(frameCount*.02))
//  y=340+(10*sin(frameCount*.02))
  fill(255,0,0,100+100*sin(frameCount*.08));
  strokeWeight(1);
  stroke(255,0,0);
  ellipse(120+(10*cos(frameCount*.05)),360+(10*sin(frameCount*.05)),blobRadius,blobRadius);
  noStroke();
  fill(255,0,0,80+80*sin(frameCount*.08));
  ellipse(120+(10*cos(frameCount*.05)),360+(10*sin(frameCount*.05)),blobRadius+2,blobRadius+2);
  fill(255,0,0,50+50*sin(frameCount*.08));
  ellipse(120+(10*cos(frameCount*.05)),360+(10*sin(frameCount*.05)),blobRadius+7,blobRadius+7);
  fill(255,0,0,20+20*sin(frameCount*.08));
  ellipse(120+(10*cos(frameCount*.05)),360+(10*sin(frameCount*.05)),blobRadius+10,blobRadius+10);
  
  fill(0,200,0,100+100*sin(frameCount*.08));
  strokeWeight(1);
  stroke(0,200,0);
  ellipse(120+abs((frameCount / 2) % 40 - 20) - 10,410+abs((frameCount / 2 + 10) % 40 - 20) - 10,blobRadius,blobRadius);
  noStroke();
  fill(0,200,0,80+80*sin(frameCount*.08));
  ellipse(120+abs((frameCount / 2) % 40 - 20) - 10,410+abs((frameCount / 2 + 10) % 40 - 20) - 10,blobRadius+2,blobRadius+2);
  fill(0,200,0,50+50*sin(frameCount*.08));
  ellipse(120+abs((frameCount / 2) % 40 - 20) - 10,410+abs((frameCount / 2 + 10) % 40 - 20) - 10,blobRadius+7,blobRadius+7);
  fill(0,200,0,20+20*sin(frameCount*.08));
  ellipse(120+abs((frameCount / 2) % 40 - 20) - 10,410+abs((frameCount / 2 + 10) % 40 - 20) - 10,blobRadius+10,blobRadius+10);
}

void tutorial3()
{
  fill(255,150,120);
  textAlign(CENTER);
  textFont(menuText3,48);
  text("Tutorial",250,50);
  textFont(menuText,38);
  fill(80);
  text("Menu",50,490);
  text("Next",450,490);
  text("Prev",350,490);
  fill(210,100,60);
  textFont(menuText3,28);
  text("Powerups",250,80);
//  strokeWeight(1);
//  stroke(0);
//  noFill();
//  rect(310,458,81,34);
  if(mousePressed == true && mouseclicked && mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  {
    mouseclicked = false;
    mode = 0;
  }
  if(mousePressed == true && mouseclicked && mouseX<=491 && mouseX>=410 && mouseY<=492 && mouseY>=458)
  {
    mouseclicked = false;
    mode = 7;
  }
  if(mousePressed == true && mouseclicked && mouseX<=391 && mouseX>=310 && mouseY<=492 && mouseY>=458)
  {
    mouseclicked = false;
    mode = 5;
  }
  strokeWeight(2);
  stroke(80);
  if(mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  { line(7,495,92,495); }
  if(mouseX<=491 && mouseX>=410 && mouseY<=492 && mouseY>=458)
  {
    line(410,492,491,492);
    triangle(491,488,491,496,496,492);
  }
  if(mouseX<=391 && mouseX>=310 && mouseY<=492 && mouseY>=458)
  {
    line(310,492,391,492);
    triangle(310,488,310,496,305,492);
  }
    fill(80);
    textAlign(LEFT);
    textFont(menuText5,18);
    text("Triple Shot",180,145);
    text("Matrix Mode [hold spacebar]",180,200);
    text("Homing Lasers",180,255);
    text("Shockwave, 3 uses [right-click]",180,310);
    text("+1 Life",180,365);
    noStroke();
    x=120+(6*cos(frameCount*.05)); y=140+(6*sin(frameCount*.05));
    drawtriplelaser(x,y,diam);
    x=120+(6*cos(frameCount*.05+PI/2)); y=195+(6*sin(frameCount*.05+PI/2));
    drawmatrix(x,y,diam);
    x=120+(6*cos(frameCount*.05+PI)); y=250+(6*sin(frameCount*.05+PI));
    drawhoming(x,y,diam);
    x=120+(6*cos(frameCount*.05+(3*PI/2))); y=305+(6*sin(frameCount*.05+(3*PI/2)));
    drawshockwave(x,y,diam);
    x=120+(6*cos(frameCount*.05)); y=360+(6*sin(frameCount*.05));
    hpunit(x, y, 40 * sin(frameCount*.15));
}
void tutorial4()
{
  float [] tut2X = {59.5, 67.4, 75.2, 82.8, 90.3, 98.0, 105.3, 113.0, 120.8, 128.7, 136.7, 144.7, 152.7, 160.7, 168.5, 175.4, 180.2,
                    182.5, 181.5, 177.9, 171.6, 164.2, 156.3, 148.3, 140.4, 133.0, 126.3, 120.6, 116.8, 116.8};
  float [] tut2Y = {167.2, 168.2, 170.2, 172.6, 175.4, 177.6, 180.9, 182.9, 184.9, 186.0, 186.5, 186.8, 186.9, 186.4,
                    185.1, 181.0, 174.6, 166.9, 159.0, 151.8, 146.9, 143.8, 142.7, 142.2, 143.3, 146.3, 150.7, 156.3, 163.4, 163.4};
  float [] tut3X = {21.179733, 26.232212, 29.84438, 35.469154, 40.82613, 47.970654, 55.9516, 62.593372, 67.75375, 72.595764, 77.9036, 84.02603, 91.89875, 99.528175, 107.1473,
                    115.04532, 122.94794, 129.48532, 135.2412, 140.26088, 146.02882, 153.69724, 161.63237, 169.3397, 176.22794, 181.73976, 186.31032, 191.59859, 196.78677, 196.78677};
  float [] tut3Y = {275.60046, 269.39786, 262.25977, 256.571, 250.6294, 247.02998, 247.5818, 252.04128, 258.15442, 264.5227, 270.50827, 275.65762, 277.079, 274.67236, 272.23334, 270.96002,
                    272.20444, 276.81558, 282.37167, 288.60086, 294.1444, 296.4238, 297.44043, 295.2964, 291.22794, 285.4297, 278.86386, 272.86102, 266.77145, 266.77145};

  for(int i = 0; i < tut2X.length; i++)
  {
    noStroke();
    fill(210,100,60);
    ellipse(tut2X[i],tut2Y[i],wormRadius,wormRadius);
  }
  strokeWeight(wormRadius+2);
  stroke(255,150,120);
  line(tut2X[9],tut2Y[9],tut2X[10],tut2Y[10]);
  line(tut2X[10],tut2Y[10],tut2X[11],tut2Y[11]);
  line(tut2X[11],tut2Y[11],tut2X[12],tut2Y[12]);
  line(tut2X[12],tut2Y[12],tut2X[13],tut2Y[13]);
  tut2X = tut3X;
  tut2Y = tut3Y;
  for(int i = 0; i < tut2X.length; i++)
  {
    noStroke();
    fill(255,0,0,200);
    ellipse(tut2X[i],tut2Y[i],wormRadius,wormRadius);
  }
  strokeWeight(wormRadius+2);
  stroke(255,150,120,255);
  line(tut2X[9],tut2Y[9],tut2X[10],tut2Y[10]);
  line(tut2X[10],tut2Y[10],tut2X[11],tut2Y[11]);
  line(tut2X[11],tut2Y[11],tut2X[12],tut2Y[12]);
  line(tut2X[12],tut2Y[12],tut2X[13],tut2Y[13]);
  strokeWeight(1);
  stroke(0,255,0);
  fill(200,255,0);
  ellipse(143,169,blobRadius,blobRadius);
  ellipse(191,256,blobRadius,blobRadius);
  fill(80);
  textAlign(LEFT);
  textFont(menuText5,18);
  text("Encircle blobs to destroy them",222,170);
  text("But be careful! \nTouching the blobs will hurt",230,250);
  fill(210,100,60);
  textFont(menuText3,30);
  text("Good Luck!",240,380);
  fill(255,150,120);
  textAlign(CENTER);
  textFont(menuText3,48);
  text("Tutorial",250,50);
  textFont(menuText,38);
  fill(80);
  text("Menu",50,490);
  text("Prev",350,490);
  fill(210,100,60);
  textFont(menuText3,28);
  text("Tips",250,80);
  fill(210,100,60);
//  strokeWeight(1);
//  stroke(0);
//  noFill();
//  rect(310,458,81,34);
  if(mousePressed == true && mouseclicked && mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  {
    mouseclicked = false;
    mode = 0;
  }
  if(mousePressed == true && mouseclicked && mouseX<=391 && mouseX>=310 && mouseY<=492 && mouseY>=458)
  {
    mouseclicked = false;
    mode = 6;
  }
  strokeWeight(2);
  stroke(80);
  if(mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  { line(7,495,92,495); }
  if(mouseX<=391 && mouseX>=310 && mouseY<=492 && mouseY>=458)
  {
    line(310,492,391,492);
    triangle(310,488,310,496,305,492);
  }
}

void keyPressed()
{
  if(key == ' ') space = true;
  if(mode == 1 && keyCode == BACKSPACE) hp = 0;
  if(mode == 3)
  {
    if(keyCode == ENTER) enter = true;
    else enter = false;
    if(((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z')) && codeinput.length() < 5) codeinput = (codeinput + key).toUpperCase();
    if(keyCode == BACKSPACE && codeinput.length() > 0) codeinput = codeinput.substring(0, codeinput.length()-1);
  }
}

void keyReleased()
{
  space = false;
}

void cheatcodes()
{
  textAlign(LEFT);
  textFont(menuText,38);
  fill(255,150,120);
  text("The",30,50);
  textAlign(CENTER);
  textFont(menuText2,100);
  text("Game",250,260);
  for(int i = 0; i < wX.length; i++)
  {
    noStroke();
    fill(210,100,60);
    ellipse(wX[i],wY[i],wormRadius,wormRadius);
    ellipse(oX[i],oY[i],wormRadius,wormRadius);
    ellipse(rX[i],rY[i],wormRadius,wormRadius);
    ellipse(mX[i],mY[i],wormRadius,wormRadius);
  }
  strokeWeight(wormRadius+2);
  stroke(255,150,120);
  line(wX[9],wY[9],wX[10],wY[10]);
  line(wX[10],wY[10],wX[11],wY[11]);
  line(wX[11],wY[11],wX[12],wY[12]);
  line(wX[12],wY[12],wX[13],wY[13]);
  line(oX[9],oY[9],oX[10],oY[10]);
  line(oX[10],oY[10],oX[11],oY[11]);
  line(oX[11],oY[11],oX[12],oY[12]);
  line(oX[12],oY[12],oX[13],oY[13]);
  line(rX[9],rY[9],rX[10],rY[10]);
  line(rX[10],rY[10],rX[11],rY[11]);
  line(rX[11],rY[11],rX[12],rY[12]);
  line(rX[12],rY[12],rX[13],rY[13]);
  line(mX[9],mY[9],mX[10],mY[10]);
  line(mX[10],mY[10],mX[11],mY[11]);
  line(mX[11],mY[11],mX[12],mY[12]);
  line(mX[12],mY[12],mX[13],mY[13]);
  stroke(80);
  strokeWeight(2);
  fill(255,0,0,50);
  rect(105,304,290,60);
  textAlign(CENTER);
  fill(0);
  textFont(menuText3, 48);
  text(codeinput, 250, 350);
  if(enter == true){
    if(codeinput.equals("NOOB"))
    {
      unlocked = true;
      level = 2;
      mode = 1;
    }
    else if(codeinput.equals("WORMY"))
    {
      unlocked = true;
      level = 3;
      mode = 1;
    }
    else if(codeinput.equals("HOMIE"))
    {
      unlocked = true;
      level = 4;
      mode = 1;
    }
    else if(codeinput.equals("PWNED"))
    {
      unlocked = true;
      level = 5;
      mode = 1;
    }
    else if(codeinput.equals("CHAOS"))
    {
      unlocked = true;
      level = 6;
      mode = 1;
    }
    else if(codeinput.equals("LAZER"))
    {
      unlocked = true;
      level = 7;
      mode = 1;
    }
    else if(codeinput.equals("HAXOR"))
    {
      unlocked = true;
      level = 8;
      mode = 1;
    }
    else if(codeinput.equals("MOOSE"))
    {
      unlocked = true;
      level = 9;
      mode = 1;
    }
    else if(codeinput.equals("BOSSY"))
    {
      unlocked = true;
      level = 10;
      mode = 1;
    }
    else if(codeinput.equals("ROIDS"))
    {
      triplelaser = true;
      bullettime = 50000;
      matrix = true;
      homing = true;
      shockwave = true;
      shockammo = 3000;
      fill(255,0,0);
      textFont(menuText4, 12);
      text("POWERUPS UNLOCKED", 250, 392);
    }
    else
    {
      textFont(menuText4, 12);
      text("Invalid Code", 250, 400);
    }
  }
  else
  {
    textFont(menuText4, 12);
    text("Enter cheat code", 250, 400);
  }
  textAlign(CENTER);
  textFont(menuText,38);
  fill(80);
  text("Menu",50,490);
  if(mousePressed == true && mouseclicked && mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  {
    mouseclicked = false;
    mode = 0;
  }
  strokeWeight(2);
  stroke(80);
  if(mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  { line(7,495,92,495); }
}

void deathscreen(){
  int feces = frameCount - killframe;
  if(feces > 350) setup();
  textAlign(CENTER);
  fill(0, feces);
  textFont(menuText3, 48);
  text("GAME OVER", 250, 250);
  strokeWeight(30);
  stroke(255, 0, 0);
  line(bx1, -30, bx1, feces);
  line(bx2, -30, bx2, feces*2);
  strokeWeight(20);
  line(bx3, -30, bx3, -100 + feces*4);
  strokeWeight(15);
  line(bx4, -30, bx4, -50 + feces*1.5);
  noStroke();
  fill(255, 0, 0, feces);
  rect(0, 0, 500, 500);
  if(feces % 60 > 30){
    fill(255);
    textFont(menuText4, 20);
    text("INSERT COINS",250,490);
  }
}

void drawtriplelaser(float x_, float y_, float diam_){
  powerup(255, 180, 0, diam_, x_, y_);
  strokeWeight(1);
  stroke(255, 0, 0);
  line(x_, y_ - 2, x_, y - diam * .5);
  line(x_ + 2*cos(3*PI/4), y_ + 2*sin(3*PI/4), x_ + diam*cos(3*PI/4)* .5, y_ + diam*sin(3*PI/4)* .5);
  line(x_ - 2*cos(3*PI/4), y_ + 2*sin(3*PI/4), x_ - diam*cos(3*PI/4)* .5, y_ + diam*sin(3*PI/4)* .5);
  noStroke();
}

void drawmatrix(float x_, float y_, float diam_){
  powerup(0, 0, 0, diam_, x_, y_);
}

void drawhoming(float x_, float y_, float diam_){
  powerup(200, 0, 200, diam_, x_, y_);
}

void drawshockwave(float x_, float y_, float diam_){
  powerup(50, 50, 255, diam_, x_, y_);
}

void powerup(float r_, float g_, float b_, float diam_, float x_, float y_)
{
  float factor = 1.0;
  if(diam_ < 10) factor = 1.5;
  fill(r_,g_,b_,100 * factor);
  ellipse(x_,y_,diam_,diam_);
  fill(r_,g_,b_,100 * factor);
  ellipse(x_,y_,diam_+2,diam_+2);
  fill(r_,g_,b_,80 * factor);
  ellipse(x_,y_,diam_+4,diam_+4);
  fill(r_,g_,b_,40 * factor);
  ellipse(x_,y_,diam_+6,diam_+6);
  fill(r_,g_,b_,20 * factor);
  ellipse(x_,y_,diam_+8,diam_+8);
  if(diam_ >= 10)
  {
    fill(r_,g_,b_,10 * factor);
    ellipse(x_,y_,diam_+10,diam_+10);
    fill(r_,g_,b_,5 * factor);
    ellipse(x_,y_,diam_+12,diam_+12);
    fill(r_,g_,b_,5 * factor);
    ellipse(x_,y_,diam_+14,diam_+14);
  
    fill(255,225,0,80);
    ellipse(x_,y_,(diam_/3),(diam_/3));
    fill(255,225,0,40);
    ellipse(x_,y_,(diam_/3)+2,(diam_/3)+2);
    fill(255,225,0,20);
    ellipse(x_,y_,(diam_/3)+4,(diam_/3)+4);
    fill(255,225,0,10);
    ellipse(x_,y_,(diam_/3)+6,(diam_/3)+6);
    fill(255,225,0,10);
    ellipse(x_,y_,(diam_/3)+8,(diam_/3)+8);
  }
}

void hpunit(float x_, float y_, float glow)
{
  rectMode(CENTER);
  noStroke();
  fill(255, 0, 0);
  rect(x_, y_, 5, 15);
  rect(x_, y_, 15, 5);
  fill(255, 0, 0, glow);
  rect(x_, y_, 7, 17);
  rect(x_, y_, 17, 7);
  fill(255, 0, 0, glow*.6);
  rect(x_, y_, 9, 19);
  rect(x_, y_, 19, 9);
  fill(255, 0, 0, glow*.3);
  rect(x_, y_, 11, 21);
  rect(x_, y_, 21, 11);
  rectMode(CORNER);
}

void displayhud()
{
  int ammo = bullettime;
  noStroke();
  if(bullettime > 500) bullettime = 500;
  if(bullettime > 0){
    fill(0, 0, 0);
    rect(250 - bullettime / 5, 498, bullettime/2.5, 2);
    rect(250 - bullettime / 5, 494, bullettime/2.5, 2);
    fill(50, 50, 50);
    rect(250 - bullettime / 5, 496, bullettime/2.5, 2);
  }
  ammo = 0;
  textAlign(LEFT);
  textFont(menuText5, 18);
  fill(0);
  text("Lives: "+hp, 15, 490);
  noStroke();
  for(int i =0; i < 5; i++)
  {
    noFill();
    stroke(0);
    strokeWeight(1);
    rect(0, 495 - i * 10, 5, 5);
    if(!shot[i] && !shot[i+5] && !shot[i+10])
    {
      fill(255,0,0);
      rect(0, 495 - ammo * 10, 5, 5);
      ammo++;
    }
  }
  if(shockwave){
    ammo = shockammo;
    if(ammo > 3) ammo = 3;
    for(int i = 0; i < ammo; i++)
    {
      stroke(50, 50, 255);
      noFill();
      strokeWeight(3);
      ellipse(90 + i * 20, 485, 15, 15);
    }
  }
}

void credits()
{
  textAlign(LEFT);
  textFont(menuText,38);
  fill(255,150,120);
  text("The",30,50);
  textAlign(CENTER);
  textFont(menuText2,100);
  text("Game",250,260);
  for(int i = 0; i < wX.length; i++)
  {
    noStroke();
    fill(210,100,60);
    ellipse(wX[i],wY[i],wormRadius,wormRadius);
    ellipse(oX[i],oY[i],wormRadius,wormRadius);
    ellipse(rX[i],rY[i],wormRadius,wormRadius);
    ellipse(mX[i],mY[i],wormRadius,wormRadius);
  }
  strokeWeight(wormRadius+2);
  stroke(255,150,120);
  line(wX[9],wY[9],wX[10],wY[10]);
  line(wX[10],wY[10],wX[11],wY[11]);
  line(wX[11],wY[11],wX[12],wY[12]);
  line(wX[12],wY[12],wX[13],wY[13]);
  line(oX[9],oY[9],oX[10],oY[10]);
  line(oX[10],oY[10],oX[11],oY[11]);
  line(oX[11],oY[11],oX[12],oY[12]);
  line(oX[12],oY[12],oX[13],oY[13]);
  line(rX[9],rY[9],rX[10],rY[10]);
  line(rX[10],rY[10],rX[11],rY[11]);
  line(rX[11],rY[11],rX[12],rY[12]);
  line(rX[12],rY[12],rX[13],rY[13]);
  line(mX[9],mY[9],mX[10],mY[10]);
  line(mX[10],mY[10],mX[11],mY[11]);
  line(mX[11],mY[11],mX[12],mY[12]);
  line(mX[12],mY[12],mX[13],mY[13]);
  textAlign(LEFT);
  fill(210,100,60);
  textFont(menuText3,34);
  text("Credits",25,325);
  textAlign(CENTER);
  fill(80);
  text("Menu",50,490);
  textAlign(LEFT);
  textFont(menuText5,18);
  text("Nicolas Hurt- Concept & Programming",35,375);
  text("Rick Livernois- Collaberation & Debugging",35,410);
  
  if(mousePressed == true && mouseclicked && mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  {
    mouseclicked = false;
    mode = 0;
  }
  stroke(80);
  strokeWeight(2);
  if(mouseX<=92 && mouseX>=7 && mouseY<=495 && mouseY>=463)
  { line(7,495,92,495); }
}

void winscreen()
{
  //text(frame, 200, 200);
  float [] tut4X = {141.9514, 149.41194, 157.25005, 165.15182, 173.06352, 181.05228, 189.05023, 197.04991, 204.99815, 212.96892, 220.82108, 228.61562, 236.22598, 243.93433,
                    251.44884, 259.07477, 266.97284, 274.94687, 282.94437, 290.944, 298.94394, 306.94394, 314.8646, 322.4863, 329.8231, 336.53464, 343.2146, 350.068, 357.5805, 357.5805};
  float [] tut4Y = {342.664, 339.77603, 338.1747, 336.92496, 335.7396, 335.31564, 335.13464, 335.0626, 335.97107, 336.65442, 338.18527, 339.9867, 342.4529, 344.59335,
                    347.33783, 349.75555, 351.02856, 351.67264,351.8732, 351.9509, 351.9835, 351.99445, 350.87057, 348.43964, 345.25037, 340.89664, 336.49457, 332.3677, 329.61777, 329.61777};
  
  for(int i = 0; i < tut4X.length; i++)
  {
    noStroke();
    fill(0,0,255, 155 + 100 * sin(frame * .2 + i*.05));
    ellipse(tut4X[i],tut4Y[i],wormRadius,wormRadius);
  }
  strokeWeight(wormRadius+2);
  stroke(100,0,255, 155 + 100 * sin(frame * .2 + PI*.5));
  line(tut4X[9],tut4Y[9],tut4X[10],tut4Y[10]);
  line(tut4X[10],tut4Y[10],tut4X[11],tut4Y[11]);
  line(tut4X[11],tut4Y[11],tut4X[12],tut4Y[12]);
  line(tut4X[12],tut4Y[12],tut4X[13],tut4Y[13]);
  
  fill(255,0,0, 127 + 127 * sin(frame * .1));
  textAlign(CENTER);
  textFont(menuText2,60);
  text("CONGRADULATIONS!",250,60);
  fill(80);
  textFont(menuText3,24);
  text("You are the worm game Champion!", 250,110);
  fill(255,150,120);
  textFont(menuText3,24);
  text("Now enjoy the game with", 150,450);
  textFont(menuText3,30);
  fill(210,100,60);
  text("Unlimited Powerups", 350,488);
  fill(0);
  textFont(menuText3,28);
  text("Unlock Powerups Code:", 180,250);
  fill(0);
  textFont(menuText3,34);
  text("ROIDS", 255,315);
  
  if(frame > 480) setup();
}
