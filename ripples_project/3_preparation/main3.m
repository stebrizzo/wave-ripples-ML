% main3

%% housekeeping
clear all; close all;

%% loading dataset
load('./input/ready_dataset.mat');


%% mescolo
shuffled_dataset = shuffler(dataset);

%% divido in 5 parti il dataset mischiato
v_fold_divider(shuffled_dataset,5)

