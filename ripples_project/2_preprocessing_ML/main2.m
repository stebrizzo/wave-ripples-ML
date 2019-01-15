% main2

%% housekeeping
clear all; close all;

%% loading dataset
load('./input/dataset.mat','DATA');
dataset = DATA;
clear DATA

%% NaN percentage for each feature and replaceing with mean ad mode


% % plot frequency of missing features
% for i = 1:size(dataset,2)   
%     p(i) = sum(isnan(dataset(:,i)))/size(dataset,1);
% end
% 
% figure(100)
% bar(1:size(dataset,2),p);
% ylim([0 1])
% xticks(1:size(dataset,2))
% xlabel('features'); ylabel('f [-]')

dataset = missing_meanmode_replacer(dataset,1:15,16:18);

%% maintaining only meaningful fetures
% rimuovo sia le higly missing fetures che quelle che non hanno senso
dataset = dataset(:,[2 4:15 17 18]);

%% one-hot encoding of experimental apparatus feture
exp_app = dataset(:,14);
exp_app_encoded = one_hot_encoder(exp_app);
clear exp_app

%% correction of wave type feature
% it was regulare = 1 irregular = 2 and I want -1 1
wave_type = dataset(:,15);
wave_type(wave_type ==1) = -1;
wave_type(wave_type ==2) = +1;

%% dataset correction
dataset(:,[14 15]) = [];
dataset = [dataset exp_app_encoded wave_type];
clear exp_app_encoded wave_type

%% put at 0 mean and 1 std
real_value_dataset = dataset(:,1:13);
[real_value_normalized_dataset meanv1_13 stdv1_13] = normalizer(real_value_dataset);
dataset(:,1:13) = real_value_normalized_dataset;
clear real_value_normalized_dataset real_value_dataset

%% some meaningful plot
% % considering my argument knoledge...
features_name = {'\lambda' '1/3 Orbital Velocity ' '1/3 Orbital Excursion ' '1/3 Semi-Orbital Excursion' 'T' 'D_{50}' 's' 'Temperature' '\nu ' '\nu_d' '\rho_w ' 'PSU' 'h' '0 flume' '1 channel' '2 piston' '3 osc' '4 field' '5 tunnel' '6 tank' '7 basin' '8 duct' 'regular/irregular'};
% 
% % frequency for exp type plot
% exp_type_col = 14:22;
% f_type = sum(dataset(:,exp_type_col),1)/size(dataset,1);
% figure(200)
% bar(exp_type_col,f_type);
% ylim([0 1])
% xticks(exp_type_col)
% xticklabels(features_name(exp_type_col))
% xtickangle(-45)
% ylabel('f [-]')
% 
% % one vs all scatters
% for j = 2:13
%     figure(j)
%     i = 1;
%     R = corrcoef(dataset(:,i),dataset(:,j));
%     %histogram2(dataset(:,i),dataset(:,j),'FaceColor','Flat')
%     %c = colorbar;
%     %c.Location = 'east';
%     %view(2)
%     scatter(dataset(:,i),dataset(:,j),'.b')
%     grid off
%     xlabel(features_name(i)); ylabel(features_name(j));
%     title(['correlation coefficient = ' num2str(R(1,2))])
% end
% 

%% saving
save('./output/ready_dataset.mat','dataset')
save('./output/meanv1_13.mat','meanv1_13')
save('./output/stdv1_13.mat','stdv1_13')
dlmwrite('./output/features_name.txt',features_name,'')





