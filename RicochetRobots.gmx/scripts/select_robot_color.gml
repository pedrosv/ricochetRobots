///select_robot_color(robot, color)

var robot = argument0;
var color = argument1;

new_robot.color = color;

switch (color){
    case "red": 
        new_robot.image_index = 0;
        break;
    case "blue": 
        new_robot.image_index = 1;
        break;
    case "green":
        new_robot.image_index = 2;;
        break;
    case "yellow": 
        new_robot.image_index = 3;
        break;
    case "black":
        new_robot.image_index = 4;
        break;
}
