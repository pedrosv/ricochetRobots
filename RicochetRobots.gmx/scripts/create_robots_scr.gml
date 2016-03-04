///create_robots_scr(grid)

var grid = argument0;
var color = argument1;

while true{

    //get a random area
    var index_x = irandom_range(0, 15);
    var index_y = irandom_range(0, 15);
    var ground = ds_grid_get(grid, index_x, index_y);
    
    //discard if is in the middle area
    if( (index_x == 7 or index_x ==8) and (index_y == 7 or index_y == 8) ){
        //debug
        show_debug_message(string(index_x) + "," + string(index_y));
        show_debug_message("invalid position");
    }
    else{
        //discard places already have robot
        if(ground.robot == noone){
            new_robot = instance_create(ground.x, ground.y, obj_robot)
            new_robot.position_x = index_x;
            new_robot.position_y = index_y;
            select_robot_color(new_robot, color);
        
            ground.robot = new_robot;
            return new_robot;
        }
    }
    
    //debug
    show_debug_message("position em uso");
}
