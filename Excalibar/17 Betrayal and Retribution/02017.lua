function level_init (rs)
   Players[0]:play_sound(175, 1);
   if rs then
      return;
   end
   remove_items(_item_wand, _item_rocks);
end
