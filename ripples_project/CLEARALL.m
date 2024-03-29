% RUNALL
% serve per far partire tutto l'esperimento

%% housekeeping
clear all; close all; clc;

%% chose your sistem
%sistema = 0; % windows sistem
%sistema = 1; % linux sistem

sistema = input('insert 1 for linux system or 0 for windows system  ')

%% run all
if sistema == 1
    system('rm ./1_preprocessing_formula/output/*');
    
    system('rm ./2_preprocessing_ML/input/*');
    system('rm ./2_preprocessing_ML/output/*');

    system('rm ./3_preparation/input/*');
    system('rm ./3_preparation/output/*');
    
    system('rm ./4_my_model/input/*');
    system('rm ./4_my_model/output/*');
    
    system('rm ./5_existing_model/input/*');
    system('rm ./5_existing_model/output/*'); 
else
    system('del /q .\1_preprocessing_formula\output\*');
    
    system('del /q .\2_preprocessing_ML\input\*');
    system('del /q .\2_preprocessing_ML\output\*');

    system('del /q .\3_preparation\input\*');
    system('del /q .\3_preparation\output\*');
    
    system('del /q .\4_my_model\input\*');
    system('del /q .\4_my_model\output\*');
    
    system('del /q .\5_existing_model\input\*');
    system('del /q .\5_existing_model\output\*');
end





