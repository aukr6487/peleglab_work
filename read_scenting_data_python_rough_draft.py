#!/usr/bin/env python3

# Importing csvs using numpy package
import csv
with open("./scentingData/finalized_data.csv", 'r') as f:
    scenting_dataset = list(csv.reader(f, delimiter=","))
import numpy as np

#scenting_dataset_head_x = np.array(scenting_dataset[1:])
#scenting_dataset_head_y = np.array(scenting_dataset[2:])

import csv
with open("./positionData/2018-08-29_NoQueen_Low_crop_2sec.mp4.csv", 'r') as f:
    positions_dataset = list(csv.reader(f, delimiter=","))
#import numpy as np

# importing matplotlib modules
import matplotlib.image as mpimg
import matplotlib.pyplot as plt

# Read Image
picture_frame = mpimg.imread('./frames/frame-0001.png')

pixel_y_array = np.arange(1,1851)
pixel_x_array = np.arange(1,1871)

# Define rgb2gray
def rgb2gray(rgb):
    return np.dot(rgb[...,:3], [0.2989, 0.5870, 0.1140])

# Output Grayscale Image
plt.imshow(picture_frame)
gray = rgb2gray(picture_frame)
plt.imshow(gray, cmap=plt.get_cmap('gray'), vmin=0, vmax=1)

# The for loop that makes everything darker. . .

#current_bee_position_indexes = np.linspace(1,214,214)
positions_dataset = np.array(positions_dataset)
current_bee_position_x = [0] * 214
current_bee_position_y = [0] * 214
for i in range(1, 214):
    current_bee_position_x[i] = positions_dataset[i, 2]
    current_bee_position_y[i] = positions_dataset[i, 1]

scenting_dataset = np.array(scenting_dataset)
current_scenting_position_head_x = [0] * 16
current_scenting_position_head_y = [0] * 16
current_scenting_position_tail_x = [0] * 16
current_scenting_position_tail_y = [0] * 16
for i in range(1, 16):
    current_scenting_position_head_x[i] = scenting_dataset[i,0]
    current_scenting_position_head_y[i] = scenting_dataset[i,1]
    current_scenting_position_tail_x[i] = scenting_dataset[i,2]
    current_scenting_position_tail_y[i] = scenting_dataset[i,3]

plt.scatter(current_bee_position_x,current_bee_position_y,50)
plt.show()

s = (1849, 1869)
grad_x = np.zeros(s)
grad_y = np.zeros(s)

for i in range(1, 16):
    x1 = current_scenting_position_head_x[i].astype(np.float)
    y1 = current_scenting_position_head_y[i].astype(np.float)
    x2 = current_scenting_position_tail_x[i].astype(np.float)
    y2 = current_scenting_position_tail_y[i].astype(np.float)

    a = [x1, x2]
    center_x = np.mean(a)
    b = [y1, y2]
    center_y = np.mean(b)

    import math
    grad_index_x = math.ceil(center_x)
    grad_index_y = math.ceil(center_y)


    x = current_bee_position_x[i].astype(np.float)
    y = current_bee_position_y[i].astype(np.float)

    dist_array = math.sqrt(((x-center_x)**2) + ((y-center_y)**2))
    # not an array anymore 
    print(dist_array)
    ##IS THIS RIGHT?? ^^

    curr_length = 0.5*math.sqrt((x1-x2)**2 + (y1-y2)**2)
    curr_orientation = positions_dataset[bee_i, 7]
    plt.figure()
    plt.quiver([x1, y1], x2, y2)
    plt.show()


# intgrad2 function
# plt.subplots(1, 2)
# imagesc
