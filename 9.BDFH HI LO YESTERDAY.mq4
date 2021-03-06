
// +----------------------------------------------------------------------------------------+ //
// |    .-._______                           FAIQHILYA                        _______.-.    | //
// |---( )_)______)                 Knowledge of the ancients                (______(_( )---| //
// |  (    ()___)                              \¦/                             (___()    )  | //
// |       ()__)                              (o o)                             (__()       | //
// |--(___()_)__________________________oOOo___(_)___oOOo_________________________(_()___)--| //
// |_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____|_____| //
// |                                                                                   2017 | //
// |----------------------------------------------------------------------------------------| //
// |                 File:     BDFH HI LO YESTERDAY                                           | //
// | Programming language:     MQL4                                                         | //
// | Development platform:     MetaTrader 4                                                 | //
// |          End product:     TARGET 2019                                                  | //
// |              Product:     26 NOPEMBER 2017                                             | //
// |                                                               [BILLION DOLLAR PROJECT] | //
// +----------------------------------------------------------------------------------------+ //
#property copyright " ©2018 JANUARI"
#property link      "hilyaalzahmita@gmail.com"
/*--------------------------------------------------------------------------------------------
                                                                    Traderathome, 16-01-2018
---------------------------------------------------------------------------------------------*/

#property indicator_chart_window

color    color1      = LimeGreen;
color    color2      = SlateGray;
color    color3      = White;
color    color4      = DodgerBlue;

color    TextColor2  = C'192,192,192';
color    TextColor3  = C'50,160,50';
color    TextColor4  = SlateGray;
color    BoxColor    = C'13,13,63';
color    BoxColor1   = C'30,20,40';
color    BoxColor2   = C'7,40,80';

// ------------------------------------------------------------------------------------------ //
//                            E X T E R N A L   V A R I A B L E S                             //
// ------------------------------------------------------------------------------------------ //

extern bool   showpanel      = true;
extern string FiboStart       = "02:00";
extern string FiboEnd         = "02:00"; 

// ------------------------------------------------------------------------------------------ //
//                            I N T E R N A L   V A R I A B L E S                             //
// ------------------------------------------------------------------------------------------ //

int         OpenBar;
double      LastHigh,
            LastLow,
            LastClose;
int         WhatWindow        = 0;
int         WhatWindow1       = 1;
int         WhatCorner0       = 0;
int         WhatCorner1       = 1;
int         WhatCorner2       = 2;
int         WhatCorner3       = 3;
int         Shiftupdown     = 0;
int         Shiftsideway     = 0;
bool        showtimer        =  true;
bool        showextradigit  =  false;  
int         BidFontSize       =  30;
string      BidFontType       =  "Arial Bold";
int         FontSize          =  9;
string      FontType          =  "Arial";
string      FontType2         =  "Arial Bold";
double      DecNos;
double      myPoint;
double      fibo;

double      AUTOSELECT;
double      col               =  White;

double      SetPoint() 

   { 
   double mPoint; 
   
   if (Digits < 4) 
   mPoint = 0.01; 
   else 
   mPoint = 0.0001; 
   
   return(mPoint); 
   }

// ------------------------------------------------------------------------------------------ //
//                             I N I T I A L I S A T I O N                                    //
// ------------------------------------------------------------------------------------------ //

   int init()
   {
   IndicatorShortName("Price-Info");  
    myPoint = SetPoint(); 
    
   return(0);
   }

// ------------------------------------------------------------------------------------------ //
//                            D E - I N I T I A L I S A T I O N                               //
// ------------------------------------------------------------------------------------------ //

   int deinit()
   {
   deleteObjects();
   return(0);
   }

// ------------------------------------------------------------------------------------------ //
//                                M A I N   P R O C E D U R E                                 //
// ------------------------------------------------------------------------------------------ //

   int start()
   {
   
    if(showextradigit){int digit=1;int digitshift=-3;int digitshift1=-5;int digitshift2=3;int fontsize=4;int sprd=1;}
    else{ digitshift=0;digitshift1=0;digitshift2=0;fontsize=0;sprd=0;}

    if (StringFind (Symbol(),"JPY", 0) != -1){ DecNos = 2+digit;}
        else { DecNos = 4+digit; }
     
   int    counted_bars=IndicatorCounted();
        
// ------------------------------------------------------------------------------------------ // 

   if(showpanel){
   
   

// ------------------------------------------------------------------------------------------ //  
   
   
   
     
   }//End show.panel
 
// ------------------------------------------------------------------------------------------ // 
      
  
// ------------------------------------------------------------------------------------------ //      

   double spread = (Ask-Bid)/myPoint;
   
   if(spread>1 && spread<=10)
   
   int sprdshift=4;
   
   

// ------------------------------------------------------------------------------------------ //     

   string symbol="";
   
        if (Symbol()=="EURUSD" || Symbol()=="EURUSDm") {symbol="EURUSD";}
   else if (Symbol()=="GBPUSD" || Symbol()=="GBPUSDm") {symbol="GBPUSD";}
   else if (Symbol()=="USDCHF" || Symbol()=="USDCHFm") {symbol="USDCHF";}
   else if (Symbol()=="USDJPY" || Symbol()=="USDJPYm") {symbol="USDJPY";}
   else if (Symbol()=="EURJPY" || Symbol()=="EURJPYm") {symbol="EURJPY";}
   else if (Symbol()=="EURCHF" || Symbol()=="EURCHFm") {symbol="EURCHF";}
   else if (Symbol()=="EURGBP" || Symbol()=="EURGBPm") {symbol="EURGBP";}
   else if (Symbol()=="USDCAD" || Symbol()=="USDCADm") {symbol="USDCAD";}
   else if (Symbol()=="AUDUSD" || Symbol()=="AUDUSDm") {symbol="AUDUSD";}
   else if (Symbol()=="GBPCHF" || Symbol()=="GBPCHFm") {symbol="GBPCHF";}
   else if (Symbol()=="GBPJPY" || Symbol()=="GBPJPYm") {symbol="GBPJPY";}
   else if (Symbol()=="CHFJPY" || Symbol()=="CHFJPYm") {symbol="CHFJPY";}
   else if (Symbol()=="NZDUSD" || Symbol()=="NZDUSDm") {symbol="NZDUSD";}
   else if (Symbol()=="EURCAD" || Symbol()=="EURCADm") {symbol="EURCAD";}
   else if (Symbol()=="AUDJPY" || Symbol()=="AUDJPYm") {symbol="AUDJPY";}
   else if (Symbol()=="EURAUD" || Symbol()=="EURAUDm") {symbol="EURAUD";}
   else if (Symbol()=="AUDCAD" || Symbol()=="AUDCADm") {symbol="AUDCAD";}
   else if (Symbol()=="AUDNZD" || Symbol()=="AUDNZDm") {symbol="AUDNZD";}
   else if (Symbol()=="NZDJPY" || Symbol()=="NZDJPYm") {symbol="NZDJPY";}
   else if (Symbol()=="CADJPY" || Symbol()=="CADJPYm") {symbol="CADJPY";}
   else if (Symbol()=="XAUUSD" || Symbol()=="XAUUSDm") {symbol="XAUUSD";}
   else if (Symbol()=="XAGUSD" || Symbol()=="XAGUSDm") {symbol="XAGUSD";}
   else if (Symbol()=="GBPAUD" || Symbol()=="GBPAUDm") {symbol="GBPAUD";}
   else if (Symbol()=="GBPCAD" || Symbol()=="GBPCADm") {symbol="GBPCAD";}
   else if (Symbol()=="AUFCHF" || Symbol()=="AUFCHFm") {symbol="AUFCHF";}
   else if (Symbol()=="CADCHF" || Symbol()=="CADCHFm") {symbol="CADCHF";}
   else if (Symbol()=="NZDCHF" || Symbol()=="NZDCHFm") {symbol="NZDCHF";}
   else if (Symbol()=="GBPNZD" || Symbol()=="GBPNZDm") {symbol="GBPNZD";}
   else if (Symbol()=="AUDCHF" || Symbol()=="AUDCHFm") {symbol="AUDCHF";}
   else if (Symbol()=="EURNZD" || Symbol()=="EURNZDm") {symbol="EURNZD";}
   else{symbol=Symbol();int syblsize = 5;int syblshift=2;}
   
   
       
// ------------------------------------------------------------------------------------------ //

  
   
  
// ------------------------------------------------------------------------------------------ //

   int BarHour = Time[0] + 60 * Period() - TimeCurrent();
   double ld_0 = BarHour / 60.0;
   int BarSec = BarHour % 60;
   BarHour = (BarHour - BarHour % 60) / 60;
   
   if(BarSec<=9)string zero="0";
   if(BarHour>=1 && BarHour<=9)int shift=-1;
   else if(BarHour>=10 && BarHour<=99)shift=-6;
   else if(BarHour>=100 && BarHour<=999)shift=-15;
   else if(BarHour>=1000 && BarHour<=9999)shift=-16;
   else if(BarHour>=10000 && BarHour<=99999)shift=-19;
   
   CreateFX3_Labels( "Panel025",138,135); 
   ObjectSetText("Panel025", "" + BarHour + ":"+zero+"" + BarSec, 11, "Arial", White);
   
// ------------------------------------------------------------------------------------------ //      
      
   {  string BarTime="", LastBarTime="";         
   string BarDay="", LastBarDay="";
   int CloseBar;
          
   for(int i=Bars; i>=0; i--)
   {  if (Period() > 60) return(0);		//Chart cannot be higher than H4
   BarTime = TimeToStr(Time[i], TIME_MINUTES);
   LastBarTime = TimeToStr(Time[i+1], TIME_MINUTES);
   BarDay = TimeToStr(Time[i],TIME_DATE);
   LastBarDay = TimeToStr(Time[i+1],TIME_DATE); 
      
   if ((FiboEnd == "02:00" && BarTime>=FiboEnd && BarDay>LastBarDay) || (BarTime>=FiboEnd && LastBarTime<FiboEnd))
   {  CloseBar = i + 1;
         
   if (OpenBar>0)
   {  calculatePivotRangeValues(OpenBar, CloseBar);  }  }
      
   if ((FiboStart == "02:00" && BarTime>=FiboStart && BarDay>LastBarDay) || (BarTime>=FiboStart && LastBarTime<FiboStart))
   { OpenBar = i; }   
   }   
      
   CreateFX3_Labels( "Panel026",10,134); 
   ObjectSetText("Panel026", "", 18, "Webdings", C'5,20,40');//C'7,20,40');
   CreateFX3_Labels( "Panel027",10,121); 
   ObjectSetText("Panel027", "", 0, "Webdings", C'5,20,40');
   
   
   
   
   CreateFX3_Labels( "Panel030",65,154); 
   ObjectSetText("Panel030", ""+DoubleToStr(LastHigh,DecNos), FontSize, FontType, LimeGreen);
   
   CreateFX3_Labels( "Panel031",65,135); 
   ObjectSetText("Panel031", ""+DoubleToStr(LastLow,DecNos), FontSize, FontType, Magenta);
                
// ------------------------------------------------------------------------------------------ //
  
   }
   return(0);  
}
   int CreateFX1_Labels( string b, int x, int y ) {
   ObjectCreate( b, OBJ_LABEL, WhatWindow, 0, 0 );
   ObjectSet( b, OBJPROP_CORNER, WhatCorner1 );
   ObjectSet( b, OBJPROP_XDISTANCE,x+Shiftupdown);
   ObjectSet( b, OBJPROP_YDISTANCE,y+Shiftsideway);
   ObjectSet( b, OBJPROP_BACK, false );
    return(0);}
   
   int CreateFX3_Labels( string c, int x2, int y2 ) {
   ObjectCreate( c, OBJ_LABEL, WhatWindow, 0, 0 );
   ObjectSet( c, OBJPROP_CORNER, WhatCorner3 );
   ObjectSet( c, OBJPROP_XDISTANCE,x2+Shiftupdown);
   ObjectSet( c, OBJPROP_YDISTANCE,y2+Shiftsideway);
   ObjectSet( c, OBJPROP_BACK, false );
    return(0);}
  
   void deleteObjects(){
   
   ObjectDelete("Panel001");
   ObjectDelete("Panel002");
   ObjectDelete("Panel003");
   ObjectDelete("Panel004");
   ObjectDelete("Panel005");
   ObjectDelete("Panel006");
   ObjectDelete("Panel007");
   ObjectDelete("Panel008");
   ObjectDelete("Panel009");
   ObjectDelete("Panel010");
   ObjectDelete("Panel011");
   ObjectDelete("Panel012");
   ObjectDelete("Panel013");
   ObjectDelete("Panel014");
   ObjectDelete("Panel015");
   ObjectDelete("Panel016");
   ObjectDelete("Panel017");
   ObjectDelete("Panel018");
   ObjectDelete("Panel019");
   ObjectDelete("Panel020");
   ObjectDelete("Panel021");
   ObjectDelete("Panel022");
   ObjectDelete("Panel023");
   ObjectDelete("Panel024");
   ObjectDelete("Panel025");
   ObjectDelete("Panel026");
   ObjectDelete("Panel027");
   ObjectDelete("Panel028");
   ObjectDelete("Panel029");
   ObjectDelete("Panel030");
   ObjectDelete("Panel031");   
   }
    
   void calculatePivotRangeValues(int openBar, int closeBar)
   {
   LastHigh = High[Highest(NULL, 0, MODE_HIGH, (openBar - closeBar + 1), closeBar)];
   LastLow = Low[Lowest(NULL, 0, MODE_LOW, (openBar - closeBar + 1), closeBar)];
   LastClose = Close[closeBar];
   }
// ------------------------------------------------------------------------------------------ //
//                                     E N D   P R O G R A M                                  //
// ------------------------------------------------------------------------------------------ //
/*                                                         
                                        ud$$$**BILLION$bc.                          
                                    u@**"        PROJECT$$Nu                       
                                  J                ""#$$$$$$r                     
                                 @                       $$$$b                    
                               .F                        ^*3$$$                   
                              :% 4                         J$$$N                  
                              $  :F                       :$$$$$                  
                             4F  9                       J$$$$$$$                 
                             4$   k             4$$$$bed$$$$$$$$$                 
                             $$r  'F            $$$$$$$$$$$$$$$$$r                
                             $$$   b.           $$$$$$$$$$$$$$$$$N                
                             $$$$$k 3eeed$$b    XARD777."$$$$$$$$$                
              .@$**N.        $$$$$" $$$$$$F'L $$$$$$$$$$$  $$$$$$$                
              :$$L  'L       $$$$$ 4$$$$$$  * $$$$$$$$$$F  $$$$$$F         edNc   
             @$$$$N  ^k      $$$$$  3$$$$*%   $F4$$$$$$$   $$$$$"        d"  z$N  
             $$$$$$   ^k     '$$$"   #$$$F   .$  $$$$$c.u@$$$          J"  @$$$$r 
             $$$$$$$b   *u    ^$L            $$  $$$$$$$$$$$$u@       $$  d$$$$$$ 
              ^$$$$$$.    "NL   "N. z@*     $$$  $$$$$$$$$$$$$P      $P  d$$$$$$$ 
                 ^"*$$$$b   '*L   9$E      4$$$  d$$$$$$$$$$$"     d*   J$$$$$r   
                      ^$$$$u  '$.  $$$L     "#" d$$$$$$".@$$    .@$"  z$$$$*"     
                        ^$$$$. ^$N.3$$$       4u$$$$$$$ 4$$$  u$*" z$$$"          
                          '*$$$$$$$$ *$b      J$$$$$$$b u$$P $"  d$$P             
                             #$$$$$$ 4$ 3*$"$*$ $"$'c@@$$$$ .u@$$$P               
                               "$$$$  ""F~$ $uNr$$$^&J$$$$F $$$$#                 
                                 "$$    "$$$bd$.$W$$$$$$$$F $$"                   
                                   ?k         ?$$$$$$$$$$$F'*                     
                                    9$$bL     z$$$$$$$$$$$F                       
                                     $$$$    $$$$$$$$$$$$$                        
                                      '#$$c  '$$$$$$$$$"                          
                                       .@"#$$$$$$$$$$$$b                          
                                     z*      $$$$$$$$$$$$N.                       
                                   e"      z$$"  #$$$k  '*$$.                     
                                .u*      u@$P"      '#$$c   "$$c                   
                        u@$*"""       d$$"            "$$$u  ^*$$b.               
                      :$F           J$P"                ^$$$c   '"$$$$$$bL        
                     d$$  ..      @$#                      #$$b         '#$       
                     9$$$$$$b   4$$                          ^$$k         '$      
                      "$$6""$b u$$                             '$    d$$$$$P      
                        '$F $$$$$"                              ^b  ^$$$$b$       
                         '$W$$$$"                                'b@$$$$"         
                                                                  ^$$$*/     