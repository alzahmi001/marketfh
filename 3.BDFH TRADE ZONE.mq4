
// +----------------------------------------------------------------------------------------+ //
// |    .-._______                           FAIQHILYA                        _______.-.    | //
// |---( )_)______)                 Knowledge of the ancients                (______(_( )---| //
// |  (    ()___)                              \¦/                             (___()    )  | //
// |       ()__)                              (o o)                             (__()       | //
// |--(___()_)__________________________oOOo___(_)___oOOo_________________________(_()___)--| //
// |_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____|_____| //
// |                                                                                   2017 | //
// |----------------------------------------------------------------------------------------| //
// |                 File:     BDFH TRADE ZONE                                             | //
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
// 24 dan 48 (harga 2-SMMA) dan di EA dan grafik
#property indicator_chart_window
//------- Parameter indikator eksternal -------------------------------

extern int    TimeFrame    = 1440;              // Periode
extern int    coun_bars    = 86;                 // Jumlah Bar
extern bool   Comm         = false;

extern string AsiaBegin    = "09:00";           // Asia Buka
extern string AsiaEnd      = "10:00";           // Asia Tutup
extern color  AsiaColor    = C'00,00,00';       // Warna Sesi Asia
extern string EurBegin     = "09:00";           // Eropa Buka
extern string EurEnd       = "15:00";           // Eropa Tutup
extern color  EurColor     = C'44,44,44';       // Warna Sesi  Eropa
extern string USABegin     = "09:00";           // America Buka
extern string USAEnd       = "19:00";           // Amerika Tutup
extern color  USAColor     = C'21,21,21';       // Warna Sesi America

double st_b = 0;int brs = 0;double db = 0;int brc = 0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
//---- indicators
  string char1[256]; int i;
  for (i = 0; i < 256; i++) char1[i] = CharToStr(i);
  string txt =  
  char1[121]+char1[117]+char1[114]+char1[105]+char1[121]+char1[116]+char1[111]
  +char1[107]+char1[109]+char1[97]+char1[110]+char1[64]+char1[103]+char1[109]
  +char1[97]+char1[105]+char1[108]+char1[46]+char1[99]+char1[111]+char1[109];
  
  Comment("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n  ");

//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Kustom fungsi deinisialisasi indikator                       |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   string vName;
   for(int i=ObjectsTotal()-1; i>=0;i--)
    {
     vName = ObjectName(i);
     if (StringFind(vName,"candle_") !=-1) ObjectDelete(vName);
    }
   Comment(""); 
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Kustom fungsi inisialisasi indikator                              |
//+------------------------------------------------------------------+
int start()
  {
//----
   int limit;
   int counted_bars=IndicatorCounted();
   
   if(counted_bars<0) return(-1);

   if(counted_bars>0) counted_bars--;
   limit=Bars-counted_bars;
   if(limit>coun_bars)limit=coun_bars;

   for(int i=limit; i>=0; i--)
   {
    db = (iHigh(Symbol(),TimeFrame,i+1)-iLow(Symbol(),TimeFrame,i+1))/Point;
    //----------------D1
    if(Period()<TimeFrame){
    double   high_D1   = iHigh(Symbol(),TimeFrame,i);
    double   low_D1    = iLow(Symbol(),TimeFrame,i);    
    double   open_D1   = iOpen(Symbol(),TimeFrame,i);   
    double   close_D1  = iClose(Symbol(),TimeFrame,i);
    datetime delta_D1  = TimeFrame*60;
    datetime timeOP_D1 = iTime(Symbol(),TimeFrame,i);
    datetime timeCL_D1 = iTime(Symbol(),TimeFrame,i)+delta_D1;
    color    color_D1  = C'197,41,47';
        
    
    if(open_D1<close_D1)color_D1 = Green;
    TrendLineGraf("candle__D1"+DoubleToStr(timeOP_D1, 0),timeCL_D1,open_D1,timeCL_D1,close_D1,color_D1,0,5);
    
    
    
    if(TimeFrame==1440)
    {    
    datetime dt=iTime(Symbol(),TimeFrame,i);
    datetime t1=StrToTime(TimeToStr(dt, TIME_DATE)+" "+AsiaBegin);
    datetime t2=StrToTime(TimeToStr(dt, TIME_DATE)+" "+AsiaEnd);
    RECTANGLE("candle__Asia"+DoubleToStr(timeOP_D1, 0),t1,high_D1,t2,low_D1,AsiaColor);    

    datetime t3=StrToTime(TimeToStr(dt, TIME_DATE)+" "+EurBegin);
    datetime t4=StrToTime(TimeToStr(dt, TIME_DATE)+" "+EurEnd);
    RECTANGLE("candle__Eur"+DoubleToStr(timeOP_D1, 0),t3,high_D1,t4,low_D1,EurColor);    
    
    datetime t5=StrToTime(TimeToStr(dt, TIME_DATE)+" "+USABegin);
    datetime t6=StrToTime(TimeToStr(dt, TIME_DATE)+" "+USAEnd);
    RECTANGLE("candle__USA"+DoubleToStr(timeOP_D1, 0),t5,high_D1,t6,low_D1,USAColor);
    }
            
    }     
   }   
//----
  for(int j=0;j<coun_bars;j++)
   {
    double bs = (iHigh(Symbol(),TimeFrame,j)-iLow(Symbol(),TimeFrame,j))/Point;
    if(st_b<bs){st_b=bs;brs=j;}    
   }
  double bs0 = (iHigh(Symbol(),TimeFrame,0)-iLow(Symbol(),TimeFrame,0))/Point;
//----  
  for(int jj=1;jj<coun_bars;jj++)
   {
    double bd = (iHigh(Symbol(),TimeFrame,jj)-iLow(Symbol(),TimeFrame,jj))/Point;
    if(bd<db){db=bd;brc=jj;}    
   }
//----       
  //Komentar("\nbar= ",brs,"   Макs.bar=",st_b,"  Tekusch.bar=",bs0,"  Min.bar=",db,"  brc=",brc);
  if(Comm)Comment("On ",coun_bars," bar, Maks.bar№",brs,"=",st_b,"n."," Min.bar№",brc,"=",db,"n."," saat.=",bs0);      
//----
   return(0);
  }
//+----------------------------------------------------------------------+
// + ----------------------------------------------- ------------------- +
// | Fungsi: layar persegi panjang |
// | Author: Faiq Alzahmi          |
// | E-mail: faiqalzahmi@ymail.com |
// | ICQ   : Magic System          |
// | Skyp  : One Shot              |
// + ----------------------------------------------- ------------------- +
void TrendLineGraf(string labebe,datetime time1,double price1,datetime time2,double price2,
                    color colir,int STYLE,int WIDTH )
  {
   if (ObjectFind(labebe)!=-1) ObjectDelete(labebe);
   ObjectCreate(labebe, OBJ_TREND, 0,time1,price1,time2,price2);
   ObjectSet(labebe, OBJPROP_COLOR, colir);
   ObjectSet(labebe, OBJPROP_STYLE,STYLE);
   ObjectSet(labebe, OBJPROP_WIDTH,WIDTH);
   ObjectSet(labebe, OBJPROP_RAY,0);
   ObjectSet(labebe, OBJPROP_BACK, true);
  }
// + ----------------------------------------------- ------------------- +
// | Fungsi: layar persegi panjang |
// | Author: Faiq Alzahmi          |
// | E-mail: faiqalzahmi@ymail.com |
// | ICQ   : Magic System          |
// | Skyp  : One Shot              |
// + ----------------------------------------------- ------------------- +
void RICE_ARROW(string label,datetime time1,double price1,color colir,int WIDTH )
  {
   if (ObjectFind(label)!=-1) ObjectDelete(label);
   ObjectCreate(label,OBJ_ARROW, 0,time1,price1);
   ObjectSet(label,OBJPROP_ARROWCODE,SYMBOL_RIGHTPRICE);
   ObjectSet(label, OBJPROP_COLOR, colir);
   ObjectSet(label, OBJPROP_WIDTH,WIDTH);
   ObjectSet(label, OBJPROP_BACK, true);
  }
// + ----------------------------------------------- ------------------- +
// + ----------------------------------------------- ------------------- +
// | Fungsi: layar persegi panjang |
// | Author: Faiq Alzahmi          |
// | E-mail: faiqalzahmi@ymail.com |
// | ICQ   : Magic System          |
// | Skyp  : One Shot              |
// + ----------------------------------------------- ------------------- +
void RECTANGLE(string labe,datetime time1,double price1,datetime time2,
                double price2,color colir)
  {
   if (ObjectFind(labe)!=-1) ObjectDelete(labe);
   ObjectCreate(labe, OBJ_RECTANGLE, 0,time1,price1,time2,price2);
   ObjectSet(labe, OBJPROP_COLOR, colir);
   ObjectSet(labe, OBJPROP_BACK, true);
  } 
//+------------------------------------------------------------------+