last_poly = nil;
min_left = 0;  --[[ 8 monsters off-site, accounted for in enemies_left() call --]]

underwater_active = false;
gas_activated = false;
eggs_left = 0;
hatchlings_left = 0;
breeder = false;
mutants_clear = false;
eggs_activated = false;
simlab_message = false;
simlab_lockdown = true;
gas_entry = 803;
simlab_poly1 = 55;
simlab_poly2 = 52;
function level_init (rs)
    simlab_door = find_platform(113);
    simlab_cell = find_platform(40);
    airlock_light = Lights[23];
    gas_light = Lights[26];
    scan_light = Lights[40];
    gas_seal = Polygons[802];
    restoring_saved = rs;
    danger_compass = scan_light.active;
    Players[0]:play_sound(248, 1);
    for g in Monsters() do 
        mt = g.type;
        if (mt == _metal_bar) or (mt == _torch) then
	        eggs_left = eggs_left + 1;
        end
        if (mt == _minor_dinobug) or (mt == _major_dinobug) then
    	    hatchlings_left = hatchlings_left + 1;
        end
        if mt == _evil_tree then
    	    breeder = true;
        end
    end
    all_clear();
    if rs then
        if simlab_door.floor_height == -2 then
            simlab_lockdown = false;
            simlab_message = true;
        end
        return;
    end
    remove_items(_item_sword, _item_water_vial, _item_crossbow, 
        _item_crossbow_bolts, _item_epotion, _item_magic_scroll); 
end

function timer_color(e)
    if (e <= min_left) then 
        if (not task_done) then
            set_terminal_text_number(131, 548, 11);
            task_done = true;
        end
        return "green";
    elseif (e < 31) then 
        return "yellow";
    else 
        return "red";
    end
end
enter_to[gas_entry] = function()
    if not eggs_activated then
        eggs_activated = true;
    end
end

enter_to[802] = function()
    if eggs_activated then
        eggs_activated = false;
        Players[0].overlays[0].text = "";
        Players[0].overlays[1].text = "";
        Players[0].overlays[2].text = "";
    end
end

enter_to[simlab_poly1] = function()
    if not simlab_message then
        simlab_message = true;
        Players[0]:play_sound(143, 1);
        Players[0]:print("マーリン：シミュレーション研究所の鍵を開ける前に科学ラウンジで私と連絡してください");
    end
end

enter_to[simlab_poly2] = enter_to[simlab_poly1]
function level_idle ()
    if not danger_compass then
        if scan_light.active then
            danger_compass = true; 
            Players[0].overlays[0]:clear();
            Players[0].overlays[1]:clear();
            Players[0].overlays[2]:clear();
        end
   end
   if danger_compass then
        e = enemies_left(8);
        if e == 0 then
	        Players[0].overlays[0].text = "完了";
        else
	        Players[0].overlays[0].text = string.format("残りの敵は %d", e);
        end
        Players[0].overlays[0].color = timer_color(e);
        idle_danger(2, 10, 154);
    end
    if simlab_cell.active and (not bobs_called) then
        Players[0]:play_sound(184, 1);
        bobs_called = true;
    end
    if simlab_door.active and (simlab_lockdown) then
        Players[0]:print('マーリン：ライブラリへ走れ！');
        Players[0]:play_sound(143, 1);
        simlab_lockdown = false;
        simlab_message = true;
    end
    if airlock_light.active and Lights[10].active then
        Lights[10].active = false;
        Lights[11].active = true;
    elseif (not airlock_light.active) and Lights[11].active then
        Lights[10].active = true;
        Lights[11].active = false;
    end
    --[[ We need to control fog specifically for this level, so anytime the gas chamber changes, clear any poison effects.
    --]]
    if gas_light.active and (not gas_activated) then
        if poison_active then   --[[ Turn off poison if it is currently on ]]
            poison_active = false;
            Players[0]._poisoned = -1;
            Players[0]._poison_hits = 0;
            if (Players[0]._tolerance < 9) then
                Players[0]._tolerance = Players[0]._tolerance + 1
	        end
        end
        gas_activated = true;
        gas_tick = 0;
        gas_seal.ceiling.height = -2;
        Level.fog.present = true;
        Level.fog.depth = 3;
        Level.fog.color.r = .5;
        Level.fog.color.g = .5;
        Level.fog.color.b = .5;
    end
    if gas_activated and (not gas_light.active) then
        if poison_active then   --[[ Turn off poison if it is currently on ]]
            poison_active = false;
            Players[0]._poisoned = -1;
            Players[0]._poison_hits = 0;
            if (Players[0]._tolerance < 9) then
                Players[0]._tolerance = Players[0]._tolerance + 1
	        end
        end
        gas_activated = false;
        gas_seal.ceiling.height = -1;
        Level.fog.present = false;
    end
  
   if gas_activated then
      gas_chamber();
    end
   if eggs_activated then
      display_eggs();
    end
    all_clear();
end

function all_clear()
    if (eggs_left == 0) and (hatchlings_left == 0) and (not breeder) and
         (not mutants_clear) then
        mutants_clear = true;
        eggs_activated = false;
        set_terminal_text_number(131, 548, 11);
        Players[0].overlays[0]:clear();
        Players[0].overlays[1]:clear();
        Players[0].overlays[2]:clear();
        Players[0]:play_sound(233, 1);
        Players[0]:print('ミュータントのラプトルは根絶された！');
    end
end

function display_eggs()
    if mutants_clear or danger_compass then
        return;
    end
    Players[0].overlays[0].color = "blue";
    Players[0].overlays[1].color = "red";
    Players[0].overlays[2].color = "white";
    Players[0].overlays[0].text = string.format('卵: %d ',eggs_left);
    Players[0].overlays[1].text = string.format('孵った数: %d ', hatchlings_left);
    if breeder then
        Players[0].overlays[2].text = 'ブリーダー: 稼働';
    else
        Players[0].overlays[2].text = 'ブリーダー: 停止';
    end
    if not eggs_activated then
        eggs_activated = true;
    end
end

function gas_chamber()
    if gas_tick > 0 then
        gas_tick = gas_tick - 1;
        return;
    end
    local deaths = 0;
    local eggs = 0;
    local hatchlings = 0;
    gas_tick = 15;
    p = Players[0].monster;
    h = Players[0].life;
    if h > 1 then
        Players[0].life = h - 1;
    else
        p:damage(10, "suffocation");
    end
    for g in Monsters() do
        if (g.index ~= p.index) then
            mp = g.polygon;
            mv = g.vitality;
            if (mp.index >= 803) and (mp.index <= 832) then
                mt = g.type;
                if (mt == _metal_bar) or (mt == _torch) then
                   eggs = eggs + 1;
	            end
                if (mt == _minor_dinobug) or (mt == _major_dinobug) then
                    hatchlings = hatchlings + 1;
	            end
                if (mv > 2) then
                    g.vitality = mv - 1;
                elseif (deaths <= 1) and (mv > 0) then
                    g:damage(10, "suffocation");
                    deaths = deaths + 1;
	            end
	        end
        end
    end
    display_eggs();
end

function level_monster_killed(monster, player, projectile)
    mtype = monster.type;
    if (mtype == _evil_tree) then
        breeder = false;
        display_eggs();
    end
    if (mtype == _minor_dinobug) or (mtype == _major_dinobug) then
        hatchlings_left = hatchlings_left - 1;
    end
    if (mtype == _metal_bar) or (mtype == _torch) then
        eggs_left = eggs_left - 1;
        x = monster.x;
        y = monster.y;
        p = monster.polygon;
        if mtype == _metal_bar then
            baby = _major_dinobug;
        else
            baby = _minor_dinobug;
        end
        d = Game.global_random (360);
        r = Monsters.new(x, y, 0, p, baby);
        r.yaw = d;
        d = Game.global_random (360);
        r = Monsters.new(x, y, 0, p, baby);
        r.yaw = d;
        hatchlings_left = hatchlings_left + 2;
        if mtype == _raptor_eggs then
	        d = Game.global_random (360);
	        r = Monsters.new(x, y, 0, p, baby);
	        r.yaw = d;
            hatchlings_left = hatchlings_left + 1;
        end
    end
end
