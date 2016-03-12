///move_robot_scr(selected_robot, move_direction);

var selected_robot = argument0;
var move_direction = argument1;
var grid = argument2;


//position
var far_north = ds_grid_get(grid,0,0).y;
var far_south = ds_grid_get(grid,15,15).y;
var far_east  = ds_grid_get(grid,15,15).x;
var far_west  = ds_grid_get(grid,0,0).x;

var final_x = selected_robot.x;
var final_y = selected_robot.y;

switch (move_direction){
    case "up": 
        final_x = selected_robot.x;
        final_y = far_north;
        break;
    case "down": 
        final_x = selected_robot.x;
        final_y = far_south;
        break;
    case "right":
        final_x = far_east;
        final_y = selected_robot.y;
        break;
    case "left": 
        final_x = far_west;
        final_y = selected_robot.y;        
        break;
}

with(selected_robot){
    x = final_x;
    y = final_y;
}



