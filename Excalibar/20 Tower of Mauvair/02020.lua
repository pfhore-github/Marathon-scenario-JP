last_poly2 = -1;
countdown = 0;
pause = 180;

start_teleport = false;
clear_teleport = true;
open_wait = false;
timer = 0;
teleport_poly = 169;
return_poly = 294;
offlimits1 = 44;
offlimits2 = 53;
teleport_light = 63;
teleport_dest = 229;
tower_teleport = 116;
tower_entrance = 152;
offlimit_return = 271;


function level_init (rs)
    teleport_platform = find_platform(164);
    Players[0]:play_sound(250, 1);
    if rs then
      return;
    end
    remove_items(_item_wand);
end
enter_to[return_poly] = function()
    teleport_ok = false
    open_wait = true;
    Players[0]:teleport(teleport_poly);
    if (teleport_platform.ceiling_height ~= 1.0) then
        teleport_platform.active = true;
    end
end

enter_to[teleport_poly] = function()  
    if Lights[teleport_light].active and (not open_wait) then
        teleport_ok = true
        teleport_platform.active = true;
    end
end

enter_to[offlimits1] = function()
    Players[0]:teleport(offlimit_return);
end

enter_to[offlimits2] = function()
    Players[0]:teleport(offlimit_return);
end

enter_to[tower_teleport] = function()
    Players[0]:play_sound(235, 1);
    Players[0]:position(-7.3, 5.2, 3.6, tower_entrance);
end


function level_idle ()
    player_poly = Players[0].polygon.index;
    if (player_poly ~= last_poly2) then
        last_poly2 = player_poly;
        open_wait = false;
        if (not clear_teleport) then
            clear_teleport = true;
            Players[0]:print('シークエンス完了');
        end
    end
    if (player_poly == teleport_poly) and 
    (not start_teleport) and 
    clear_teleport and
    (teleport_platform.ceiling_height < 0.2) and 
    teleport_ok then
        Players[0]:print('テレポート充電中...');
        start_teleport = true;
        prev_count = -1;
    elseif start_teleport then
        if (timer < pause) then
            timer = timer + 1;
            countdown = math.ceil ((pause - timer)/60);
            if countdown ~= prev_count then
                Players[0]:print(string.format(" %d ...", countdown));
                prev_count = countdown;
            end
        else 
            timer = 0;
            start_teleport = false;
            clear_teleport = false;  
            Players[0]:print('テレポート中...');
            Players[0]:teleport(teleport_dest + Game.global_random (6));
        end
    end
end