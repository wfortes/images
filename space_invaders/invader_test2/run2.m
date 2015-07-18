% clear all
% invader_set = 3;%[1,3];
% 
% N_proj = 2;
% [dir_a,dir_b]=mkdirvecs(20);
% load line_sum_8_2
% line_sum82 = line_sum;
% load line_sum_8_3
% line_sum83 = line_sum;
% load line_sum_8_4
% line_sum84 = line_sum;
% 
% for invader = invader_set
%     if invader == 3
%         load half_invader3
%         P = double(half_invader3);
%         
%         [m,n] = size(P);
%         P = reshape(P,m*n,1);
%         M = mkmatrix(n,m,dir_a(1:N_proj),dir_b(1:N_proj));
%         Q = M*P;
%         
%         aux =1;
%         for Q1 = 1:size(line_sum83,1)
%             L1 = line_sum83(Q1,:);
%             for Q2 = 1:size(line_sum84,1)
%                 L2 = line_sum84(Q2,:);
%                 for Q3 = 1:size(imcomplement(line_sum83),1)
%                     L3 = imcomplement(line_sum83(Q3,:));
%                     for Q4 = 1:size(imcomplement(line_sum82),1)
%                         L4 = imcomplement(line_sum82(Q4,:));
%                         
%                         I = [L1' L2' L3' L4'];
%                         candidate = reshape(I,n*m,1);
%                         if norm(M*candidate-Q) == 0
%                             save(strcat('candidate_invader3-',num2str(aux),'.mat'),'I');
%                             aux = aux +1;
%                             
%                         end
%                     end
%                 end
%             end
%         end
%     end
% end

% unique(perms([0 1 1]), 'rows')
%%
% clear all
% N_proj = 3;
% [dir_a,dir_b]=mkdirvecs(20);
% load half_invader3
% P = double(half_invader3);
% [m,n] = size(P);
% P = reshape(P,n*m,1);
% M = mkmatrix(n,m,dir_a(1:N_proj),dir_b(1:N_proj));
% aux = 1;
% for i = 1:730
%     name = strcat('candidate_invader3-',num2str(i));
%     load(name)
%     candidate = reshape(I,n*m,1);
%     
%     if norm(M*(P-candidate))==0
%         save(strcat('half_invader3-proj3-',num2str(aux),'.mat'),'I');
%         aux = aux +1;
%     end
% end
%%
% % Recover invader 3
% name = 'half_invader3-proj4-1.mat';
% load(name) 
% [m,n] = size(I);
% 
% P = I;
% for i = 1:m
%     for j = 0:n-1
%         P(i,n+n-j) = I(i,j+1);  
%     end
% end
% save(name(6:end),'P');