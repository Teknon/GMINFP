// Playersteuerung
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

//Berechnung der Bewegungsgeschwindigkeit und Bewegungsrichtung
var move = key_right - key_left //Keine Bewegung, wenn beide oder keine Taste gedrückt sind

hsp = move * walksp

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_Wall)) && (key_jump) //Check, ob unter Player eine Wand liegt
{
	vsp = -7;
}

//Kollisionscheck horizontal
if (place_meeting(x+hsp,y,obj_Wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_Wall))	//sign gibt 1 oder -1 aus; Check für wenn man sich Wand nähert
	{
		x = x + sign (hsp);
	}
	hsp = 0
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