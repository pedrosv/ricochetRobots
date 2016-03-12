///create_grid_scr(grid, x_start, y_start)

var grid = argument0;
var x_start = argument1;
var y_start = argument2;

var space_size = 40;

for (var i = 0; i < ds_grid_width(grid); i += 1){
    for (var j = 0; j < ds_grid_height(grid); j += 1){
    
        if((i == 7 or i ==8) and (j == 7 or j == 8)){
            //dont create spaces on the midle
        }
        else {
            //position on screen
            var position_x = x_start + (space_size * i);
            var position_y = y_start + (space_size * j);
            
            //create instance
            var new_space = instance_create(position_x, position_y, obj_ground);
            
            //add to grid
            ds_grid_set(grid, i, j, new_space);
            new_space.index_x = i;
            new_space.index_y = j;
        }
    }
}   
