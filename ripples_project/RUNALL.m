% RUNALL
% serve per far partire tutto l'esperimento
tic
%% housekeeping
clear all; close all; clc;

%% chose your sistem
%sistema = 0; % windows sistem
%sistema = 1; % linux sistem

sistema = input('insert 1 for linux system or 0 for windows system  ')

%% run all
if sistema == 1
    
    %%% preprocessing
    disp('- PREPROCESSING:')
    
    % run 1_preprocessing_formula
    run('./1_preprocessing_formula/main1');
    system('cp ./1_preprocessing_formula/output/dataset.mat ./2_preprocessing_ML/input/');
    
    % run 2_preprocessing_ML
    run('./2_preprocessing_ML/main2');
    system('cp ./2_preprocessing_ML/output/ready_dataset.mat ./3_preparation/input/');
    
    disp('...done!')
    
    %%% preparation
    disp('- PREPARING DATASETS FOR K FOLD CROSS VALIDATION:')
    
    run('./3_preparation/main3');
    system('cp ./3_preparation/output/*.mat ./4_my_model/input/');
    system('cp ./3_preparation/output/*.mat ./5_existing_model/input/');
    system('cp ./2_preprocessing_ML/output/meanv*.mat ./5_existing_model/input/');
    system('cp ./2_preprocessing_ML/output/stdv*.mat ./5_existing_model/input/');
    system('cp ./2_preprocessing_ML/output/meanv*.mat ./4_my_model/input/');
    system('cp ./2_preprocessing_ML/output/stdv*.mat ./4_my_model/input/');
    disp('...done!')
    
    %%% my model
    disp('- MY MODEL:')
    
    run('./4_my_model/main4');
    
    disp('done!')
    
    %%% existing_model
    disp('EXISTING MODEL:')
    disp('-------------------------------------------------------------------')
    
    run('./5_existing_model/main5');
    
    disp('...done!')
    
else
    
    %%% preprocessing
    disp('- PREPROCESSING:')
    
    % run 1_preprocessing_formula
    run('.\1_preprocessing_formula\main1');
    system('copy .\1_preprocessing_formula\output\dataset.mat .\2_preprocessing_ML\input\ >NUL');
    
    % run 2_preprocessing_ML
    run('.\2_preprocessing_ML\main2');
    system('copy .\2_preprocessing_ML\output\ready_dataset.mat .\3_preparation\input\  >NUL');
    
    disp('...done!')
    
    %%% preparation
    disp('- PREPARING DATASETS FOR K FOLD CROSS VALIDATION:')
    
    run('.\3_preparation\main3');
    system('copy .\3_preparation\output\*.mat .\4_my_model\input\  >NUL');
    system('copy .\3_preparation\output\*.mat .\5_existing_model\input\ >NUL');
    system('copy .\2_preprocessing_ML\output\meanv*.mat .\5_existing_model\input\ >NUL');
    system('copy .\2_preprocessing_ML\output\stdv*.mat .\5_existing_model\input\ >NUL');
    system('copy .\2_preprocessing_ML\output\meanv*.mat .\4_my_model\input\ >NUL');
    system('copy .\2_preprocessing_ML\output\stdv*.mat .\4_my_model\input\ >NUL');
    
    disp('...done!')
    
    %%% my model
    disp('- MY MODEL:')
    
    run('.\4_my_model\main4');
    
    disp('done!')
    
    %%% existing_model
    disp('EXISTING MODEL:')
    disp('-------------------------------------------------------------------')
    
    run('.\5_existing_model\main5');
    
    disp('...done!')
end

toc



