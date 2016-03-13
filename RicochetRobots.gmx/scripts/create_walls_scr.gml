///create_walls_scr(grid, walls)

var grid = argument0;
var walls = argument1;

//offset to create walls in the end of the ground
var offset = sprite_get_height(spr_ground); 

//get a random int to choose a random map
var first_quadrant  = irandom_range(0,3);
var second_quadrant = irandom_range(0,3);
var third_quadrant  = irandom_range(0,3);
var fourth_quadrant = irandom_range(0,3);

//each list bellow represents a different walls configuration for 1 quadrant of the map
//each quadrant can have 4 different configuration and that makes possible 

//first quadrant
var r1 = ds_list_create();
ds_list_add(r1, "05h", "16h", "16v", "24h", "34v", "40v", "53h", "62v", "75v", "76h");
var r2 = ds_list_create();
ds_list_add(r2,"06h", "11v", "12h", "25h", "34v", "30v", "62h", "72v", "75h", "75v");
var r3 = ds_list_create();
ds_list_add(r3,"13v", "14h", "20v", "37h", "41h", "46v", "51v", "55h", "55v");
var r4 = ds_list_create();
ds_list_add(r4,"24h", "34v", "35h", "50v", "56h", "56v", "63h", "72v");

//second quadrant
var b1 = ds_list_create();
ds_list_add(b1, "13h", "22v", "36h", "40v", "46v", "51h", "51v", "65v", "66h", "74h");
var b2 = ds_list_create();
ds_list_add(b2, "11v", "12h", "25h", "30v", "34v", "46h", "46v", "62h", "72v", "75h");
var b3 = ds_list_create();
ds_list_add(b3, "24v", "25h", "33h", "40v", "42v", "45h", "45v", "53h", "63v", "76h");
var b4 = ds_list_create();
ds_list_add(b4, "05h", "10v", "14v", "21h", "21v", "55v", "56h", "66v", "73h");

//third quadrant
var g1 = ds_list_create();
ds_list_add(g1, "06h", "13v", "14h", "26h", "26v", "31h", "41v", "65h", "67v", "74v");
var g2 = ds_list_create();
ds_list_add(g2, "03h", "11h", "21v", "26v", "27h", "51h", "51v", "65h", "67v", "74v");
var g3 = ds_list_create();
ds_list_add(g3, "06h", "14v", "15h", "31h", "41v", "47h", "56v", "63h", "63v", "77v");
var g4 = ds_list_create();
ds_list_add(g4, "02h", "36v", "37h", "41h", "51v", "65h", "65v", "67v", "74v");

//fourth quadrante
var y1 = ds_list_create();
ds_list_add(y1, "14h", "21v", "22h", "23v", "37v", "40h", "40v", "56h", "56v", "64h", "73h", "74v");
var y2 = ds_list_create();
ds_list_add(y2, "02h", "02v", "16h", "24h", "26v", "33v", "47v", "52h", "52v", "64v", "65h", "71h");
var y3 = ds_list_create();
ds_list_add(y3, "05h", "05v", "13h" , "22v", "26h", "36v", "43h", "43v", "57v", "61v", "62h", "74h");
var y4 = ds_list_create();
ds_list_add(y4, "16h", "20h", "20v" , "25v", "37v", "44h", "54v", "55h", "62h", "62v", "71h");

//list with all lists
var all_lists = ds_list_create();
ds_list_add(all_lists, r1,r2,r3,r4);
ds_list_add(all_lists, b1,b2,b3,b4);
ds_list_add(all_lists, g1,g2,g3,g4);
ds_list_add(all_lists, y1,y2,y3,y4);

//walls on the midle
var middle_walls = ds_list_create();
ds_list_add(middle_walls, "74h","74v","84h","94v","75v","76h","86h","95v");

//list with the 4 choosed maps and midle walls
var walls_map = ds_list_create();
ds_list_add(walls_map, ds_list_find_value(all_lists, first_quadrant),
                       ds_list_find_value(all_lists, second_quadrant + 4),
                       ds_list_find_value(all_lists, third_quadrant  + 8),
                       ds_list_find_value(all_lists, fourth_quadrant + 12),
                       middle_walls);

                       
//for each quadrant get the list choosed and get each element and create a corresponding wall
for(var j = 0; j< ds_list_size(walls_map); j++){
    
    //list of walls to be created
    var lw = ds_list_find_value(walls_map, j);
    
    for (var i = 0; i < ds_list_size(lw); i += 1){
        var str_informations = ds_list_find_value(lw, i);
        var wall_direction = string_char_at(str_informations, 3);
        
        var position_on_grid_x = real(string_char_at(str_informations, 1));
        var position_on_grid_y = real(string_char_at(str_informations, 2));
        
        //add offset x to 2 and 4 quadrant
        if(j == 1 or j == 3){
            position_on_grid_x += 8;
        }
        //add offset y to 3 and 4 quadrant
        if(j == 2 or j == 3){
            position_on_grid_y += 8;
        }
        
        var position_x = ds_grid_get(grid, position_on_grid_x, position_on_grid_y).x;
        var position_y = ds_grid_get(grid, position_on_grid_x, position_on_grid_y).y;
        
        
        //gambiarra. How there isnt a ground in the midle inst possible get x or y
        //so I create the walls 3 spaces above and now Im adjusting
        if(j == 4){
            position_y += 3 * offset;
        }
        
        var new_wall = instance_create(position_x, position_y, obj_wall);
        if(wall_direction == "h"){
            new_wall.image_angle = 90;
        }
        ds_list_add(walls, new_wall);
    }
}

//now create the default walls

//create externs walls
for(var i = 0; i < 16; i ++){

    // top
    var position_top_x = ds_grid_get(grid, i, 0).x;
    var position_top_y = ds_grid_get(grid, i, 0).y;
    var new_wall_top = instance_create(position_top_x, position_top_y, obj_wall);
    new_wall_top.image_angle = 90;
    ds_list_add(walls, new_wall_top);
    
    //bottom
    var position_bot_x = ds_grid_get(grid, i, 15).x;
    var position_bot_y = ds_grid_get(grid, i, 15).y + offset;
    var new_wall_bot = instance_create(position_bot_x, position_bot_y, obj_wall);
    new_wall_bot.image_angle = 90;
    ds_list_add(walls, new_wall_bot);
    
    //left
    var position_left_x = ds_grid_get(grid, 0, i).x;
    var position_left_y = ds_grid_get(grid, 0, i).y;
    var new_wall_left = instance_create(position_left_x, position_left_y, obj_wall);
    ds_list_add(walls, new_wall_left);
    
    //right
    var position_right_x = ds_grid_get(grid, 15, i).x + offset;
    var position_right_y = ds_grid_get(grid, 15, i).y;
    var new_wall_right = instance_create(position_right_x, position_right_y, obj_wall);
    ds_list_add(walls, new_wall_right);
}


//clean memory
ds_list_destroy(r1);
ds_list_destroy(r2);
ds_list_destroy(r3);
ds_list_destroy(r4);
ds_list_destroy(b1);
ds_list_destroy(b2);
ds_list_destroy(b3);
ds_list_destroy(b4);
ds_list_destroy(g1);
ds_list_destroy(g2);
ds_list_destroy(g3);
ds_list_destroy(g4);
ds_list_destroy(y1);
ds_list_destroy(y2);
ds_list_destroy(y3);
ds_list_destroy(y4);
ds_list_destroy(all_lists);
ds_list_destroy(walls_map);
ds_list_destroy(middle_walls);
