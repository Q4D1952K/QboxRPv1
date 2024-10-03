lib.callback.register('rep-recyclejob:callback:reward', function(source)
   local src = source
   Framework.AddItem(src, Config.Reward.item, math.random(Config.Reward.amount.min, Config.Reward.amount.max))
end)

RegisterNetEvent('rep-recyclejob:server:exchange', function (name, add, remove, amount)
   local src = source
   if Framework.RemoveItem(src, Config.Reward.item, math.ceil(amount * remove / add)) then
      Framework.AddItem(src, name, amount)
   else
      Framework.Notification(src, Lang.error.amountItem.label, Lang.error.amountItem.type, Lang.error.amountItem.time)
   end
end)