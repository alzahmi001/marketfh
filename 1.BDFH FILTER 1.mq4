
// +----------------------------------------------------------------------------------------+ //
// |    .-._______                           FAIQHILYA                        _______.-.    | //
// |---( )_)______)                 Knowledge of the ancients                (______(_( )---| //
// |  (    ()___)                              \¦/                             (___()    )  | //
// |       ()__)                              (o o)                             (__()       | //
// |--(___()_)__________________________oOOo___(_)___oOOo_________________________(_()___)--| //
// |_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____|_____| //
// |                                                                                   2017 | //
// |----------------------------------------------------------------------------------------| //
// |                 File:     BDFH FILTER 1                                              | //
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
----------------------------------------------------------------------------------------------
Suggested Colors             White Chart        Black Chart        Remarks  
 
indicator_color1-2           C'221,238,255'     C'030,032,072'     H/L Histo Fill
indicator_color3-4           C'210,233,255'     C'034,037,083'     H/L MA Fill
indicator_color5             C'240,249,255'     C'020,020,020'     Center Area 
indicator_color6             C'032,143,255'     C'079,102,198'     Center Line
indicator_color7             Black              MediumVioletRed    Trend Line                                                                                                      
---------------------------------------------------------------------------------------------*/


//+-------------------------------------------------------------------------------------------+
//| Indicator Global Inputs                                                                   |                                                        
//+-------------------------------------------------------------------------------------------+ 
#property indicator_chart_window
#property indicator_buffers  7

//Dragon-
#property indicator_color1   C'030,032,072'   //high histo fill
#property indicator_color2   C'030,032,072'   //low histo fill
#property indicator_color3   C'034,037,083'   //high ma fill    
#property indicator_color4   C'034,037,083'   //low ma fill
#property indicator_color5   C'020,020,020'   //center area
#property indicator_color6   C'079,102,198'   //center line

#property indicator_style1   STYLE_SOLID
#property indicator_style2   STYLE_SOLID
#property indicator_style3   STYLE_SOLID
#property indicator_style4   STYLE_SOLID 
#property indicator_style5   STYLE_SOLID 
#property indicator_style6   STYLE_SOLID 

#property indicator_width1   3
#property indicator_width2   3
#property indicator_width3   3
#property indicator_width4   3  
#property indicator_width5   5
#property indicator_width6   1

//Trend-
#property indicator_color7   MediumVioletRed           
#property indicator_width7   1
#property indicator_style7   STYLE_SOLID       
 
//global external inputs
extern bool   Indicator_On                    = true;
extern bool   Show_Trend                      = true;
extern int    Display_Max_TF                  = 43200;
extern string TF_Choices                      = "1-5-15-30-60-240-1440-10080-43200";

//Global Buffers and Variables
bool          Deinitialized;
int           Chart_Scale,i,BarShift,counted_bars,limit;
string        ShortName; 

//Dragon-
int           Bar_Width,Bands;
double        DragonHigh[],DragonLow[],DragonTop[],
              DragonBot[],DragonCntrArea[],DragonCntrLine[];
string        Dragontype                      = "ema";
int           Dragon_Period                   = 34;
int           Dragon_Type                     = 1;

//Trend-
double        Trend[];
string        Trendtype                       = "ema";
int           Trend_Period                    = 89;   
int           Trend_Type                      = 1;

/*General notes:
MAType  = 0=SMA,1=EMA,2=SMMA,3=LWMA
MAPrice = 0=CLOSE,1=OPEN,2=HIGH,3=LOW,4=MEDIAN,5=PP,6=WEIGHT
*/
//+-------------------------------------------------------------------------------------------+
//| Indicator Initialization                                                                  |                                                        
//+-------------------------------------------------------------------------------------------+      
int init()
  {
  Deinitialized = false;
  
  //Determine the current chart scale (chart scale number should be 0-5)
  Chart_Scale = ChartScaleGet();

  //Set Dragon band and bar widths per chart zoom selection                                   
        if(Chart_Scale == 0) {Bar_Width = 1; Bands = 1;}           
  else {if(Chart_Scale == 1) {Bar_Width = 2; Bands = 1;}      
  else {if(Chart_Scale == 2) {Bar_Width = 3; Bands = 3;}
  else {if(Chart_Scale == 3) {Bar_Width = 5; Bands = 7;}
  else {if(Chart_Scale == 4) {Bar_Width = 9; Bands = 14;}
  else {if(Chart_Scale == 5) {Bar_Width = 17; Bands = 26;} }}}}}   
       
  //Indicators- Dragon           
  //Area fill either side of center              
  SetIndexBuffer(0, DragonHigh);
  SetIndexStyle(0, DRAW_HISTOGRAM, 0, Bar_Width);
  SetIndexEmptyValue(0,0);
  SetIndexBuffer(1, DragonLow);
  SetIndexStyle(1, DRAW_HISTOGRAM, 0, Bar_Width);
  SetIndexEmptyValue(1,0);    
  //Area fill top and bottom
  SetIndexBuffer(2, DragonTop);
  SetIndexStyle(2, DRAW_LINE, 0, Bands);
  SetIndexEmptyValue(2,0); 
  SetIndexBuffer(3, DragonBot);
  SetIndexStyle(3, DRAW_LINE, 0, Bands);
  SetIndexEmptyValue(3,0);    
  //Center line Area    
  SetIndexBuffer(4, DragonCntrArea); 
  SetIndexStyle(4, DRAW_LINE);
  SetIndexEmptyValue(4,0); 
  //Center line    
  SetIndexBuffer(5, DragonCntrLine); 
  SetIndexStyle(5, DRAW_LINE);
  SetIndexEmptyValue(5,0);
         
  //Indicators- Trend
  if(Show_Trend) {
  SetIndexBuffer(6, Trend);                     
  SetIndexStyle(6, DRAW_LINE);
  SetIndexEmptyValue(6,0); }
                     
  //Indicator ShortName
  IndicatorShortName ("SonicR Filled Dragon-Trend ");
                                                                                             
  return(0);
  }

//+-------------------------------------------------------------------------------------------+
//| Indicator De-initialization                                                               |                                                        
//+-------------------------------------------------------------------------------------------+      
int deinit()
  {
  //Comment("");              
  return(0);
  }

//+-------------------------------------------------------------------------------------------+
//| Indicator Start                                                                           |                                                        
//+-------------------------------------------------------------------------------------------+     
int start()
  {
  //If indicator is "Off" or chart TF is out of range deinitialize only once, not every tick.  
  if((!Indicator_On) || (Period() > Display_Max_TF))    
    {
    if (!Deinitialized) {deinit(); Deinitialized = true;}
    return(0);
    }

  //Confirm range of chart bars for calculations   
  //check for possible errors
  counted_bars = IndicatorCounted();
  if(counted_bars < 0)  return(-1);     
  //last counted bar will be recounted
  if(counted_bars > 0) counted_bars--;    
  limit = Bars - counted_bars;
  
  //Begin the loop of calculations for the range of chart bars. 
  for(i = limit - 1; i >= 0; i--)   
    {
    //Dragon        
    BarShift = iBarShift(NULL,NULL,Time[i],true); 
    DragonHigh[i] = iMA(NULL,NULL,Dragon_Period,0,Dragon_Type,PRICE_HIGH,BarShift);   
    DragonLow[i]  = iMA(NULL,NULL,Dragon_Period,0,Dragon_Type,PRICE_LOW,BarShift);                    
    DragonTop[i]  = iMA(NULL,NULL,Dragon_Period,0,Dragon_Type,PRICE_HIGH,BarShift);                           
    DragonBot[i]  = iMA(NULL,NULL,Dragon_Period,0,Dragon_Type,PRICE_LOW,BarShift);     
    DragonCntrArea[i] = iMA(NULL,NULL,Dragon_Period,0,Dragon_Type,PRICE_CLOSE,BarShift);
    DragonCntrLine[i] = iMA(NULL,NULL,Dragon_Period,0,Dragon_Type,PRICE_CLOSE,BarShift);         
    //Trend
    if(Show_Trend) {                        
    BarShift = iBarShift(NULL,NULL,Time[i],true);                 
    Trend[i]= iMA(NULL,NULL,Trend_Period,0,Trend_Type,PRICE_CLOSE,BarShift); }                                   
    }
                                                                                                          
  return(0);
  }

//+-------------------------------------------------------------------------------------------+
//| Subroutine:  Set up to get the chart scale number                                         |
//+-------------------------------------------------------------------------------------------+
void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)                                                    
  {
  Chart_Scale = ChartScaleGet();
  init();  
  }

//+-------------------------------------------------------------------------------------------+
//| Subroutine:  Get the chart scale number                                                   |
//+-------------------------------------------------------------------------------------------+
int ChartScaleGet()
  {
  long result = -1;
  ChartGetInteger(0,CHART_SCALE,0,result);
  return((int)result);
  }
    
//+-------------------------------------------------------------------------------------------+
//| Indicator End                                                                             |                                                        
//+-------------------------------------------------------------------------------------------+ 