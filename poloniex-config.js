var config = { 
BUYLVL1: 2, 
BUYLVL2: 3, 
BUYLVL3: 4, 
SELLLVL1: 3, 
SELLLVL2: 7, 
SELLLVL3: 14,
BTC_TRADING_LIMIT: 0.01,
BUY_STRATEGY: 'STEPGAIN', // accepted values BB or STEPGAIN or GAIN or PINGPONG 
SELL_STRATEGY: 'STEPGAIN', // accepted values BB or STEPGAIN or GAIN or PINGPONG 
LOW_BB: -25, 
HIGH_BB: 25, 
BUY_LEVEL: 3, // If GAIN buy strategy is used, buy at this percentual below lower ema value 
GAIN: 2, // If GAIN sell strategy is used, sell at this percentual above bought price 
SECURITY_MARGIN: 40, // sell all balance if currency decreases x% after you bought it 

//  DEBUG 
DEBUG_LOG:false, 
I_REALLY_WANT_IT:false, 
BUY_SMALL_PORTION:1, 
INSUFFICIENT_FUNDS_ON_SELL_FIX: 0.0005, 
INSUFFICIENT_FUNDS_ON_BUY_FIX: 0.0005, 
//-----------------------------------------------
//   STARTUP OPTIONS 
//----------------------------------------------- 
SELL_ON_START:false,	
CANCEL_SELL_ORDERS_ON_START:false, 
CANCEL_BUY_ORDERS_ON_START:false, 
CANCEL_OPEN_ORDERS_ON_START:false, 
MAX_LATEST_PRICES:300,// limit of latest prices to analyze to determine if price is growing or falling 
MAX_LATEST_DIRECTIONS:30,// limit of latest  price directions ,used in supergun detection 
MAX_LATEST_PRICES_TREND:30, 
MAX_LAST_ORDERS:5,  // keeping last orders bought 
PERIOD: 5,   // candlestick period 
SAVEFILE_SUFFIX: '-save.json', 
//----------------------------------------------- 
//  PRIMARY SETTINGS 
DEFAULT_MARKET_NAME:'poloniex', 
DEFAULT_CURRENCY_PAIR:'BTC_BELA',   //  single pair format for all markets ! 
PINGPONG_BUY: 0.12345678, 
PINGPONG_SELL: 0.12345678, 
MIN_VOLUME_TO_BUY: 0.0005,  // bitrex min volume 
//---POLONIEX 
POLONIEX_PRICE_METHOD:'vwa',// ohlc OR vwa price to buy definition method 
POLONIEX_VWA_1_INTERVAL: 0.01,// weighted average interval in hours 
POLONIEX_VWA_2_INTERVAL: 0.02,// weighted average interval in hours 
//----------------------------------------------- 
//   BOT TIMINGS 
//----------------------------------------------- 
//----------------------------------------------- 
// EMAIL 
//----------------------------------------------- 
ALERT_ON_NO_FUNDS:false,  // email on insufficcient funds 
SMTP_EMAIL: '%40@gmail.com', 
ALERT_EMAIL:'********', 
SMTP_PASSWORD: '**********', 
SMTP: true, 
SMTP_PROTOCOL: 'SMTPS', 
SMTP_HOST: 'smtp.gmail.com', 
//----------------------------------------------- 
//  OUTPUT 
//----------------------------------------------- 
MAX_LATEST_PRICES_SHOWN: 0, // limit of latest prices to show in console.log 
SHOW_LASTEST_DIRECTIONS:false,  // show chart in console 
MAX_LATEST_DIRECTIONS_SHOWN:0, // chart height 
LASTEST_DIRECTIONS_LIST_WIDTH:0, // chart width 
//----------------------------------------------- 
//   OTHER (might be deprecated/not in use ) 
//----------------------------------------------- 
BTC_BALANCE: 2// btc balance for test purposes, 
};
module.exports = config;
