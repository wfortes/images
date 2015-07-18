% clear all
% invader_set = 1;%[1,3];
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
%     if invader == 1
%         load half_invader1
%         P = double(half_invader1);
%         
%         [m,n] = size(P);
%         P = reshape(P,m*n,1);
%         M = mkmatrix(n,m,dir_a(1:N_proj),dir_b(1:N_proj));
%         Q = M*P;
%         
%         aux =1;
%         for Q1 = 1:size(line_sum83,1)
%             L1 = line_sum83(Q1,:);
%             for Q2 = 1:size(line_sum82,1)
%                 L2 = line_sum82(Q2,:);
%                 for Q3 = 1:size(imcomplement(line_sum82),1)
%                     L3 = imcomplement(line_sum82(Q3,:));
%                     for Q4 = 1:size(imcomplement(line_sum83),1)
%                         L4 = imcomplement(line_sum83(Q4,:));
%                         for Q5 = 1:size(imcomplement(line_sum83),1)
%                             L5 = imcomplement(line_sum83(Q5,:));
%                             I = [L1' L2' L3' L4' L5'];
%                             candidate = reshape(I,n*m,1);
%                             if M*candidate==Q
%                                 save(strcat('candidate_invader1-',num2str(aux),'.mat'),'I');
%                                 aux = aux +1;
%                                 
%                             end
%                         end
%                     end
%                 end
%             end
%         end
%     elseif invader == 2
%         load invader2
%     elseif invader == 3
%         load invader3
%         P = double(invader3);
%     end
% end

% unique(perms([0 1 1]), 'rows')
% %%
% clear all
% N_proj = 4;
% [dir_a,dir_b]=mkdirvecs(20);
% load half_invader1
% P = double(half_invader1);
% [m,n] = size(P);
% P = reshape(P,n*m,1);
% M = mkmatrix(n,m,dir_a(1:N_proj),dir_b(1:N_proj));
% aux = 1;
% for i = 1:1176
%     name = strcat('candidate_invader1-',num2str(i));
%     load(name)
%     candidate = reshape(I,n*m,1);
%     
%     if norm(M*(P-candidate))==0
%         save(strcat('half_invader1-proj4-',num2str(aux),'.mat'),'I');
%         aux = aux +1;
%     end
% end
%%
% Recover invader 1

clear all
N_proj = 4;
[dir_a,dir_b]=mkdirvecs(20);
load invader1
invader = double(invader1);
[m1,n1] = size(invader);
invader = reshape(invader,n1*m1,1);
M = mkmatrix(n1,m1,dir_a(1:N_proj),dir_b(1:N_proj));

aux = 1;
for k = 1:1176
% name = 'half_invader1-proj4-1.mat';
name = strcat('candidate_invader1-',num2str(k));
load(name) 
[m,n] = size(I);

for i = 3:6
    I(i,n+1) = 1; 
end
n = n+1;

P = I;
for i = 1:m
    for j = 0:n-2
        P(i,n+n-1-j) = I(i,j+1);        
    end
end
save(name,'P')
% candidate = reshape(P,n1*m1,1);
% if norm(M*(candidate-invader))==0
% % save(name(6:end),'P');
% % save(strcat(name(11:end),'-proj4-',num2str(aux)),'P');
% aux = aux+1;
% end
end