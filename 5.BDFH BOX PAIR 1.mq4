
// +----------------------------------------------------------------------------------------+ //
// |    .-._______                           FAIQHILYA                        _______.-.    | //
// |---( )_)______)                 Knowledge of the ancients                (______(_( )---| //
// |  (    ()___)                              \¦/                             (___()    )  | //
// |       ()__)                              (o o)                             (__()       | //
// |--(___()_)__________________________oOOo___(_)___oOOo_________________________(_()___)--| //
// |_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____|_____| //
// |                                                                                   2017 | //
// |----------------------------------------------------------------------------------------| //
// |                 File:     BDFH BOX PAIR 1                                              | //
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
#property copyright " ©2017 NOPEMBER"
#property link      ""
#property indicator_chart_window

int      NormalSpread;
color    warna;
string   text,simbol;
double   PrevBid, PrevAsk;
extern string Pair0    = "GBPUSD"; // Pair0 = GBPUSD
extern string Pair1    = "EURUSD"; // Pair1 = EURUSD
extern string Pair2    = "USDJPY"; // Pair2 = USDJPY
extern string Pair3    = "USDCHF"; // Pair3 = USDCHF

int Cth1u    = C'0,150,11';  // Warna Trend H1  Up
int Cth1d    = C'211,11,0';  // Warna Trend H1  Dn
int Ctm30u   = C'0,200,0' ;  // Warna Trend M30 Up
int Ctm30d   = C'200,11,0';  // Warna Trend M30 Dn
int Ctm15u   = C'0,255,0' ;  // Warna Trend M15 Up
int Ctm15d   = C'255,11,0';  // Warna Trend M15 Dn
int Cth4u    = C'0,210,0' ;
int Cth4d    = C'210,0,0' ;
int Ctdu     = C'0,230,0' ;
int Ctdd     = C'230,0,0' ;

int init()
{
   IndicatorShortName("TrixEMAboard");
   NormalSpread = (Ask-Bid)/Point;
   return(0);
}

int deinit()
{
   ObjectsDeleteAll();
   return(0);
}

int start()
{
    int  i;
    
        // ==================================================================================== //
        //                           F I R S T     C O L O U M B                                //
        // ==================================================================================== //

        // Left Title
        // ==========
         
        ObjectCreate("SymbolTxt", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("SymbolTxt","ONE SHOOT ONE KILL",12, "Arial Bold", C'95,103,211');
        
        ObjectSet("SymbolTxt", OBJPROP_XDISTANCE, 297);
        ObjectSet("SymbolTxt", OBJPROP_YDISTANCE, 0);
		  ObjectSet("SymbolTxt", OBJPROP_ANGLE, 0);

        ObjectCreate("kotak",  OBJ_LABEL,0, 0, 0);
        ObjectSetText("kotak","-----",500, "Arial Bold", C'48,48,48');
        ObjectSet("kotak", OBJPROP_XDISTANCE, 421);
        ObjectSet("kotak", OBJPROP_YDISTANCE, 195);
		  ObjectSet("kotak", OBJPROP_ANGLE, 90);
		  
		  ObjectCreate("kotak1",  OBJ_LABEL,0, 0, 0);
        ObjectSetText("kotak1","-----",500, "Arial Bold", C'28,28,28');
        ObjectSet("kotak1", OBJPROP_XDISTANCE, 511);
        ObjectSet("kotak1", OBJPROP_YDISTANCE, 195);
		  ObjectSet("kotak1", OBJPROP_ANGLE, 90);
		  
		  ObjectCreate("kotak2",  OBJ_LABEL,0, 0, 0);
        ObjectSetText("kotak2","-",500, "Arial Bold", C'16,16,16');
        ObjectSet("kotak2", OBJPROP_XDISTANCE, 421);
        ObjectSet("kotak2", OBJPROP_YDISTANCE, 500);
		  ObjectSet("kotak2", OBJPROP_ANGLE, 90);
		  
		  
		  ObjectCreate("kotak3",  OBJ_LABEL,0, 0, 0);
        ObjectSetText("kotak3","-",500, "Arial Bold", C'11,11,11');
        ObjectSet("kotak3", OBJPROP_XDISTANCE, 511);
        ObjectSet("kotak3", OBJPROP_YDISTANCE, 500);
		  ObjectSet("kotak3", OBJPROP_ANGLE, 90);
		  
		  ObjectCreate("kotak4",  OBJ_LABEL,0, 0, 0);
        ObjectSetText("kotak4","ggg",55, "webdings", C'25,25,25');
        ObjectSet("kotak4", OBJPROP_XDISTANCE, 795);
        ObjectSet("kotak4", OBJPROP_YDISTANCE, 210);
		 
		  
		  
		  ObjectCreate("line1", OBJ_LABEL, 0, 0, 0);
		  ObjectSetText("line1","__________",12, "Arial Bold", C'16,12,8');
        
        ObjectSet("line1", OBJPROP_XDISTANCE, 778);
        ObjectSet("line1", OBJPROP_YDISTANCE, 190);
		  ObjectSet("line1", OBJPROP_ANGLE, 90);
		  
		  ObjectCreate("line2", OBJ_LABEL,0, 0, 0);
        ObjectSetText("line2","__________________",12, "Arial Bold", C'7,7,7');
        
        ObjectSet("line2", OBJPROP_XDISTANCE, 822);
        ObjectSet("line2", OBJPROP_YDISTANCE, 160);
		  ObjectSet("line2", OBJPROP_ANGLE, 90);
		  
		  ObjectCreate("line3", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("line3","__________________",12, "Arial Bold", C'8,8,8');
        
        ObjectSet("line3", OBJPROP_XDISTANCE, 867);
        ObjectSet("line3", OBJPROP_YDISTANCE, 160);
		  ObjectSet("line3", OBJPROP_ANGLE, 90);
		  
		  ObjectCreate("line4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("line4","__________________",12, "Arial Bold", C'78,78,88');
        
        ObjectSet("line4", OBJPROP_XDISTANCE, 912);
        ObjectSet("line4", OBJPROP_YDISTANCE, 160);
		  ObjectSet("line4", OBJPROP_ANGLE, 90);
		  
		  // Text T,M,G GBPUSD
        // ==============
		  ObjectCreate("TextTGU", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("TextTGU","TREND",8, "Arial Bold", Silver);
        
        ObjectSet("TextTGU", OBJPROP_XDISTANCE, 801);
        ObjectSet("TextTGU", OBJPROP_YDISTANCE, 0);
        
        ObjectCreate("TextMGU", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("TextMGU","MARKET",7, "Arial Bold", Silver);
        
        ObjectSet("TextMGU", OBJPROP_XDISTANCE, 800);
        ObjectSet("TextMGU", OBJPROP_YDISTANCE, 52);
        ObjectSet("TextMGU", OBJPROP_ANGLE, 0);
        
        ObjectCreate("TextGGU", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("TextGGU","GLOBAL",7, "Arial Bold", Silver);
        ObjectSet("TextGGU", OBJPROP_CORNER, 0);
        ObjectSet("TextGGU", OBJPROP_XDISTANCE, 800);
        ObjectSet("TextGGU", OBJPROP_YDISTANCE, 102);
        
        // Text T,M,G EURUSD
        // ==============
		  ObjectCreate("TextTEU", OBJ_LABEL,0, 0, 0);
        ObjectSetText("TextTEU","TREND",8, "Arial Bold", LightBlue);
        ObjectSet("TextTEU", OBJPROP_CORNER, 0);
        ObjectSet("TextTEU", OBJPROP_XDISTANCE, 845);
        ObjectSet("TextTEU", OBJPROP_YDISTANCE, 0);
        
        ObjectCreate("TextMEU", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("TextMEU","MARKET",7, "Arial Bold", LightBlue);
        ObjectSet("TextMEU", OBJPROP_CORNER, 0);
        ObjectSet("TextMEU", OBJPROP_XDISTANCE, 844);
        ObjectSet("TextMEU", OBJPROP_YDISTANCE, 52);
        ObjectSet("TextMEU", OBJPROP_ANGLE, 0);
        
        ObjectCreate("TextGEU", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("TextGEU","GLOBAL",7, "Arial Bold", LightBlue);
        ObjectSet("TextGEU", OBJPROP_CORNER, 0);
        ObjectSet("TextGEU", OBJPROP_XDISTANCE, 844);
        ObjectSet("TextGEU", OBJPROP_YDISTANCE, 102);
        
        // Text T,M,G USDJPY
        // ==============
		  ObjectCreate("TextTUJ", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("TextTUJ","TREND",8, "Arial Bold", LightBlue);
        ObjectSet("TextTUJ", OBJPROP_CORNER, 0);
        ObjectSet("TextTUJ", OBJPROP_XDISTANCE, 889);
        ObjectSet("TextTUJ", OBJPROP_YDISTANCE, 0);
        
        ObjectCreate("TextMUJ", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("TextMUJ","MARKET",7, "Arial Bold", LightBlue);
        ObjectSet("TextMUJ", OBJPROP_CORNER, 0);
        ObjectSet("TextMUJ", OBJPROP_XDISTANCE, 888);
        ObjectSet("TextMUJ", OBJPROP_YDISTANCE, 52);
        ObjectSet("TextMUJ", OBJPROP_ANGLE, 0);
        
        ObjectCreate("TextGUJ", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("TextGUJ","GLOBAL",7, "Arial Bold", LightBlue);
        ObjectSet("TextGUJ", OBJPROP_CORNER, 0);
        ObjectSet("TextGUJ", OBJPROP_XDISTANCE, 888);
        ObjectSet("TextGUJ", OBJPROP_YDISTANCE, 102);
        
        // Text T,M,G USDCHF
        // ==============
		  ObjectCreate("TextTUC", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("TextTUC","TREND",8, "Arial Bold", LightBlue);
        ObjectSet("TextTUC", OBJPROP_CORNER, 0);
        ObjectSet("TextTUC", OBJPROP_XDISTANCE, 933);
        ObjectSet("TextTUC", OBJPROP_YDISTANCE, 0);
        
        ObjectCreate("TextMUC", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("TextMUC","MARKET",7, "Arial Bold", LightBlue);
        ObjectSet("TextMUC", OBJPROP_CORNER, 0);
        ObjectSet("TextMUC", OBJPROP_XDISTANCE, 932);
        ObjectSet("TextMUC", OBJPROP_YDISTANCE, 52);
        ObjectSet("TextMUC", OBJPROP_ANGLE, 0);
        
        ObjectCreate("TextGUC", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("TextGUC","GLOBAL",7, "Arial Bold", LightBlue);
        ObjectSet("TextGUC", OBJPROP_CORNER, 0);
        ObjectSet("TextGUC", OBJPROP_XDISTANCE, 932);
        ObjectSet("TextGUC", OBJPROP_YDISTANCE, 102);
     

        // ==================================================================================== //
        //                           S E C O N D   C O L O U M B                                //
        // ==================================================================================== //
        
        

         ////////////// TREND 3 VS 20 SMA GBPUSD  //////////////
                              
        
//H1 TREND GU
        double faiq, hilya;

        faiq     = iMA(Pair0,PERIOD_H1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_H1,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("T0H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T0H1", simbol,28, "Wingdings 2", warna);
        
        ObjectSet    ("T0H1", OBJPROP_XDISTANCE, 801);
        ObjectSet    ("T0H1", OBJPROP_YDISTANCE, 10);
//M30 TREND GU        
        faiq     = iMA(Pair0,PERIOD_M30,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_M30,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("T0M30", OBJ_LABEL,0, 0, 0);
        ObjectSetText("T0M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("T0M30", OBJPROP_XDISTANCE, 807);
        ObjectSet    ("T0M30", OBJPROP_YDISTANCE, 17);
//M15 TREND GU       
        faiq     = iMA(Pair0,PERIOD_M15,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_M15,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = White; simbol = "\xE9"; }
        else               { warna = Red;  simbol = "\xE9"; }
        ObjectCreate ("T0M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T0M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("T0M15", OBJPROP_XDISTANCE, 811);
        ObjectSet    ("T0M15", OBJPROP_YDISTANCE, 19);
//H4 TREND GU         
        faiq     = iMA(Pair0,PERIOD_H4,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_H4,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("T0H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T0H4", simbol,1, "Webdings", warna);
        ObjectSet    ("T0H4", OBJPROP_XDISTANCE, 800);
        ObjectSet    ("T0H4", OBJPROP_YDISTANCE, 43);
//D TREND GU        
        faiq     = iMA(Pair0,PERIOD_D1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_D1,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("T0D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T0D", simbol,1, "Webdings", warna);
        ObjectSet    ("T0D", OBJPROP_XDISTANCE, 820);
        ObjectSet    ("T0D", OBJPROP_YDISTANCE, 43);

             ////////////// MARKET 20 VS 100 SMA GBPUSD  //////////////
        
//H1 MARKET GU
        faiq     = iMA(Pair0,PERIOD_H1,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_H1,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("M0H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M0H1", simbol,28, "Wingdings 2", warna);
        ObjectSet    ("M0H1", OBJPROP_XDISTANCE, 801);
        ObjectSet    ("M0H1", OBJPROP_YDISTANCE, 60);
//M30 MARKET GU        
        faiq     = iMA(Pair0,PERIOD_M30,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_M30,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("M0M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M0M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("M0M30", OBJPROP_XDISTANCE, 807);
        ObjectSet    ("M0M30", OBJPROP_YDISTANCE, 67);
//M15 MARKET GU       
        faiq     = iMA(Pair0,PERIOD_M15,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_M15,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = White; simbol = "\xE9"; }
        else               { warna = Red;  simbol = "\xE9"; }
        ObjectCreate ("M0M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M0M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("M0M15", OBJPROP_XDISTANCE, 811);
        ObjectSet    ("M0M15", OBJPROP_YDISTANCE, 69);
//H4 MARKET GU         
        faiq     = iMA(Pair0,PERIOD_H4,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_H4,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("M0H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M0H4", simbol,1, "Webdings", warna);
        ObjectSet    ("M0H4", OBJPROP_XDISTANCE, 800);
        ObjectSet    ("M0H4", OBJPROP_YDISTANCE, 93);
//D MARKET GU        
        faiq     = iMA(Pair0,PERIOD_D1,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_D1,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("M0D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M0D", simbol,1, "Webdings", warna);
        ObjectSet    ("M0D", OBJPROP_XDISTANCE, 820);
        ObjectSet    ("M0D", OBJPROP_YDISTANCE, 93);
        
             ////////////// GLOBAL 100 VS 200 SMA GBPUSD  //////////////
        
//H1 GLOBAL GU
        faiq     = iMA(Pair0,PERIOD_H1,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_H1,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("G0H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G0H1", simbol,28, "Wingdings 2", warna);
        ObjectSet    ("G0H1", OBJPROP_XDISTANCE, 801);
        ObjectSet    ("G0H1", OBJPROP_YDISTANCE, 110);
//M30 GLOBAL GU        
        faiq     = iMA(Pair0,PERIOD_M30,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_M30,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("G0M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G0M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("G0M30", OBJPROP_XDISTANCE, 807);
        ObjectSet    ("G0M30", OBJPROP_YDISTANCE, 117);
//M15 GLOBAL GU       
        faiq     = iMA(Pair0,PERIOD_M15,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_M15,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = White; simbol = "\xE9"; }
        else               { warna = Red;  simbol = "\xE9"; }
        ObjectCreate ("G0M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G0M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("G0M15", OBJPROP_XDISTANCE, 811);
        ObjectSet    ("G0M15", OBJPROP_YDISTANCE, 119);
//H4 GLOBAL GU         
        faiq     = iMA(Pair0,PERIOD_H4,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_H4,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("G0H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G0H4", simbol,1, "Webdings", warna);
        ObjectSet    ("G0H4", OBJPROP_XDISTANCE, 800);
        ObjectSet    ("G0H4", OBJPROP_YDISTANCE, 143);
//D GLOBAL GU        
        faiq     = iMA(Pair0,PERIOD_D1,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_D1,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("GD", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("GD", simbol,1, "Webdings", warna);
        ObjectSet    ("GD", OBJPROP_XDISTANCE, 820);
        ObjectSet    ("GD", OBJPROP_YDISTANCE, 143);
        
//EXIT 15 GU        
        faiq     = iMA(Pair0,PERIOD_M15,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_M15,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E0M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E0M15", simbol,1, "Webdings", warna);
        ObjectSet    ("E0M15", OBJPROP_XDISTANCE, 800);
        ObjectSet    ("E0M15", OBJPROP_YDISTANCE, 151);  
        
//EXIT 30 GU        
        faiq     = iMA(Pair0,PERIOD_M30,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_M30,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E0M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E0M30", simbol,1, "Webdings", warna);
        ObjectSet    ("E0M30", OBJPROP_XDISTANCE, 808);
        ObjectSet    ("E0M30", OBJPROP_YDISTANCE, 151); 
        
//EXIT 60 GU        
        faiq     = iMA(Pair0,PERIOD_H1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_H1,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E0H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E0H1", simbol,1, "Webdings", warna);
        ObjectSet    ("E0H1", OBJPROP_XDISTANCE, 816);
        ObjectSet    ("E0H1", OBJPROP_YDISTANCE, 151);                        
             
//EXIT 240 GU        
        faiq     = iMA(Pair0,PERIOD_H4,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_H4,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E0H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E0H4", simbol,1, "Webdings", warna);
        ObjectSet    ("E0H4", OBJPROP_XDISTANCE, 824);
        ObjectSet    ("E0H4", OBJPROP_YDISTANCE, 151);  
        
//EXIT D GU        
        faiq     = iMA(Pair0,PERIOD_D1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair0,PERIOD_D1,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E0D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E0D", simbol,1, "Webdings", warna);
        ObjectSet    ("E0D", OBJPROP_XDISTANCE, 832);
        ObjectSet    ("E0D", OBJPROP_YDISTANCE, 151);  
        
        
        ////////////// TREND 3 VS 20 SMA EURUSD //////////////
                              
        
//H1 TREND EU
        

        faiq     = iMA(Pair1,PERIOD_H1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_H1,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("T1H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T1H1", simbol,28, "Wingdings 2", warna);
        ObjectSet    ("T1H1", OBJPROP_XDISTANCE, 845);
        ObjectSet    ("T1H1", OBJPROP_YDISTANCE, 10);
//M30 TREND EU        
        faiq     = iMA(Pair1,PERIOD_M30,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_M30,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("T1M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T1M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("T1M30", OBJPROP_XDISTANCE, 851);
        ObjectSet    ("T1M30", OBJPROP_YDISTANCE, 17);
//M15 TREND EU       
        faiq     = iMA(Pair1,PERIOD_M15,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_M15,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = White; simbol = "\xE9"; }
        else               { warna = Red;  simbol = "\xE9"; }
        ObjectCreate ("T1M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T1M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("T1M15", OBJPROP_XDISTANCE, 855);
        ObjectSet    ("T1M15", OBJPROP_YDISTANCE, 19);
//H4 TREND EU         
        faiq     = iMA(Pair1,PERIOD_H4,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_H4,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("T1H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T1H4", simbol,1, "Webdings", warna);
        ObjectSet    ("T1H4", OBJPROP_XDISTANCE, 845);
        ObjectSet    ("T1H4", OBJPROP_YDISTANCE, 43);
//D TREND EU        
        faiq     = iMA(Pair1,PERIOD_D1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_D1,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("T1D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T1D", simbol,1, "Webdings", warna);
        ObjectSet    ("T1D", OBJPROP_XDISTANCE, 865);
        ObjectSet    ("T1D", OBJPROP_YDISTANCE, 43);   
        
        ////////////// MARKET 20 VS 100 SMA EURUSD  //////////////
        
//H1 MARKET EU
        faiq     = iMA(Pair1,PERIOD_H1,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_H1,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("M1H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M1H1", simbol,28, "Wingdings 2", warna);
        ObjectSet    ("M1H1", OBJPROP_XDISTANCE, 845);
        ObjectSet    ("M1H1", OBJPROP_YDISTANCE, 60);
//M30 MARKET EU        
        faiq     = iMA(Pair1,PERIOD_M30,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_M30,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("M1M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M1M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("M1M30", OBJPROP_XDISTANCE, 851);
        ObjectSet    ("M1M30", OBJPROP_YDISTANCE, 67);
//M15 MARKET EU       
        faiq     = iMA(Pair1,PERIOD_M15,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_M15,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = White; simbol = "\xE9"; }
        else               { warna = Red;  simbol = "\xE9"; }
        ObjectCreate ("M1M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M1M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("M1M15", OBJPROP_XDISTANCE, 855);
        ObjectSet    ("M1M15", OBJPROP_YDISTANCE, 69);
//H4 MARKET EU         
        faiq     = iMA(Pair1,PERIOD_H4,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_H4,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("M1H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M1H4", simbol,1, "Webdings", warna);
        ObjectSet    ("M1H4", OBJPROP_XDISTANCE, 845);
        ObjectSet    ("M1H4", OBJPROP_YDISTANCE, 93);
//D MARKET EU        
        faiq     = iMA(Pair1,PERIOD_D1,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_D1,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("M1D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M1D", simbol,1, "Webdings", warna);
        ObjectSet    ("M1D", OBJPROP_XDISTANCE, 865);
        ObjectSet    ("M1D", OBJPROP_YDISTANCE, 93);  
        
         ////////////// GLOBAL 100 VS 200 SMA EURUSD  //////////////
        
//H1 GLOBAL EU
        faiq     = iMA(Pair1,PERIOD_H1,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_H1,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("G1H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G1H1", simbol,28, "Wingdings 2", warna);
        ObjectSet    ("G1H1", OBJPROP_XDISTANCE, 845);
        ObjectSet    ("G1H1", OBJPROP_YDISTANCE, 110);
//M30 GLOBAL EU        
        faiq     = iMA(Pair1,PERIOD_M30,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_M30,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("G1M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G1M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("G1M30", OBJPROP_XDISTANCE, 851);
        ObjectSet    ("G1M30", OBJPROP_YDISTANCE, 117);
//M15 GLOBAL EU       
        faiq     = iMA(Pair1,PERIOD_M15,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_M15,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = White; simbol = "\xE9"; }
        else               { warna = Red;  simbol = "\xE9"; }
        ObjectCreate ("G1M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G1M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("G1M15", OBJPROP_XDISTANCE, 855);
        ObjectSet    ("G1M15", OBJPROP_YDISTANCE, 119);
//H4 GLOBAL EU         
        faiq     = iMA(Pair1,PERIOD_H4,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_H4,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("G1H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G1H4", simbol,1, "Webdings", warna);
        ObjectSet    ("G1H4", OBJPROP_XDISTANCE, 845);
        ObjectSet    ("G1H4", OBJPROP_YDISTANCE, 143);
//D GLOBAL EU        
        faiq     = iMA(Pair1,PERIOD_D1,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_D1,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("G1D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G1D", simbol,1, "Webdings", warna);
        ObjectSet    ("G1D", OBJPROP_XDISTANCE, 865);
        ObjectSet    ("G1D", OBJPROP_YDISTANCE, 143);  
        
//EXIT 15 EU        
        faiq     = iMA(Pair1,PERIOD_M15,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_M15,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E1M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E1M15", simbol,1, "Webdings", warna);
        ObjectSet    ("E1M15", OBJPROP_XDISTANCE, 845);
        ObjectSet    ("E1M15", OBJPROP_YDISTANCE, 151);  
        
//EXIT 30 EU        
        faiq     = iMA(Pair1,PERIOD_M30,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_M30,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E1M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E1M30", simbol,1, "Webdings", warna);
        ObjectSet    ("E1M30", OBJPROP_XDISTANCE, 853);
        ObjectSet    ("E1M30", OBJPROP_YDISTANCE, 151); 
        
//EXIT 60 EU        
        faiq     = iMA(Pair1,PERIOD_H1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_H1,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E1H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E1H1", simbol,1, "Webdings", warna);
        ObjectSet    ("E1H1", OBJPROP_XDISTANCE, 861);
        ObjectSet    ("E1H1", OBJPROP_YDISTANCE, 151);                        
             
//EXIT 240 EU        
        faiq     = iMA(Pair1,PERIOD_H4,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_H4,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E1H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E1H4", simbol,1, "Webdings", warna);
        ObjectSet    ("E1H4", OBJPROP_XDISTANCE, 869);
        ObjectSet    ("E1H4", OBJPROP_YDISTANCE, 151);  
        
//EXIT D EU        
        faiq     = iMA(Pair1,PERIOD_D1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair1,PERIOD_D1,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E1D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E1D", simbol,1, "Webdings", warna);
        ObjectSet    ("E1D", OBJPROP_XDISTANCE, 877);
        ObjectSet    ("E1D", OBJPROP_YDISTANCE, 151);   
        
        ////////////// TREND 3 VS 20 SMA USDJPY //////////////
                              
        
//H1 TREND UJ
        

        faiq     = iMA(Pair2,PERIOD_H1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_H1,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("T2H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T2H1", simbol,28, "Wingdings 2", warna);
        ObjectSet    ("T2H1", OBJPROP_XDISTANCE, 889);
        ObjectSet    ("T2H1", OBJPROP_YDISTANCE, 10);
//M30 TREND UJ        
        faiq     = iMA(Pair2,PERIOD_M30,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_M30,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("T2M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T2M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("T2M30", OBJPROP_XDISTANCE, 895);
        ObjectSet    ("T2M30", OBJPROP_YDISTANCE, 17);
//M15 TREND UJ       
        faiq     = iMA(Pair2,PERIOD_M15,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_M15,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm15u; simbol = "\xE9"; }
        else               { warna = Ctm15d;  simbol = "\xE9"; }
        ObjectCreate ("T2M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T2M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("T2M15", OBJPROP_XDISTANCE, 899);
        ObjectSet    ("T2M15", OBJPROP_YDISTANCE, 19);
//H4 TREND UJ         
        faiq     = iMA(Pair2,PERIOD_H4,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_H4,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("T2H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T2H4", simbol,1, "Webdings", warna);
        ObjectSet    ("T2H4", OBJPROP_XDISTANCE, 889);
        ObjectSet    ("T2H4", OBJPROP_YDISTANCE, 43);
//D TREND UJ        
        faiq     = iMA(Pair2,PERIOD_D1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_D1,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("T2D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T2D", simbol,1, "Webdings", warna);
        ObjectSet    ("T2D", OBJPROP_XDISTANCE, 909);
        ObjectSet    ("T2D", OBJPROP_YDISTANCE, 43);   
        
         ////////////// MARKET 20 VS 100 SMA USDJPY  //////////////
        
//H1 MARKET UJ
        faiq     = iMA(Pair2,PERIOD_H1,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_H1,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("M2H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M2H1", simbol,28, "Wingdings 2", warna);
        ObjectSet    ("M2H1", OBJPROP_XDISTANCE, 889);
        ObjectSet    ("M2H1", OBJPROP_YDISTANCE, 60);
//M30 MARKET UJ        
        faiq     = iMA(Pair2,PERIOD_M30,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_M30,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("M2M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M2M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("M2M30", OBJPROP_XDISTANCE, 895);
        ObjectSet    ("M2M30", OBJPROP_YDISTANCE, 67);
//M15 MARKET UJ       
        faiq     = iMA(Pair2,PERIOD_M15,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_M15,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm15u; simbol = "\xE9"; }
        else               { warna = Ctm15d;  simbol = "\xE9"; }
        ObjectCreate ("M2M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M2M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("M2M15", OBJPROP_XDISTANCE, 899);
        ObjectSet    ("M2M15", OBJPROP_YDISTANCE, 69);
//H4 MARKET UJ         
        faiq     = iMA(Pair2,PERIOD_H4,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_H4,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("M2H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M2H4", simbol,1, "Webdings", warna);
        ObjectSet    ("M2H4", OBJPROP_XDISTANCE, 889);
        ObjectSet    ("M2H4", OBJPROP_YDISTANCE, 93);
//D MARKET UJ        
        faiq     = iMA(Pair2,PERIOD_D1,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_D1,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("M2D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M2D", simbol,1, "Webdings", warna);
        ObjectSet    ("M2D", OBJPROP_XDISTANCE, 909);
        ObjectSet    ("M2D", OBJPROP_YDISTANCE, 93); 
        
         ////////////// GLOBAL 100 VS 200 SMA USDJPY  //////////////
        
//H1 GLOBAL UJ
        faiq     = iMA(Pair2,PERIOD_H1,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_H1,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("G2H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G2H1", simbol,28, "Wingdings 2", warna);
        ObjectSet    ("G2H1", OBJPROP_XDISTANCE, 889);
        ObjectSet    ("G2H1", OBJPROP_YDISTANCE, 110);
//M30 GLOBAL UJ        
        faiq     = iMA(Pair2,PERIOD_M30,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_M30,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("G2M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G2M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("G2M30", OBJPROP_XDISTANCE, 895);
        ObjectSet    ("G2M30", OBJPROP_YDISTANCE, 117);
//M15 GLOBAL UJ       
        faiq     = iMA(Pair2,PERIOD_M15,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_M15,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm15u; simbol = "\xE9"; }
        else               { warna = Ctm15d;  simbol = "\xE9"; }
        ObjectCreate ("G2M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G2M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("G2M15", OBJPROP_XDISTANCE, 899);
        ObjectSet    ("G2M15", OBJPROP_YDISTANCE, 119);
//H4 GLOBAL UJ         
        faiq     = iMA(Pair2,PERIOD_H4,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_H4,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("G2H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G2H4", simbol,1, "Webdings", warna);
        ObjectSet    ("G2H4", OBJPROP_XDISTANCE, 889);
        ObjectSet    ("G2H4", OBJPROP_YDISTANCE, 143);
//D GLOBAL UJ        
        faiq     = iMA(Pair2,PERIOD_D1,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_D1,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("G2D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G2D", simbol,1, "Webdings", warna);
        ObjectSet    ("G2D", OBJPROP_XDISTANCE, 909);
        ObjectSet    ("G2D", OBJPROP_YDISTANCE, 143);  
        
        
//EXIT 15 UJ        
        faiq     = iMA(Pair2,PERIOD_M15,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_M15,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E2M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E2M15", simbol,1, "Webdings", warna);
        ObjectSet    ("E2M15", OBJPROP_XDISTANCE, 890);
        ObjectSet    ("E2M15", OBJPROP_YDISTANCE, 151);  
        
//EXIT 30 UJ        
        faiq     = iMA(Pair2,PERIOD_M30,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_M30,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E2M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E2M30", simbol,1, "Webdings", warna);
        ObjectSet    ("E2M30", OBJPROP_XDISTANCE, 898);
        ObjectSet    ("E2M30", OBJPROP_YDISTANCE, 151); 
        
//EXIT 60 UJ        
        faiq     = iMA(Pair2,PERIOD_H1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_H1,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E2H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E2H1", simbol,1, "Webdings", warna);
        ObjectSet    ("E2H1", OBJPROP_XDISTANCE, 906);
        ObjectSet    ("E2H1", OBJPROP_YDISTANCE, 151);                        
             
//EXIT 240 UJ        
        faiq     = iMA(Pair2,PERIOD_H4,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_H4,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E2H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E2H4", simbol,1, "Webdings", warna);
        ObjectSet    ("E2H4", OBJPROP_XDISTANCE, 914);
        ObjectSet    ("E2H4", OBJPROP_YDISTANCE, 151);  
        
//EXIT D UJ        
        faiq     = iMA(Pair2,PERIOD_D1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair2,PERIOD_D1,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Lime; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E2D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E2D", simbol,1, "Webdings", warna);
        ObjectSet    ("E2D", OBJPROP_XDISTANCE, 922);
        ObjectSet    ("E2D", OBJPROP_YDISTANCE, 151);                 
       
       
        ////////////// TREND 3 VS 20 SMA USDCHF //////////////
                              
        
//H1 TREND UC
        

        faiq     = iMA(Pair3,PERIOD_H1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_H1,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("T3H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T3H1", simbol,28, "Wingdings 2", warna);
        ObjectSet    ("T3H1", OBJPROP_XDISTANCE, 933);
        ObjectSet    ("T3H1", OBJPROP_YDISTANCE, 10);
//M30 TREND UC        
        faiq     = iMA(Pair3,PERIOD_M30,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_M30,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("T3M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T3M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("T3M30", OBJPROP_XDISTANCE, 939);
        ObjectSet    ("T3M30", OBJPROP_YDISTANCE, 17);
//M15 TREND UC       
        faiq     = iMA(Pair3,PERIOD_M15,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_M15,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm15u; simbol = "\xE9"; }
        else               { warna = Ctm15d;  simbol = "\xE9"; }
        ObjectCreate ("T3M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T3M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("T3M15", OBJPROP_XDISTANCE, 943);
        ObjectSet    ("T3M15", OBJPROP_YDISTANCE, 19);
//H4 TREND UC         
        faiq     = iMA(Pair3,PERIOD_H4,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_H4,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("T3H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T3H4", simbol,1, "Webdings", warna);
        ObjectSet    ("T3H4", OBJPROP_XDISTANCE, 933);
        ObjectSet    ("T3H4", OBJPROP_YDISTANCE, 43);
//D TREND UC        
        faiq     = iMA(Pair3,PERIOD_D1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_D1,20,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("T3D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("T3D", simbol,1, "Webdings", warna);
        ObjectSet    ("T3D", OBJPROP_XDISTANCE, 953);
        ObjectSet    ("T3D", OBJPROP_YDISTANCE, 43);   

         ////////////// MARKET 20 VS 100 SMA USDCHF  //////////////
        
//H1 MARKET UC
        faiq     = iMA(Pair3,PERIOD_H1,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_H1,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("M3H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M3H1", simbol,28, "Wingdings 2", warna);
        ObjectSet    ("M3H1", OBJPROP_XDISTANCE, 933);
        ObjectSet    ("M3H1", OBJPROP_YDISTANCE, 60);
//M30 MARKET UC        
        faiq     = iMA(Pair3,PERIOD_M30,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_M30,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("M3M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M3M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("M3M30", OBJPROP_XDISTANCE, 939);
        ObjectSet    ("M3M30", OBJPROP_YDISTANCE, 67);
//M15 MARKET UC       
        faiq     = iMA(Pair3,PERIOD_M15,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_M15,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm15u; simbol = "\xE9"; }
        else               { warna = Ctm15d;  simbol = "\xE9"; }
        ObjectCreate ("M3M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M3M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("M3M15", OBJPROP_XDISTANCE, 943);
        ObjectSet    ("M3M15", OBJPROP_YDISTANCE, 69);
//H4 MARKET UC         
        faiq     = iMA(Pair3,PERIOD_H4,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_H4,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("M3H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M3H4", simbol,1, "Webdings", warna);
        ObjectSet    ("M3H4", OBJPROP_XDISTANCE, 933);
        ObjectSet    ("M3H4", OBJPROP_YDISTANCE, 93);
//D MARKET UC        
        faiq     = iMA(Pair3,PERIOD_D1,20,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_D1,100,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("M3D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("M3D", simbol,1, "Webdings", warna);
        ObjectSet    ("M3D", OBJPROP_XDISTANCE, 953);
        ObjectSet    ("M3D", OBJPROP_YDISTANCE, 93); 

         ////////////// GLOBAL 100 VS 200 SMA USDCHF  //////////////
        
//H1 GLOBAL UC
        faiq     = iMA(Pair3,PERIOD_H1,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_H1,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth1u; simbol = "\x81"; }
        else               { warna = Cth1d;  simbol = "\x81"; }
        ObjectCreate ("G3H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G3H1", simbol,28, "Wingdings 2", warna);
        ObjectSet    ("G3H1", OBJPROP_XDISTANCE, 933);
        ObjectSet    ("G3H1", OBJPROP_YDISTANCE, 110);
//M30 GLOBAL UC        
        faiq     = iMA(Pair3,PERIOD_M30,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_M30,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm30u; simbol = "\x81"; }
        else               { warna = Ctm30d;  simbol = "\x81"; }
        ObjectCreate ("G3M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G3M30", simbol,18, "Wingdings 2", warna);
        ObjectSet    ("G3M30", OBJPROP_XDISTANCE, 939);
        ObjectSet    ("G3M30", OBJPROP_YDISTANCE, 117);
//M15 GLOBAL UC       
        faiq     = iMA(Pair3,PERIOD_M15,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_M15,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctm15u; simbol = "\xE9"; }
        else               { warna = Ctm15d;  simbol = "\xE9"; }
        ObjectCreate ("G3M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G3M15", simbol,12, "Wingdings 2", warna);
        ObjectSet    ("G3M15", OBJPROP_XDISTANCE, 943);
        ObjectSet    ("G3M15", OBJPROP_YDISTANCE, 119);
//H4 GLOBAL UC         
        faiq     = iMA(Pair3,PERIOD_H4,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_H4,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Cth4u; simbol = "ggg"; }
        else               { warna = Cth4d;  simbol = "ggg"; }
        ObjectCreate ("G3H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G3H4", simbol,1, "Webdings", warna);
        ObjectSet    ("G3H4", OBJPROP_XDISTANCE, 933);
        ObjectSet    ("G3H4", OBJPROP_YDISTANCE, 143);
//D GLOBAL UC        
        faiq     = iMA(Pair3,PERIOD_D1,100,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_D1,200,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = Ctdu; simbol = "ggg"; }
        else               { warna = Ctdd;  simbol = "ggg"; }
        ObjectCreate ("G3D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("G3D", simbol,1, "Webdings", warna);
        ObjectSet    ("G3D", OBJPROP_XDISTANCE, 953);
        ObjectSet    ("G3D", OBJPROP_YDISTANCE, 143); 


//EXIT 15 UC        
        faiq     = iMA(Pair3,PERIOD_M15,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_M15,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = White; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E3M15", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E3M15", simbol,1, "Webdings", warna);
        ObjectSet    ("E3M15", OBJPROP_XDISTANCE, 933);//+45
        ObjectSet    ("E3M15", OBJPROP_YDISTANCE, 151);  
        
//EXIT 30 UC        
        faiq     = iMA(Pair3,PERIOD_M30,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_M30,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = White; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E3M30", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E3M30", simbol,1, "Webdings", warna);
        ObjectSet    ("E3M30", OBJPROP_XDISTANCE, 941);//+8
        ObjectSet    ("E3M30", OBJPROP_YDISTANCE, 151); 
        
//EXIT 60 UC        
        faiq     = iMA(Pair3,PERIOD_H1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_H1,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = White; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E3H1", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E3H1", simbol,1, "Webdings", warna);
        ObjectSet    ("E3H1", OBJPROP_XDISTANCE, 949);//+8
        ObjectSet    ("E3H1", OBJPROP_YDISTANCE, 151);                        
             
//EXIT 240 UC        
        faiq     = iMA(Pair3,PERIOD_H4,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_H4,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = White; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E3H4", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E3H4", simbol,1, "Webdings", warna);
        ObjectSet    ("E3H4", OBJPROP_XDISTANCE, 957);//+8
        ObjectSet    ("E3H4", OBJPROP_YDISTANCE, 151);  
        
//EXIT D UC        
        faiq     = iMA(Pair3,PERIOD_D1,3,0,MODE_SMA,PRICE_CLOSE,0);
        hilya    = iMA(Pair3,PERIOD_D1,13,0,MODE_SMA,PRICE_CLOSE,0);
        if (faiq>=hilya)   { warna = White; simbol = "g"; }
        else               { warna = Red;  simbol = "g"; }
        ObjectCreate ("E3D", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("E3D", simbol,1, "Webdings", warna);
        ObjectSet    ("E3D", OBJPROP_XDISTANCE, 965);//+8
        ObjectSet    ("E3D", OBJPROP_YDISTANCE, 151); 

        // ==================================================================================== //
        //                           F O R T H     C O L O U M B                                //
        // ==================================================================================== //

// Average Range
        // =============

         int      R1, R5, R10, R20, RAvg;
         int      RoomUp, RoomDown;
         double   low0, high0;
                              R1  =       (iHigh(NULL,PERIOD_D1,1)-iLow(NULL,PERIOD_D1,1))/Point;
         for (i=1;i<=5;i++)   R5  = R5  + (iHigh(NULL,PERIOD_D1,i)-iLow(NULL,PERIOD_D1,i))/Point;
         for (i=1;i<=10;i++)  R10 = R10 + (iHigh(NULL,PERIOD_D1,i)-iLow(NULL,PERIOD_D1,i))/Point;
         for (i=1;i<=20;i++)  R20 = R20 + (iHigh(NULL,PERIOD_D1,i)-iLow(NULL,PERIOD_D1,i))/Point;

         R5    = R5/5;
         R10   = R10/10;
         R20   = R20/20;
         RAvg  = (R1+R5+R10+R20)/4;    

         low0     =  iLow(NULL,PERIOD_D1,0);
         high0    =  iHigh(NULL,PERIOD_D1,0);
         RoomUp   =  RAvg - (Bid  - low0) / Point;
         RoomDown =  RAvg - (high0 - Bid) / Point;
        
        ObjectCreate("AveRangeTxt", OBJ_LABEL, WindowFind("TrixEMAboard"), 0, 0);
        ObjectSetText("AveRangeTxt","Ave Range",9, "Arial Bold", Blue);
        ObjectSet("AveRangeTxt", OBJPROP_CORNER, 0);
        ObjectSet("AveRangeTxt", OBJPROP_XDISTANCE, 630);
        ObjectSet("AveRangeTxt", OBJPROP_YDISTANCE, 30);

        ObjectCreate("AveRange", OBJ_LABEL, WindowFind("TrixEMAboard"), 0, 0);
        ObjectSetText("AveRange",DoubleToStr(RAvg,0),9, "Arial Bold", LightBlue);
        ObjectSet("AveRange", OBJPROP_CORNER, 0);
        ObjectSet("AveRange", OBJPROP_XDISTANCE, 720);
        ObjectSet("AveRange", OBJPROP_YDISTANCE, 30);


        // Day Range
        // =========
        
       
        // Pips to Bottom
        // ==============
        
        ObjectCreate("PipsToBotTxt", OBJ_LABEL, WindowFind("TrixEMAboard"), 0, 0);
        ObjectSetText("PipsToBotTxt","Pips To Bot",9, "Arial Bold", Blue);
        ObjectSet("PipsToBotTxt", OBJPROP_CORNER, 0);
        ObjectSet("PipsToBotTxt", OBJPROP_XDISTANCE, 630);
        ObjectSet("PipsToBotTxt", OBJPROP_YDISTANCE, 60);

        ObjectCreate("PipsToBot", OBJ_LABEL, WindowFind("TrixEMAboard"), 0, 0);
        ObjectSetText("PipsToBot",DoubleToStr(RoomDown,0),9, "Arial Bold", LightBlue);
        ObjectSet("PipsToBot", OBJPROP_CORNER, 0);
        ObjectSet("PipsToBot", OBJPROP_XDISTANCE, 720);
        ObjectSet("PipsToBot", OBJPROP_YDISTANCE, 60);

        // Pips to Top
        // ===========
        
        ObjectCreate("PipsToTopTxt", OBJ_LABEL, WindowFind("TrixEMAboard"), 0, 0);
        ObjectSetText("PipsToTopTxt","Pips To Top",9, "Arial Bold", Blue);
        ObjectSet("PipsToTopTxt", OBJPROP_CORNER, 0);
        ObjectSet("PipsToTopTxt", OBJPROP_XDISTANCE, 630);
        ObjectSet("PipsToTopTxt", OBJPROP_YDISTANCE, 75);

        ObjectCreate("PipsToTop", OBJ_LABEL, WindowFind("TrixEMAboard"), 0, 0);
        ObjectSetText("PipsToTop",DoubleToStr(RoomUp,0),9, "Arial Bold", LightBlue);
        ObjectSet("PipsToTop", OBJPROP_CORNER, 0);
        ObjectSet("PipsToTop", OBJPROP_XDISTANCE, 720);
        ObjectSet("PipsToTop", OBJPROP_YDISTANCE, 75);

        // Spread
        // ======

        ObjectCreate("SpreadTxt", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("SpreadTxt","---------------------------------------------",9, "Arial Bold", LightBlue);
        ObjectSet("SpreadTxt", OBJPROP_CORNER, 0);
        ObjectSet("SpreadTxt", OBJPROP_XDISTANCE, 795);
        ObjectSet("SpreadTxt", OBJPROP_YDISTANCE, 259);

        int Spread = (Ask-Bid)/Point;
        if (Spread>NormalSpread) warna = Red; else warna = Gold;
        ObjectCreate("Spread", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("Spread",DoubleToStr(Spread,0),9, "Arial Bold", warna);
        ObjectSet("Spread", OBJPROP_CORNER, 0);
        ObjectSet("Spread", OBJPROP_XDISTANCE, 848);
        ObjectSet("Spread", OBJPROP_YDISTANCE, 270);

         
        // ==================================================================================== //
        //                           F I F T H     C O L O U M B                                //
        // ==================================================================================== //

        // Account Company
        // ===============
        
        ObjectCreate("AccCompany", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("AccCompany","---------------------------------------------",9, "Arial Bold", LightBlue);
        ObjectSet("AccCompany", OBJPROP_CORNER, 0);
        ObjectSet("AccCompany", OBJPROP_XDISTANCE, 795);
        ObjectSet("AccCompany", OBJPROP_YDISTANCE, 240);

        // Server Time
        // ===========
        
        ObjectCreate("ServerTimeTxt", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("ServerTimeTxt","---------------------------------------------",9, "Arial Bold", LightBlue);
        ObjectSet("ServerTimeTxt", OBJPROP_CORNER, 0);
        ObjectSet("ServerTimeTxt", OBJPROP_XDISTANCE, 795);
        ObjectSet("ServerTimeTxt", OBJPROP_YDISTANCE, 277);

        text = DoubleToStr(TimeHour(TimeCurrent()),0) + " : " + DoubleToStr(TimeMinute(TimeCurrent()),0);
        ObjectCreate("ServerTime", OBJ_LABEL, 0, 0, 0);
        ObjectSetText("ServerTime",text,9, "Arial Bold", CadetBlue);
        
        ObjectSet("ServerTime", OBJPROP_XDISTANCE, 870);
        ObjectSet("ServerTime", OBJPROP_YDISTANCE, 232);

        
        
        
        

         
   return(0);
}