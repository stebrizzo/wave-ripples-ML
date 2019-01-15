% main4

%% housekeeping
clear all; close all;

%% parameters to set
sigmav = linspace(0.2,3,15);
lambdav = 10.^(-linspace(1,6,6));

%% training the model and calculating MSE for each of the 5 folds
for i_fold = 1:5;
    
    disp(['---> fold: ' num2str(i_fold)])
    
    load(['./input/dataset' num2str(i_fold) '.mat']);
    load('./input/meanv1_13.mat');
    load('./input/stdv1_13.mat');
    
    dataset = ready_dataset;
    training_set = dataset.train;
    test_set = dataset.test;
    validation_set = dataset.validation;
    
    % unscaling the quantity to be predicted
    training_set(:,1) = training_set(:,1)*stdv1_13(1)+meanv1_13(1);
    test_set(:,1) = test_set(:,1)*stdv1_13(1)+meanv1_13(1);
    validation_set(:,1) = validation_set(:,1)*stdv1_13(1)+meanv1_13(1);
    
    Xtr = training_set(:,2:end);
    Ytr = training_set(:,1);
    Xts = test_set(:,2:end);
    Yts = test_set(:,1);
    Xval = validation_set(:,2:end);
    Yval = validation_set(:,1);
    
    [best_lambda best_sigma] = best_lambda_sigma_finder(Xtr,Ytr,Xts,Yts,sigmav,lambdav);
    
    disp(['best lambda = ' num2str(best_lambda)])
    disp(['best sigma  = ' num2str(best_sigma)])
    
    best_c = regularizedKernLSTrain(Xtr, Ytr,'gaussian', best_sigma, best_lambda);
    
    Yfit = regularizedKernLSTest(best_c, Xtr, 'gaussian', best_sigma, Xval);
    
    %mean_square_val = immse(Yfit,Yval);
    %mean_square_val_v(i_fold) = mean_square_val;
    mean_square_val_v(i_fold) = immse(Yfit,Yval);
    disp(['mse on val set = ' num2str(mean_square_val_v(i_fold))])
    
end

%% calculatingMSE averaged on the datasets
disp('-------------------------------------------------------------------')
disp(['averaged over S mse of my model = ' num2str(mean(mean_square_val_v))])
disp('-------------------------------------------------------------------')

%% saving averaged MSE in a text file
dlmwrite('./output/averaged_mese.txt',mean(mean_square_val_v),'delimiter','')


