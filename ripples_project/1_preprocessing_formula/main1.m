% main1

%% housekeeping
clear all; close all;

%% loading dataset
load('./input/dataset_org.mat','DATA');

%% reducing dataset to meaningfull data (for the formula)
DATA = absent_data_remover(DATA,2);
DATA = extreme_data_remover(DATA,2,[0 2]);
DATA = specific_data_remover(DATA,17,3);

%% saving
save('output/dataset.mat','DATA')












