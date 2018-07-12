vsp = vsp + grv;

//Nicht über Kanten laufen
if (amBoden) && (Kante) && (!place_meeting(x+hsp,y+1,obj_Wall))
{
	hsp = -hsp;

}

//Gegner chased Player
if distance_to_object(obj_player)<=50{    
	grid=mp_grid_create(0,0,room_width/32,room_height/32,32,32);
	path=path_add();
	mp_grid_add_instances(path,obj_Wall,true);
	mp_grid_path(grid,path,x,y,obj_player.x,obj_player.y,true);
	path_start(path,3,"",true);
      /*if (collision_line(x,y,obj_player.x,obj_player.y,obj_Wall,true,true) = noone) {
           direction=point_direction(x,y,obj_player.x,obj_player.y);
           speed= 1;
    }*/
}

//Kollisionscheck horizontal
if (place_meeting(x+hsp,y,obj_Wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_Wall))	//sign gibt 1 oder -1 aus; Check für wenn man sich Wand nähert
	{
		x = x + sign (hsp);
	}
	hsp = -hsp;
}

x = x + hsp;

//Kollisionscheck vertikal
if (place_meeting(x,y+vsp,obj_Wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_Wall))
	{
		y = y + sign (vsp);
	}
	vsp = 0;
}

y = y + vsp;

//Check, ob man am Boden ist
if (!place_meeting(x,y+1,obj_Wall))
{
	amBoden = false	
}
else
{
	amBoden = true
}

