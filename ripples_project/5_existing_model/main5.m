% main5
%% housekeeping
clear all; close all;

for i_fold = 1:5
    
    % loading dataset
    load(['./input/dataset' num2str(i_fold) '.mat'])
    load('./input/meanv1_13.mat')
    load('./input/stdv1_13.mat')
    dataset = ready_dataset;
    
    % holding va set
    val = dataset.validation;
    rv_val = val(:,1:13);
    
    % unscaling the validation set to use the formula
    meanM1_13 = zeros(size(rv_val))+meanv1_13;
    stdM1_13 = zeros(size(rv_val))+stdv1_13;
    rv_val_unscaled = rv_val.*stdM1_13+meanM1_13; 
    
    % useful quantity for the formula
    lambda = rv_val_unscaled(:,1);  %Ripple wavelength [m]                                  '                                 '
    U013 = rv_val_unscaled(:,2);  %1/3 Orbital velocity [m/s]
    Ab13 = rv_val_unscaled(:,4);  %1/3 Semi orbital excursion (Ab) [m/s]
    T = rv_val_unscaled(:,5);  %Wave period [s]
    d50 = rv_val_unscaled(:,6);  %Median grain diameter (D50) [m]
    omega = 2*pi./T;
    
    % useful adimensional quantities for the formula
    lambda_ad = lambda.*omega./U013;
    Ab13_ad = U013./omega./d50;
    
    % MSE on the i_fold val set with two models
    mse_1_formula(i_fold) = immse(lambda,SingolPredictor(Ab13_ad,[1 1.87/1000 2/10000 1.5]).*U013./omega);      % John Wiley and Sons (1984)
    mse_2_formula(i_fold) = immse(lambda,SingolPredictor(Ab13_ad,[0.72 2/1000 1.57/10000 1.15]).*U013./omega);  % Nelson, Voulgaris and Traykovski (2013)
end


averaged_mse_1  = mean(mse_1_formula);
averaged_mse_2  = mean(mse_2_formula);

disp('-------------------------------------------------------------------')
disp(['averaged over S MSE with Wiley'' model (1984) = ' num2str(averaged_mse_1)])
disp(['averaged over S MSE with Nelson''model (2013) = ' num2str(averaged_mse_2)])
disp('-------------------------------------------------------------------')

%save('./output/mse_formula.mat','mse_formula')
dlmwrite('./output/mean_mse.txt',[mean(mse_1_formula); averaged_mse_2])


