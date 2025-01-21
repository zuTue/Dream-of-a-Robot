 if (follow != noone)
{
    x = follow.x 
    y = follow.y 
} 

x += (x_to - x)/25;
y += (y_to - y)/25;

camera_set_view_pos(view_camera[0],x-(cam_width*0.5),y-(cam_height*0.5));