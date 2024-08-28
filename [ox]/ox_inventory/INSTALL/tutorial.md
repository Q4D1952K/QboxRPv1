Installation Tutorial

1. Set your slot numbet minimum to 44 (You can increase how much you want)  
   1.1 setr inventory:slots 44 in your server or inventory config.
   (https://overextended.dev/ox_inventory)
   1.2. Inside your server resources navigate to “illenium-appearance”.
   1.3. Replace/upload files from package to your server. (client, game, server folder)

2. Upload "itemclothes" script
   3.1 Make sure itemclothes is started after the inventory script.

3. Disabling clothing change ability
   1.1. Why, feature explanation: You can turn off clothing change feature when
   player are in job clothes or any other reason.
   1.2. If you want to use the statebag turn on in server.lua:5
   1.3. Statebag usage:  
    LocalPlayer.state:set('canChangeClothes', (true or false), true)
4. Clear Skin Export
   4.1. Change the player's skin to default, for example, after registration.
   4.2. Export usage (client-side):  
   exports.itemclothes:clearSkin()
5. Bags increasing slots and weight.
   5.1. Using ox_inventory shops create specific bags like that:
   https://pastebin.com/LhzSQ2Dh
