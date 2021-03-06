
// +----------------------------------------------------------------------------------------+ //
// |    .-._______                           FAIQHILYA                        _______.-.    | //
// |---( )_)______)                 Knowledge of the ancients                (______(_( )---| //
// |  (    ()___)                              \¦/                             (___()    )  | //
// |       ()__)                              (o o)                             (__()       | //
// |--(___()_)__________________________oOOo___(_)___oOOo_________________________(_()___)--| //
// |_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|____|_____| //
// |                                                                                   2017 | //
// |----------------------------------------------------------------------------------------| //
// |                 File:     BDFH FILTER 2                                              | //
// | Programming language:     MQL4                                                         | //
// | Development platform:     MetaTrader 4                                                 | //
// |          End product:     TARGET 2019                                                  | //
// |              Product:     26 NOPEMBER 2017                                             | //
// |                                                               [BILLION DOLLAR PROJECT] | //
// +----------------------------------------------------------------------------------------+ //
/*--------------------------------------------------------------------------------------------
                                                                    Traderathome, 16-01-2018
---------------------------------------------------------------------------------------------*/
                                                                    
#property copyright " ©2018 JANUARI"
#property link      "hilyaalzahmita@gmail.com"
#property indicator_chart_window
#property indicator_buffers 8
#property indicator_color3 C'120,0,0'
#property indicator_width3 5
#property indicator_color4 C'0,65,0'
#property indicator_width4 5

extern int MaPeriod1 = 6;
int gi_80 = 0;
int g_ma_method_84 = MODE_LWMA;
int g_applied_price_88 = PRICE_CLOSE;
extern int MaPeriod2 = 25;
int gi_96 = 0;
int g_ma_method_100 = MODE_LWMA;
int g_applied_price_104 = PRICE_CLOSE;
extern int MaPeriod3 = 30;
int gi_112 = 0;
int g_ma_method_116 = MODE_SMA;
int g_applied_price_120 = PRICE_CLOSE;
extern string Targets = "Risk: 1 to 6 (1=cons, 6=aggress)";
extern int Risk_Profile = 6;//6;
double gd_136;
double gd_144;
double gd_152;
double g_ibuf_160[];
double g_ibuf_164[];
double g_ibuf_168[];
double g_ibuf_172[];
double g_ibuf_176[];
double g_ibuf_180[];
double g_ibuf_184[];
double g_ibuf_188[];
double g_ima_192 = 0.0;
double g_ima_200 = 0.0;
double g_ima_208 = 0.0;
double g_ima_216 = 0.0;
double g_ima_224 = 0.0;
double g_ima_232 = 0.0;
double g_ima_240 = 0.0;
double g_ima_248 = 0.0;

int init() {
   IndicatorDigits(MarketInfo(Symbol(), MODE_DIGITS));
   SetIndexStyle(0, DRAW_NONE);
   SetIndexShift(0, gi_80);
   SetIndexStyle(1, DRAW_NONE);
   SetIndexShift(1, gi_96);
   SetIndexStyle(4, DRAW_NONE);
   SetIndexShift(4, gi_112);
   SetIndexStyle(5, DRAW_NONE);
   SetIndexShift(5, gi_80);
   SetIndexStyle(6, DRAW_NONE);
   SetIndexShift(6, gi_80);
   SetIndexStyle(7, DRAW_NONE);
   SetIndexShift(7, gi_80);
   int li_0 = MaPeriod1 - 1;
   IndicatorShortName("!BDP TREND FILLER");
   switch (g_ma_method_84) {
   case MODE_EMA:
      li_0 = 0;
      break;
   case MODE_SMMA: break;
   case MODE_LWMA: break;
   default:
      g_ma_method_84 = 0;
   }
   SetIndexDrawBegin(0, li_0);
   switch (g_ma_method_100) {
   case MODE_EMA:
      li_0 = 0;
      break;
   case MODE_SMMA: break;
   case MODE_LWMA: break;
   default:
      g_ma_method_100 = 0;
   }
   SetIndexDrawBegin(1, li_0);
   switch (g_ma_method_116) {
   case MODE_EMA:
      li_0 = 0;
      break;
   case MODE_SMMA: break;
   case MODE_LWMA: break;
   default:
      g_ma_method_116 = 0;
   }
   SetIndexDrawBegin(2, li_0);
   SetIndexBuffer(0, g_ibuf_160);
   SetIndexBuffer(1, g_ibuf_164);
   SetIndexBuffer(4, g_ibuf_168);
   SetIndexBuffer(5, g_ibuf_180);
   SetIndexBuffer(6, g_ibuf_184);
   SetIndexBuffer(7, g_ibuf_188);
   SetIndexStyle(2, DRAW_HISTOGRAM);
   SetIndexBuffer(2, g_ibuf_172);
   SetIndexStyle(3, DRAW_HISTOGRAM);
   SetIndexBuffer(3, g_ibuf_176);
   return (0);
}

int deinit() {
   return (0);
}

int start() {
   int li_4 = IndicatorCounted();
   if (li_4 < 0) return (-1);
   if (li_4 > 0) li_4--;
   int li_0 = Bars - li_4 - 1;
   for (int li_8 = li_0; li_8 >= 0; li_8--) {
      g_ima_192 = iMA(NULL, 0, MaPeriod1, gi_80, g_ma_method_84, g_applied_price_88, li_8);
      g_ima_200 = iMA(NULL, 0, MaPeriod2, gi_96, g_ma_method_100, g_applied_price_104, li_8);
      g_ima_208 = iMA(NULL, 0, MaPeriod3, gi_112, g_ma_method_116, g_applied_price_120, li_8);
      g_ima_216 = iMA(NULL, 0, 20, 0, MODE_EMA, PRICE_HIGH, li_8);
      g_ima_224 = iMA(NULL, 0, 20, 0, MODE_EMA, PRICE_LOW, li_8);
      g_ima_232 = iMA(NULL, 0, 20, 0, MODE_EMA, PRICE_CLOSE, li_8);
      g_ima_240 = iMA(NULL, 0, 20, 0, MODE_EMA, PRICE_CLOSE, li_8);
      g_ima_248 = iMA(NULL, 0, 20, 0, MODE_EMA, PRICE_CLOSE, li_8);
      g_ibuf_160[li_8] = g_ima_192;
      g_ibuf_164[li_8] = g_ima_200;
      g_ibuf_168[li_8] = g_ima_208;
      if (Risk_Profile == 1) {
         gd_136 = 0.5;
         gd_144 = 0.9;
         gd_152 = 1.3;
      }
      if (Risk_Profile == 2) {
         gd_136 = 0.8;
         gd_144 = 1.2;
         gd_152 = 1.6;
      }
      if (Risk_Profile == 3) {
         gd_136 = 1.1;
         gd_144 = 1.6;
         gd_152 = 2;
      }
      if (Risk_Profile == 4) {
         gd_136 = 1.6;
         gd_144 = 2;
         gd_152 = 2.4;
      }
      if (Risk_Profile == 5) {
         gd_136 = 2.1;
         gd_144 = 2.5;
         gd_152 = 2.9;
      }
      if (Risk_Profile == 6) {
         gd_136 = 2.6;
         gd_144 = 3;
         gd_152 = 3.4;
      }
      if (g_ima_192 < g_ima_200 && g_ima_200 < g_ima_208 && Close[li_8] < g_ima_208) {
         g_ibuf_176[li_8] = g_ima_192;
         g_ibuf_172[li_8] = g_ima_200;
         g_ibuf_180[li_8] = g_ima_232 - iATR(NULL, 0, 7, 0) * gd_136;
         g_ibuf_184[li_8] = g_ima_240 - iATR(NULL, 0, 7, 0) * gd_144;
         g_ibuf_188[li_8] = g_ima_248 - iATR(NULL, 0, 7, 0) * gd_152;
      }
      if (g_ima_192 > g_ima_200 && g_ima_200 > g_ima_208 && Close[li_8] > g_ima_208) {
         g_ibuf_176[li_8] = g_ima_192;
         g_ibuf_172[li_8] = g_ima_200;
         g_ibuf_180[li_8] = g_ima_232 + iATR(NULL, 0, 7, 0) * gd_136;
         g_ibuf_184[li_8] = g_ima_240 + iATR(NULL, 0, 7, 0) * gd_144;
         g_ibuf_188[li_8] = g_ima_248 + iATR(NULL, 0, 7, 0) * gd_152;
      }
   }
   return (0);
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
                             $$$$$k 3eeed$$b  FAIQHILYA."$$$$$$$$$                
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