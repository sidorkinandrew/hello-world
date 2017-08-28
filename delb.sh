//if it worked for you, feel free to use it = think of donating any amount you wish
// если ВАМ понравилось у ВАС все работает, я буду очень рад любым ВАШИМ пожертвованиям
// BTC: 1HRjjHByNL2enV1eRR1RkN698tucecL6FA
// ETH: 0x4e5e7b86baf1f8d6dfb8a242c85201c47fa86c74
// ZEC: t1aKAm7qXi6fbGvAhbLioZm3Q8obb4e3BRo

for pair in `cat ./bittrex_pairs.txt| tr "\n" " "` do
    pm2 delete $pair
done
