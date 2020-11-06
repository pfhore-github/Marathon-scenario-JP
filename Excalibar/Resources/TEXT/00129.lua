-- 汎用スクリプト
Triggers = {};

_weapon_knuckles = 0;
_weapon_snyper = 1;
_weapon_crossbow = 2;
_weapon_railgun = 2;
_weapon_dachron = 3;
_weapon_hightech = 4;
_weapon_phaser = 5;
_weapon_excalibur = 6;
_weapon_lightsaber = 6;
_weapon_spear = 7;
_weapon_flamer = 7;
_weapon_ball = 8;
_weapon_wand = 9;
_weapon_staff = 9;
_item_knuckles = "fist";
_item_snyper = "pistol";
_item_snyper_ammo = "pistol ammo";
_item_crossbow = "fusion pistol";
_item_railgun = "fusion pistol";
_item_crossbow_bolts = "fusion pistol ammo";
_item_railgun_ammo = "fusion pistol ammo";
_item_dachron = "assault rifle";
_item_dachron_ammo = "assault rifle ammo";
_item_plasma_pak = "assault rifle grenades";
_item_hightech = "missile launcher";
_item_missiles = "missile launcher ammo";
_item_invisible = "invisibility";
_item_invincible = "invincibility";
_item_nightvision = "infravision";
_item_tiny_module = "infravision";
_item_sword = "alien weapon";
_item_saber = "alien weapon";
_item_magic_scroll = "alien weapon ammo";
_item_phaser = "flamethrower";
_item_phaser_pak = "flamethrower ammo";
_item_antidote = "extravision";
_item_epotion = "oxygen";
_item_grenade = "oxygen";
_item_health = "single health";
_item_2x_powerup = "double health";
_item_3x_powerup = "triple health";
_item_spear = "shotgun";
_item_axe = "shotgun";
_item_dragon_flamer = "shotgun";
_item_vial = "shotgun ammo";
_item_water_vial = "shotgun ammo";
_item_sap_card = "key";
_item_key = "uplink chip";
_item_magic_staff = "smg";
_item_wand = "smg";
_item_rock = "smg ammo";
_item_rocks = "smg ammo";
_item_knives = "smg ammo";
_item_dragon_fuel = "smg ammo";
_item_napalm = "smg ammo";

_spewie = "minor tick";
_barrel = "major tick";
_exploding_barrel = "kamikaze tick";
_novice_sorcerer = "minor compiler";
_magus_sorcerer = "major compiler";
_shadow_sorcerer = "minor invisible compiler";
_master_wizard = "major invisible compiler";
_future_bob = "minor fighter";
_futurebob = "minor fighter";
_soldier = "major fighter";
_minor_archer = "minor projectile fighter";
_major_archer = "major projectile fighter";
_cavebob = "green bob";
_white_knight = "blue bob"; 
_ranger = "security bob";
_clone = "explodabob";
_minor_dinobug = "minor drone";
_major_dinobug = "major drone";
_minor_raptor = "big minor drone";
_major_raptor = "big major drone";
_dimorph = "possessed drone";
_skull_snake = "minor cyborg";
_fire_beast = "major cyborg";
_hover_gat = "minor flame cyborg";
_bike_cop = "major flame cyborg";
_trex = "minor enforcer";
_cleric = "major enforcer";
_lesser_knight = "minor hunter";
_black_knight = "major hunter";
_minor_gat = "minor trooper";
_major_gat = "major trooper";
_morgana = "mother of all cyborgs";
_mordred = "mother of all hunters";
_spider = "sewage yeti";
_piranha = "water yeti";
_evil_tree = "lava yeti";
_throne = "minor defender";
_wooden_table = "major defender";
_minor_spam = "minor juggernaut";
_major_spam = "major juggernaut";
_wooden_chair = "tiny pfhor";
_maint_bob = "tiny bob";
_metal_bar = "tiny yeti";
_raptor_eggs = "green vacbob";
_torch = "blue vacbob";
_fire = "security vacbob";
_laser_turret = "explodavacbob";

monsters_name = {
[_spewie]="SPEWIE",
[_barrel]="樽",
[_exploding_barrel]="爆発する樽",
[_novice_sorcerer]="マイナー魔法使い",
[_magus_sorcerer]="メジャー魔法使い",
[_shadow_sorcerer]="霊体魔法使い",
[_master_wizard]="モーベア",
[_future_bob]="連合軍戦士",
[_soldier]="悪の兵士",
[_minor_archer]="射手",
[_major_archer]="金髪の射手",
[_cavebob]="グロッグ",
[_white_knight]="白馬の騎士",
[_ranger]="レンジャー",
[_clone]="フォラジェ・クローン",
[_minor_dinobug]="ダイノバグ",
[_major_dinobug]="吐くダイノバク",
[_minor_raptor]="ラプトル",
[_major_raptor]="メスのラプトル",
[_dimorph]="ダイモルフォドン",
[_skull_snake]="骸骨蛇",
[_fire_beast]="翼のある火炎獣",
[_hover_gat]="空飛ぶ騎兵",
[_bike_cop]="バイク警官",
[_trex]="ティラノサウルス",
[_cleric]="悪の聖職者",
[_lesser_knight]="闇の騎士",
[_black_knight]="黒い騎士",
[_minor_gat]="GAT",
[_major_gat]="メジャーGAT",
[_morgana]="モルガナ",
[_mordred]="モードレッド",
[_spider]="モルガナの偵察兵",
[_piranha]="ピラニア",
[_evil_tree]="襲う木",
[_throne]="王座（破壊者！）",
[_wooden_table]="テーブル（破壊者！）",
[_minor_spam]="スパムメカ",
[_major_spam]="ミサイルスパムメカ",
[_wooden_chair]="椅子（破壊者！）",
[_maint_bob]="整備士",
[_metal_bar]="破壊可能な棒",
[_raptor_eggs]="ラプトルの卵",
[_torch]="燃えているたいまつ",
[_fire]="地獄の炎",
[_laser_turret]="守護者のやぐら"
}

_class_player = "player";
_class_friend = "bob";
_class_raptor = "madd";
_class_dimorphodon = "possessed drone";
_class_trex = "defender";
_class_archer = "fighter";
_class_sorcerer = "trooper";
_class_knight = "hunter";
_class_beast = "enforcer";
_class_spam = "juggernaut";
_class_spewie = "drone";
_class_futurebob = "compiler";
_class_gat = "cyborg";
_class_clone = "explodabob";
_class_bosses = "tick";
_class_environment = "yeti";


_shot_missile = "missile";
_shot_grenade = "grenade";
_shot_snyper_bullet = "pistol bullet";
_shot_dachron_bullet = "rifle bullet";
_shot_white_eye_bolt = "shotgun bullet";
_shot_sword_melee = "staff";
_shot_green_eye_bolt = "staff bolt";
_shot_fireblast = "flamethrower burst";
_shot_fireball = "compiler bolt minor";
_shot_freeze = "compiler bolt major";
_shot_healing = "alien weapon";
_shot_excalibur = "fusion bolt minor";
_shot_lightning = "fusion bolt major";
_shot_plasma = "hunter";
_shot_blades = "fist";
_shot_bone = "armageddon sphere";
_shot_rock = "armageddon electricity";
_shot_guided_micromissile = "juggernaut rocket";
_shot_evil_arrow = "trooper bullet";
_shot_crossbow_bolt = "trooper grenade";
_shot_knife = "minor defender";
_shot_venom_bite = "major defender";
_shot_venom_spit = "juggernaut missile";
_shot_claw_rip = "minor energy drain";
_shot_laser_turret = "major energy drain";
_shot_micromissile = "oxygen drain";
_shot_drain = "minor hummer";
_shot_photon = "major hummer";
_shot_trex_chomp = "durandal hummer";
_shot_spear = "minor cyborg ball";
_shot_sting = "major cyborg ball";
_shot_ball = "ball";
_shot_electrical_short = "minor fusion dispersal";
_shot_electrical_blast = "major fusion dispersal";
_shot_overload = "overloaded fusion dispersal";
_shot_raptor_bite = "yeti";
_shot_phaser = "sewage yeti";
_shot_morgana_spell = "lava yeti";
_shot_special = "smg bullet";

projectiles = {
[_shot_missile]="ハイテクミサイル",
[_shot_grenade]="グレネード",
[_shot_snyper_bullet]="スナイパー",
[_shot_dachron_bullet]="ダクロン",
[_shot_white_eye_bolt]="目の電光",
[_shot_sword_melee]="剣",
[_shot_green_eye_bolt]="目の電光",
[_shot_fireblast]="炎",
[_shot_fireball]="火の玉",
[_shot_freeze]="冷たい冷気",
[_shot_healing]="バンドエイド",
[_shot_excalibur]="魔法の剣",
[_shot_lightning]="雷光",
[_shot_plasma]="プラズマ",
[_shot_blades]="切り刻み",
[_shot_bone]="骨",
[_shot_rock]="岩",
[_shot_guided_micromissile]="誘導マイクロミサイル",
[_shot_evil_arrow]="矢",
[_shot_crossbow_bolt]="石弓",
[_shot_knife]="ナイフ",
[_shot_venom_bite]="有毒な噛み",
[_shot_venom_spit]="有毒な汚物",
[_shot_claw_rip]="剃刀のようなかぎづめ",
[_shot_laser_turret]="レーザービーム",
[_shot_micromissile]="マイクロミサイル",
[_shot_drain]="エネルギー吸収",
[_shot_photon]="光子グレネード",
[_shot_trex_chomp]="大きな噛み付き",
[_shot_spear]="やり",
[_shot_sting]="突き刺し",
[_shot_ball]="ボール",
[_shot_electrical_short]="短い電撃",
[_shot_electrical_blast]="電撃の爆発",
[_shot_overload]="過負荷",
[_shot_raptor_bite]="攻撃的な噛み",
[_shot_phaser]="フェーザー",
[_shot_morgana_spell]="悪の呪文",
[_shot_special]="謎の呪文"
}


_damage_0 = "explosion"
_damage_zap = "staff"
_damage_2 = "projectile"
_damage_3 = "absorbed"
_damage_fire = "flame"
_damage_rip = "claws"
_damage_healing = "alien weapon"
_damage_trex = "hulk slap"
_damage_spell = "compiler"
_damage_excalibur = "fusion"
_damage_plasma = "hunter"
_damage_swing = "fists"
_damage_12 = "teleporter"
_damage_cold = "defender"
_damage_poison = "yeti claws"
_damage_laser = "yeti projectile"
_damage_16 = "crushing"
_damage_17 = "lava"
_damage_18 = "suffocation"
_damage_electrocute = "goo"
_damage_drain = "energy drain"
_damage_21 = "oxygen drain"
_damage_micromissile = "drone"
_damage_arrows = "shotgun"

damages = {
[_damage_explosion]={"外に吹き飛ばした", "外に吹き飛ばされた"},
[_damage_zap]={"衝撃を与えた", "衝撃を受けた"},
[_damage_projectile]={"撃った", "撃たれた"},
[_damage_absorbed]={"無敵なのに殺した?!", "無敵なのに死んだ?!"},
[_damage_flame]={"融かした", "融けた"},
[_damage_rip]={"から剥がした", "剥がれた"},
[_damage_healing]={"魔法をかけた", "魔法がかかった"},
[_damage_trex]={"噛み付いた", "噛みつかれた"},
[_damage_spell]={"呪った", "呪われた"},
[_damage_excalibur]={"破壊した", "破壊された"},
[_damage_plasma]={"殺した", "殺された"},
[_damage_swing]={"溺れさせた", "溺れた"},
[_damage_teleporter]={"テレポートさせた", "テレポートした"},
[_damage_cold]={"凍らせた", "凍った"},
[_damage_poison]={"毒を浴びせた", "毒を浴びた"},
[_damage_laser]={"焼いた", "焼かれた"},
[_damage_crushing]={"ぶつけた", "ぶつけられた"},
[_damage_lava]={"焼いた","焼かれた"},
[_damage_suffocation]={"窒息死させた", "窒息した"},
[_damage_electrocute]={"感電させた", "感電した"},
[_damage_drain]={"吸収した", "吸収された"},
[_damage_oxygen_drain]={"吸収した", "吸収された"},
[_damage_micromissile]={"外に吹き飛ばした", "外に吹き飛ばされた"},
[_damage_arrows]={"撃った", "撃たれた"}
}
yuk_icon = [[
3
*0000FF
#000000
 FFFFFF
################
##    ####    ##
#####  ##  #####
################
################
#####  ##  #####
#####  ##  #####
################
################
#######  #######
#####      #####
###    ##    ###
###    ##    ###
##   # ## #   ##
## ###    ### ##
#######  #######
]];
skull_icon = [[
3
*0000FF
#000000
 FFFFFF
#####      #####
###          ###
###          ###
###  ##  ##  ###
###  ##  ##  ###
###          ###
###    ##    ###
######    ######
###### ## ######
# ####    #### #
#    ######    #
###          ###
######    ######
#      ##      #
# ############ #
################
]];

sword = { "sword" };
powerup = { "invisible", "invincible", "nightvision" };
energies = { "2x powerup", "3x powerup" };

logs = {}
function LOG(s) 
    logs[ #logs + 1] = s
end

function remove_items(...)
    local args = { ... }
    for p in Players() do
        for i, v in ipairs (args) do
        p.items[v] = 0;
        end
    end
end

function remove_monsters(monster_type)
    for g in Monsters() do
        if (g.type == monster_type) then
            g:damage(g.life+1, "suffocation");
        end
    end
end

function enemies_left(player, buffer)
    local cnt = 0
    for g in Monsters() do
        if (g.valid and g.index ~= player.monster.index) then
            local mtype = g.type;
            if (mtype ~= _fire) and (mtype ~= _torch) then
                if mtype.enemies["player"] then
                    cnt = cnt + 1
                end
            end
        end
    end
    if buffer > 0 then
        cnt = math.max(cnt - buffer, 0)
    end
    return cnt
end


function random_select(num, base)
    local ret, reg = {}, {};
    if num > base then
        Players.print('RANDOM_SELECT();への間違った呼び出し: '..num..' > '..base)
        num = base;
    end
    while (# ret < num) do
        local n = 1 + Game.global_random (base)
        if (not reg[n]) then
            table.insert(ret, n);
	        reg[n] = true;
        end
    end
    return ret;
end

function find_polygon(search_text)
    for anno in Annotations() do
        if (search_text == anno.text) then 
            return anno.polygon 
        end
    end
    return nil
end

function find_platform(index)
    for plat in Platforms() do
        if( plat.polygon.index == index ) then
            return plat
        end
    end
    return nil
end

function find_monster(mtype)
	for g in Monsters() do
		if g.type == mtype then
			return g
		end
	end
	return nil
end

function get_monster_name(monster)
    for p in Players() do
        if ( p.monster == monster) then
            return p.name;
        end
    end
    return monsters_name[monster.type];
end

function Triggers.cleanup()
    if ctf_cleanup ~= nil then
        ctf_cleanup();
    end
    if level_cleanup ~= nil then
        level_cleanup();
    end
    Level.fog.present = false;
    for p in Players() do 
        if p.local_ then
            p.crosshairs.active = false;
            p.overlays[0]:clear();
            p.overlays[1]:clear();
            p:print("");
            p:print("");
            p:print("");
            p:print("");
            p:print("");
            p:print("");
            p:print("");
            p:print("");
        end
    end
end
--[[
This script was written for EMR by Solra Bizna. Players and monsters with 
class player will not show up on the threat indicator. Any monster with the 
"enemy" flag set for the player will show up.  Inspired by Ghost Recon.

Updated by Bill Catambay to make it its own function, establish a radar
range using 3D measurement, and supports arguments for danger distance
and range distance.   Also added an argument for ignore_poly (ignore all monsters
on this poly) and an argument for dividing the grid into hemispheres via an x-point.
When player is in one hemisphere, it ignores the other.
]]


function dist2(v1, v2)
    local d = (v1.x/1024-v2.x)*(v1.x/1024-v2.x);
    d = d + ( v1.y/1024-v2.y)*(v1.y/1024-v2.y);   
    return math.sqrt(d);
end

function dist3(v1, v2)
    local d = (v1.x/1024-v2.x)*(v1.x/1024-v2.x);
    d = d + ( v1.y/1024-v2.y)*(v1.y/1024-v2.y);   
    d = d + ( v1.z/1024-v2.z)*(v1.z/1024-v2.z);   
    return math.sqrt(d);
end

dangers = { tick_count = 20, tick = 0 };
danger_compass = false;
function idle_danger(dangerdist, range, ignore_poly, x_divide, display_stat)
    ignore_poly = ignore_poly or -1
    local hemis_check, divide_plane
    if x_divide then
        divide_plane = x_divide / 1024;
        hemis_check = true;
    else
        divide_plane = 1000;
        hemis_check = false;
    end
    dangers.tick = dangers.tick + 1;
    if (dangers.tick >= dangers.tick_count) then 
        dangers.tick = 0 ;
    end
    for p in Players() do
        if (p.dead) then
	        p.compass.lua = false; --[[ no compass if dead --]]
        else
	        p.compass.lua = true;--[[ enable compass if alive, then set it up: --]]
        	local face = p.yaw;  --[[ angle offset --]]
	        local mindist = 128;    --[[ well above the maximum possible distance in an A1 map --]]
	        local mcnt = 0;
	        for m in Monsters() do
	            --[[ 
	                NOTE: ignore friendlies and monsters on the opposite side of 
	                x = divide_plane also ignore monsters that are not visible
                ]]
                local type = m.type
                if m.valid and m.visible and 
                    (type.class ~= _class_player) and 
	                (type.class ~= _class_environment) and 
	                (type.enemies[_class_player]) then
                    mcnt = mcnt + 1;
                    local mx,my,mz = m.x/1024,m.y/1024,m.z/1024;
	                local d = dist3(m,p);
	                local dd = dist2(m,p);
	                in_hemisphere = (not hemis_check) or
			            ((mx < divide_plane) and (p.x < divide_plane)) or
			            ((mx > divide_plane) and (p.x > divide_plane));
	                in_range = (d < range) and (m.polygon.index ~= ignore_poly) and in_hemisphere;
		                
	                if (d < mindist) and (in_range) then 
		                mindist = d;
	                end
	                --[[
	                    NOTE: if we have one monster close enough to trigger danger
                        mode, we early-out as further information won`t change it 
	                --]]
	                if (mindist <= dangerdist) then 
		                break;
	                end
                    --         NOTE: Mis-ordering is intentional 
                    local ang = math.atan2(my-p.y,mx-p.x) * 180 / math.pi - face;
                    --         NOTE: normalize the angle 
                    while (ang < 0) do 
                        ang = ang + 360;
                    end
                    ang = math.fmod(ang, 360.0)
                    if ((ang < 100) or (ang > 350)) and in_range then 
                        p.compass.ne = true;
                    end
                    if (ang < 190) and (ang > 80) and in_range then 
                        p.compass.se = true;
                    end
                    if (ang < 280) and (ang > 170) and in_range then 
                        p.compass.sw = true;
                    end
                    if ((ang < 10) or (ang > 260)) and in_range then
                        p.compass.nw = true;
                    end
	            end
	         end
	        if display_stat then
	            local msg;
                if (mindist <= dangerdist) and in_range then
                    msg = '危険';
                    if (dangers.tick < dangers.tick_count / 2) then
                        p.overlays[0].color = "red";
                    else
                        p.overlays[0].color = "dark red";
                    end
                elseif (mindist <= range/2) and in_range then
                    msg = '接近';
                    p.overlays[0].color = "yellow";
                elseif in_range then
                    msg = '範囲内';
                    p.overlays[0].color = "white";
                elseif mcnt > 0 then
                    msg = '範囲外';
                    p.overlays[0].color = "cyan";
                else
                    msg = '敵無し';
                    p.overlays[0].color = "green";
                end
                p.overlays[0].text = '敵センサー: '.. msg;
                p.overlays[1].text = math.floor(mindist*100)/100;
            end
            if (mindist <= dangerdist) then  --[[ danger mode, flashing indicator--]]
                if (dangers.tick < dangers.tick_count / 2) then
                    p.compass:all_off();
                else
                    p.compass:all_on();
                end
            end
        end
    end
end

function new_monster_at(t, poly, face)
   local realpoly = Polygons[poly];
   local m = Monsters.new(realpoly.x, realpoly.y, 0, realpoly, t);
   if( face ) then
      m.yaw = face;
   end
end

function new_item_at(t, poly)
   local realpoly = Polygons[poly];
   return Items.new(realpoly.x, realpoly.y, 0, realpoly, t);
end

function Triggers.init(rs)	
    if master_init ~= nil then
        master_init(rs);
    end
    if common_init ~= nil then
        common_init(rs);
    end
    if ctf_init ~= nil then
        ctf_init(rs);
    end
    if level_init ~= nil then
        level_init(rs);
    end
end

function Triggers.idle()
    if master_idle ~= nil then
        master_idle();
    end
    if common_idle ~= nil then
    	common_idle()
    end
    if ctf_idle ~= nil then
    	ctf_idle();
    end
    if level_idle ~= nil then
        level_idle();
    end    
    for i, v in ipairs(logs) do
        Players.print(v)
    end
    logs = {}
end


