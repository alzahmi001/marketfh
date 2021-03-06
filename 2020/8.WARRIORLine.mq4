
// +----------------------------------------------------------------------------------------+ //
// |    .-._______                           FAIQHILYA                        _______.-.    | //
// |---( )_)______)                 Knowledge of the ancients                (______(_( )---| //
// |  (    ()___)                              \¦/                             (___()    )  | //
// |       ()__)                              (o o)                             (__()       | //
// |--(___()_)__________________________oOOo___(_)___oOOo_________________________(_()___)--| //
// |_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____|_____| //
// |                                                                                   2017 | //
// |----------------------------------------------------------------------------------------| //
// |                 File:     BDFH ALL MA                                             | //
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
//---- indicator settings

#property  indicator_chart_window
#property  indicator_buffers 3
#property indicator_color1 Silver      
#property indicator_color2 C'246,169,80':
#property indicator_color3 C'246,169,180':
#property indicator_width1 2
#property indicator_width2 2
#property indicator_width3 2

extern int       MAPeriod=975;
extern string  m = "--Moving Average Types--";
extern string  m0 = " 0 = SMA";
extern string  m1 = " 1 = EMA";
extern string  m2 = " 2 = SMMA";
extern string  m3 = " 3 = LWMA";
extern string  m4 = " 4 = LSMA";
extern int       MAType=2;
extern string  p = "--Applied Price Types--";
extern string  p0 = " 0 = close";
extern string  p1 = " 1 = open";
extern string  p2 = " 2 = high";
extern string  p3 = " 3 = low";
extern string  p4 = " 4 = median(high+low)/2";
extern string  p5 = " 5 = typical(high+low+close)/3";
extern string  p6 = " 6 = weighted(high+low+close+close)/4";
extern int       MAAppliedPrice = 0;   //0=close, 1=open, 2=high, 3=low, 4=median(high+low)/2, 5=typical(high+low+close)/3, 6=weighted(high+low+close+close)/4

//---- buffers

double ExtMapBuffer1[];
double ExtMapBuffer2[];
double ExtMapBuffer3[];

//---- variables

int    MAMode;
string strMAType;


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
   IndicatorBuffers(3);
   
//---- drawing settings
   SetIndexBuffer(2,ExtMapBuffer1);
   SetIndexBuffer(1,ExtMapBuffer2);
   SetIndexBuffer(0,ExtMapBuffer3);
   
   SetIndexStyle(2,DRAW_LINE,STYLE_SOLID,2);
   SetIndexStyle(1,DRAW_LINE,STYLE_SOLID,2);
   SetIndexStyle(0,DRAW_LINE,STYLE_SOLID,2);

switch (MAType)
   {
      case 1: strMAType="EMA"; MAMode=MODE_EMA; break;
      case 2: strMAType="SMMA"; MAMode=MODE_SMMA; break;
      case 3: strMAType="MOVE"; MAMode=MODE_LWMA; break;
      case 4: strMAType="LSMA"; break;
      default: strMAType="SMA"; MAMode=MODE_SMA; break;
   }
   IndicatorShortName(  " Warrior Line ");
//---- initialization done
   return(0);
  }

//+------------------------------------------------------------------+
//| LSMA with PriceMode                                              |
//| PrMode  0=close, 1=open, 2=high, 3=low, 4=median(high+low)/2,    |
//| 5=typical(high+low+close)/3, 6=weighted(high+low+close+close)/4  |
//+------------------------------------------------------------------+

double LSMA(int TimeFrame, int Rperiod, int prMode, int shift)
{
   int i, myShift;
   double sum, pr;
   int length;
   double lengthvar;
   double tmp;
   double wt;

   length = Rperiod;
 
   sum = 0;
   for(i = length; i >= 1  ; i--)
   {
     lengthvar = length + 1;
     lengthvar /= 3;
     tmp = 0;
     myShift = length - i + shift;
     switch (prMode)
     {
     case 0: pr = iClose(NULL,TimeFrame,myShift);break;
     case 1: pr = iOpen(NULL,TimeFrame,myShift);break;
     case 2: pr = iHigh(NULL,TimeFrame,myShift);break;
     case 3: pr = iLow(NULL,TimeFrame,myShift);break;
     case 4: pr = (iHigh(NULL,TimeFrame,myShift) + iLow(NULL,TimeFrame,myShift))/2;break;
     case 5: pr = (iHigh(NULL,TimeFrame,myShift) + iLow(NULL,TimeFrame,myShift) + iClose(NULL,TimeFrame,myShift))/3;break;
     case 6: pr = (iHigh(NULL,TimeFrame,myShift) + iLow(NULL,TimeFrame,myShift) + iClose(NULL,TimeFrame,myShift) + iClose(NULL,TimeFrame,myShift))/4;break;
     }
     tmp = ( i - lengthvar)*pr;
     sum+=tmp;
    }
    wt = sum*6/(length*(length+1));
    wt = MathFloor(wt/Point)*Point;
    
    return(wt);
}

int start()

  {
  
   double MA_Cur, MA_Prev;
   int limit;
   int counted_bars = IndicatorCounted();
   //---- check for possible errors
   if (counted_bars<0) return(-1);
   //---- last counted bar will be recounted
   if (counted_bars>0) counted_bars--;
   limit = Bars - counted_bars;

   for(int i=limit; i>=0; i--)
   {
      if (MAType == 4)
      {
        MA_Cur = LSMA(0, MAPeriod, MAAppliedPrice,i);
        MA_Prev = LSMA(0, MAPeriod, MAAppliedPrice,i+1);
      }
      else
      {
        MA_Cur = iMA(NULL,0,MAPeriod,0,MAMode, MAAppliedPrice,i);
        MA_Prev = iMA(NULL,0,MAPeriod,0,MAMode, MAAppliedPrice,i+1);
      }
 
         
//========== COLOR CODING ===========================================               
        
       ExtMapBuffer3[i] = MA_Cur; //red 
       ExtMapBuffer2[i] = MA_Cur; //green
       ExtMapBuffer1[i] = MA_Cur; //yellow
       
        if (MA_Prev > MA_Cur)
        {
        ExtMapBuffer2[i] = EMPTY_VALUE;
        
        }
       else if (MA_Prev < MA_Cur) 
        {
        ExtMapBuffer1[i] = EMPTY_VALUE; //-1 red/greem tight
        
        }
         else 
         {
         
         ExtMapBuffer1[i]=EMPTY_VALUE;//EMPTY_VALUE;
         ExtMapBuffer2[i]=EMPTY_VALUE;//EMPTY_VALUE;
         }
        
      }
    
      return(0);
  }
//+------------------------------------------------------------------+