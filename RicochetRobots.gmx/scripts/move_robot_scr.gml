///move_robot_scr(selected_robot, move_direction, grid);

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
        with(selected_robot){
            move_contact_solid(90, -1);
        }
        break;
    case "down": 
        final_x = selected_robot.x;
        final_y = far_south;
        with(selected_robot){
            move_contact_solid(270, -1);
        }
        break;
    case "right":
        final_x = far_east;
        final_y = selected_robot.y;
        with(selected_robot){
            move_contact_solid(0, -1);
        }
        break;
    case "left": 
        final_x = far_west;
        final_y = selected_robot.y;
        
        with(selected_robot){
            move_contact_solid(180, -1);
        }     
        break;
}

with(selected_robot){
   move_snap( 40, 40 );
}



