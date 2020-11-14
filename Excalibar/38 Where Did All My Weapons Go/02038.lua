got_pistol = false;
got_dachron = false;
got_phaser = false;
got_flamer = false;
got_railgun = false;
got_hightech = false;
got_excalibur = false;
exit_release = false;
exit_poly = 759;
sword_poly = 742;
last_poly = nil;
camera_timer = 0;
camera_index = nil;
underwater_active = false;

function new_monster_poly(type, poly)
   Monsters.new(Polygons[poly].x, Polygons[poly].y, 0, Polygons[poly], type);
end
function level_init(rs)
    exit_door = Polygons[758];
    final_term = find_platform(760);
    restoring_saved = rs;
    Players[0]:play_sound(248, 1);
    if Players[0].items[_item_snyper] > 0 then
        got_pistol = true;
    end
    if Players[0].items[_item_railgun] > 0 then
        got_railgun = true;
    end
    if Players[0].items[_item_dachron] > 0 then
        got_dachron = true;
    end
    if Players[0].items[_item_hightech] > 0 then
        got_hightech = true;
    end
    if Players[0].items[_item_sword] > 0 then
        got_excalibur = true;
    end
    if Players[0].items[_item_phaser] > 0 then
        got_phaser = true;
    end
    if Players[0].items[_item_dragon_flamer] > 0 then
        got_flamer = true;
    end
    if rs then
        return;
    end
    remove_items(_item_epotion, _item_magic_scroll); 
end

function Triggers.platform_activated(poly)
    if poly.index == sword_poly then
        Polygons[698].floor.height = 4.8;
    end
end
enter_to[exit_poly] = function()
    Players[0]:teleport_to_level(28);
end
function level_idle ()
    if (got_pistol and got_dachron and got_phaser and got_flamer and
        got_railgun and got_hightech and got_excalibur and (not exit_release)) then
        exit_release = true;
        exit_door.floor.height = 5.0;
        final_term.active = true;
        Lights[20].active = false;
        Players[0]:print("転送室7Ｄへ進んでください"); 
        new_monster_poly(_minor_gat, 75);
        new_monster_poly(_major_gat, 77);
        new_monster_poly(_minor_gat, 92);
        new_monster_poly(_major_gat, 591);
        new_monster_poly(_minor_gat, 636);
        new_monster_poly(_major_gat, 585);
        new_monster_poly(_cavebob, 576);
        new_monster_poly(_cavebob, 575);
        new_monster_poly(_cavebob, 574);
   end
end

function level_got_item(item, player)
   if (item == _item_snyper) and (not got_pistol) then
      got_pistol = true;
      Players[0]:play_sound(233, 1);
      Players[0]:activate_terminal(4);
   elseif (item == _item_railgun) then
      got_railgun = true;
      Players[0]:play_sound(233, 1);
      Players[0]:activate_terminal(9);
   elseif (item == _item_dachron) then
      got_dachron = true;
      Players[0]:play_sound(233, 1);
      Players[0]:activate_terminal(5);
   elseif (item == _item_hightech) then
      got_hightech = true;
      Players[0]:play_sound(233, 1);
      Players[0]:activate_terminal(7);
   elseif (item == _item_sword) then
      got_excalibur = true;
      Players[0]:play_sound(233, 1);
   elseif (item == _item_phaser) then
      got_phaser = true;
      Players[0]:play_sound(233, 1);
      Players[0]:activate_terminal(6);
   elseif (item == _item_dragon_flamer) then
      got_flamer = true;
      Players[0]:play_sound(233, 1);
      Players[0]:activate_terminal(8);
   end
end

