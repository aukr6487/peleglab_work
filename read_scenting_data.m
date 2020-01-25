function read_scenting_data()
close all;
set(0,'Defaultlinelinewidth',5, 'DefaultlineMarkerSize',6,...
    'DefaultTextFontSize',5, 'DefaultAxesFontSize',18);
dbstop if error

positions_dataset = readmatrix('./positionData/2018-08-29_NoQueen_Low_crop_2sec.mp4.csv');
scenting_dataset = readmatrix('./scentingData/finalized_data.csv');

 %screensize = get( 0, 'Screensize' );

  end_frame = 1;

 fig = figure('units','normalized','outerposition',[0 0 1 1]);

 ax = gca;
 ax.NextPlot = 'replaceChildren';
 clear F
 F(end_frame) = struct('cdata',[],'colormap',[]);

  for frame_i=1:end_frame

      picture_frame = imread(['./frames/frame-',num2str(frame_i,'%04d'),'.png']);
      picture_frame = rgb2gray(picture_frame);

      pixel_y_array = 1:length(picture_frame(1,:));
      pixel_x_array = 1:length(picture_frame(:,1))

      imshow(picture_frame); hold on;

      for row_i=1:length(picture_frame(:,1))
          curr_row = picture_frame(row_i,:);
          new_white = mean(maxk(curr_row,20));
          new_black = mean(mink(curr_row,900));
          curr_row(find(curr_row>new_black))=255;
          picture_frame(row_i,:) = curr_row;
      end


  %     for col_i=1:length(picture_frame(1,:))
  %         curr_col = picture_frame(:,col_i);
%  %         new_black = mean(mink(curr_col,500));
%  %         curr_col(find(curr_col>=new_black))=255;
%  %         picture_frame(:,col_i) = curr_col;
%  %     end
%
    %   picture_frame = insertText(picture_frame,[0,0],['time = ',num2str(frame_i*2),' sec'],'TextColor','black','FontSize',50);

      subplot(1,2,1);
      imshow(picture_frame); hold on;


      current_bee_position_indexes = find(positions_dataset(:,1)==frame_i);
      current_bee_position_x = positions_dataset(current_bee_position_indexes,3);
      current_bee_position_y = positions_dataset(current_bee_position_indexes,2);


     %current_scenting_position_indexes = ...
     %    find(scenting_dataset(:,5)>=frame_i & scenting_dataset(:,6)<=frame_i);

     current_scenting_position_indexes = ...
         find(frame_i+1>=scenting_dataset(:,5) & frame_i+1<=scenting_dataset(:,6));

     current_scenting_position_head_x = scenting_dataset(current_scenting_position_indexes,1);
     current_scenting_position_head_y = scenting_dataset(current_scenting_position_indexes,2);
     current_scenting_position_tail_x = scenting_dataset(current_scenting_position_indexes,3);
     current_scenting_position_tail_y = scenting_dataset(current_scenting_position_indexes,4);


     scatter(current_bee_position_x,current_bee_position_y,50,'MarkerFaceColor',[0 .7 .7]);
     hold on;
     grad_x=zeros(length(pixel_x_array),length(pixel_y_array))
     grad_y=zeros(length(pixel_x_array),length(pixel_y_array));

     for current_scenting_position_i=1:length(current_scenting_position_indexes)
         x1 = current_scenting_position_head_x(current_scenting_position_i);
         y1 = current_scenting_position_head_y(current_scenting_position_i);
         x2 = current_scenting_position_tail_x(current_scenting_position_i);
         y2 = current_scenting_position_tail_y(current_scenting_position_i);

         center_x = mean([x1,x2]); center_y = mean([y1,y2]);

         grad_index_x = ceil(center_y);
         grad_index_y = ceil(center_x);

         grad_x(grad_index_x,grad_index_y) =  x1-x2;
         grad_y(grad_index_x,grad_index_y) =  y1-y2;


         dist_array = sqrt((current_bee_position_x-center_x).^2 + (current_bee_position_y-center_y).^2);
         bee_i = find(dist_array==min(dist_array));
         disp(min(dist_array))

         curr_length = 0.5*sqrt((x1-x2)^2+(y1-y2)^2);
         curr_orientation = positions_dataset(bee_i,8);
         vectarrow([x1,y1],[x2,y2]); hold on;
         axis square;
     end
  end


%
%      hold off;
%      pause(1);
%
%      fhat = intgrad2(100.*grad_x,100.*grad_y,1,1,1);
%      subplot(1,2,2); imagesc(((fhat))); axis equal; axis tight; caxis([-50 50]); axis off;
%
%
%      F(frame_i) = getframe(fig);
%
%  end
%
%  movie_name = 'test';
%  v = VideoWriter([movie_name,'.mp4'],'MPEG-4');
%  open(v);
%  writeVideo(v,F);
%  close(v);
%
% end
%
%
%  function vectarrow(p0,p1)
%  %Arrowline 3-D vector plot.
%  %   vectarrow(p0,p1) plots a line vector with arrow pointing from point p0
%  %   to point p1. The function can plot both 2D and 3D vector with arrow
%  %   depending on the dimension of the input
%  %
%  %   Example:
%  %       3D vector
%  %       p0 = [1 2 3];   % Coordinate of the first point p0
%  %       p1 = [4 5 6];   % Coordinate of the second point p1
%  %       vectarrow(p0,p1)
%  %
%  %       2D vector
%  %       p0 = [1 2];     % Coordinate of the first point p0
%  %       p1 = [4 5];     % Coordinate of the second point p1
%  %       vectarrow(p0,p1)
%  %
%  %   See also Vectline
%  %   Rentian Xiong 4-18-05
%  %   $Revision: 1.0
%    if max(size(p0))==3
%        if max(size(p1))==3
%            x0 = p0(1);
%           y0 = p0(2);
%           z0 = p0(3);
%           x1 = p1(1);
%           y1 = p1(2);
%           z1 = p1(3);
%           plot3([x0;x1],[y0;y1],[z0;z1]);   % Draw a line between p0 and p1
%
%           p = p1-p0;
%           alpha = 0.1;  % Size of arrow head relative to the length of the vector
%           beta = 0.1;  % Width of the base of the arrow head relative to the length
%
%           hu = [x1-alpha*(p(1)+beta*(p(2)+eps)); x1; x1-alpha*(p(1)-beta*(p(2)+eps))];
%           hv = [y1-alpha*(p(2)-beta*(p(1)+eps)); y1; y1-alpha*(p(2)+beta*(p(1)+eps))];
%           hw = [z1-alpha*p(3);z1;z1-alpha*p(3)];
%
%           hold on
%           plot3(hu(:),hv(:),hw(:))  % Plot arrow head
%           grid on
%           xlabel('x')
%           ylabel('y')
%           zlabel('z')
%           hold off
%       else
%           error('p0 and p1 must have the same dimension')
%       end
%   elseif max(size(p0))==2
%       if max(size(p1))==2
%           x0 = p0(1);
%           y0 = p0(2);
%           x1 = p1(1);
%           y1 = p1(2);
%           plot([x0;x1],[y0;y1],'r');   % Draw a line between p0 and p1
%
%           p = p1-p0;
%           alpha = 0.5;  % Size of arrow head relative to the length of the vector
%           beta = 0.7;  % Width of the base of the arrow head relative to the length
%
%           hu = [x1-alpha*(p(1)+beta*(p(2)+eps)); x1; x1-alpha*(p(1)-beta*(p(2)+eps))];
%           hv = [y1-alpha*(p(2)-beta*(p(1)+eps)); y1; y1-alpha*(p(2)+beta*(p(1)+eps))];
%
%           hold on
%           plot(hu(:),hv(:),'r')  % Plot arrow head
%           grid on
%           xlabel('x')
%           ylabel('y')
%           hold off
%       else
%           error('p0 and p1 must have the same dimension')
%       end
%   else
%       error('this function only accepts 2D or 3D vector')
%   end
end
