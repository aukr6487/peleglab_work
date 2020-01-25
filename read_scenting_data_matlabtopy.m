// Reading scenting data
// Close all figures
// set default line width to 5, default line marker size to 6
// default text font size to 5 and default axes font size to 18
// Causes a stop in any function causing a run-time error. Can't resume execution

// positions_dataset = matix of data read from the position data csv
// scenting_dataset = matrix of data read from the scenting data csv

//

// end_frame = 10 (the number of frames that will be created or read??)

// creates a figure called fig and enlarges it to fit the full computer screen

// returns the current axes for the current figure
// Removes all axes child objects whose handles are not hidden before adding new graphics objects. Does not reset axes properties
// clears all the current (variable, fxns, etc) F
// F(10) is a struct fields cdata [] and colormap []

// for loop starting at frame_i = 1 until the end_frame value 10

//      picture_frame = read image from a graphics file. Not in current folder, converts the numbers to a character array (with 4 decimals??) in png format
//      picture_frame = grayscale version of picture_frame ... reads and displays the image and converts it to grayscale

//      pixel_y_array = counter from 1 to the length of the 1st row of picture_frame
//      pixel_x_array = counter from 1 to the length of the 1st column of picture_frame

//
//      NOT REALLY SURE WHAT THIS LOOP DOES
//      for loop: row_i starts at 1 and counts to the length of 1st column of picture_frame
//            curr_row = row_i of picture_frame (where row_i starts at 1 and counts to the length of the 1st column of picture_frame)
//
//            new_black = returns the mean of the 900 smallest elements of curr_row
//            find(curr_row>new_black) returns a vector containing the linear indices of each nonzero element where curr_row is greater than new_black. curr_row(these indices) is set to 255
//            the row_ith row of picture_frame (where row_i counts from 1 to the length of the 1st column of picture_frame) is set to the curr_row value
//      end the nested for loop
//
//      %
//
//
//
//
//
//
//
//
//      the current figure is divided into a 1-by-2 grid and axes are created in the 1st position
//      displays the grayscale image picure_frame in the current figure; retain current figure
//
//
//      current_bee_position_indexes = the vector containing the linear indices of each nonzero element where the 1st column of positions_dataset is equal to the frame_i counter
//      current_bee_position_x = the value in the current_bee_position_indexes to 3 decimal points
//      current_bee_position_y = the value in the current_bee_position_indexes row to 2 decimal points
//
//      %
//      %
//
//      the current_scenting_position_indexes =
//      the vector containing the linear indices of each non_zero element where frame_i+1 is greater than or equal to the 5th column of scenting_dataset AND frame_i+1 is less than or equal to the 6th column of scenting_dataset
//      ??? ^^ IS THIS A VECTOR OR SCALAR?
//      These are finding the head and tail positions of the bees, but I'm not really sure how exaclty





//      creates a scatter plot of the current_bee_position x and y, of size 50 with marker color specified by [0 .7 .7], Puts dots on all of the current positions of the bees found (non clusters)
//      hold on

//      grad_x is a matrix of zeros with the length of the pixel_x_array amount of rows and the length of the pixel y array of columns
//      grad_y is the same matrix as above

//      for loop where current_scenting_position_i starts at 1 and loops to the length of the current_scenting_posisont_indices (MATRIX, VECTOR?)
//          This for loop counts through all of the scenting positions and finds the two head points and the two tail points.
//          x1 = head x, y1 = head y
//          x2 = tail x, y2 = tail y


//          center_x = the center of the x coordinates of head and tail and center_y is the center the y coordinates of head and tail (calulating the centroid of the bee?)

//          grad_index_x = an estimate of the centroid from x coordinates (rounding to the nearest integer)
//          grad_index_y = an estimate of the centroid from y coordinates (rounding to the nearest integer)

//          grad_x(x centroid, y centroid) = head x - tail x
//          grad_y(x centroid, y centroid) = head y - tail y


//          dist_array = ... some sort of hypotenuse of the position??
//          bee_i = a vecctor of all the nonzero inndices where the dist_array is at a minimum
//          the curr_length = 0.5 of the hypotenuse?? of the x and y length of the bee (calulating some sort of center or length)
//          curr_orientation = the current bee row and 8th column of the positions_dataset??

//          points a vector arrow from head x,y to tail x,y on the bee
//          use axis lines with equal lengths
//      end the for loop

//      done plotting
//      pausing for loading probably

//      this is where the gradient plot is made! I'm not sure how
//


//      This is the first frame figure of the scatter plot of bees and the gradient plot

//

// movie_name
// v = makes a video of the frames
// open the video
// write F data to Video
// close and save?
//end
// the rest is the vectarrow function that creates the arrow on the bees 
