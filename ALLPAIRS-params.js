//if it worked for you, feel free to use it = think of donating any amount you wish
// если ВАМ понравилось у ВАС все работает, я буду очень рад любым ВАШИМ пожертвованиям
// BTC: 1HRjjHByNL2enV1eRR1RkN698tucecL6FA
// ETH: 0x4e5e7b86baf1f8d6dfb8a242c85201c47fa86c74
// ZEC: t1aKAm7qXi6fbGvAhbLioZm3Q8obb4e3BRo

var config = {
	BOT_SLEEP_DELAY: ((1001)*7*(Math.random()*0.3+0.7)),
	BOT_ON_FAIL_DELAY:((1001)*7*(Math.random()*0.3+0.7)),
  BOT_MAX_LIFETIME:999999999,
// change xxxx to your activated by @GuntharDeNiro Poloniex api/keys
	POLONIEX_KEY: 'xxxxxxx',
	POLONIEX_SECRET: 'xxxxxxx'
};
 
module.exports = config;
