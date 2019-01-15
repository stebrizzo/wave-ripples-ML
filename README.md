# wave-ripples-ML
trying to predict wave ripples wavelegth with machine learning techniques


-- How is it organized --
----------------------------------------------------------------------------------------------------------
This project is developed in MATLAB. It is organized in 5 folders:
  1_preprocessing_formula
  2_preprocessing_ML
  3_preparation
  4_my_model
  5_existing_model
Each folder contains a main.m file, a bunch of useful functions and two folders named input and output from which data are taken and in which results are saved.


-- What does it do --
----------------------------------------------------------------------------------------------------------
Each folder contains codes to do these operations:
  1 & 2 : preprocessing on the dataset (deleting features or data, one-hot encoding, ...);
  3     : prepare the datasets for 5-fold cross validation;
  4     : train my model (RLS with gaussian kernel) finding the best values for lambda (the regularizer) and sigma (the   kernel's tuneing parameter) and then calculates the averaged MSE on the validation sets;
  5     : MSE on the hole dataset given by the empirical formula is calculated in order to compare my model with the empirical formulas.


-- How to run the experiment --
----------------------------------------------------------------------------------------------------------
In the main folder (ripples_project) are contained two useful MATLAB codes:
  CLEARALL.m : if executed with MATLAB, delete all old experiment results;
  CLOSEALL.m : if executed with MATLAB, run all the experiment.
Both CLEARALL.m and CLOSEALL.m request to insert 1 if you have a Linux system, or 0 if you have a Windows system.


-- Other informations --
----------------------------------------------------------------------------------------------------------
In the ripples_project folder is contained a screenshot of my results named Screenshot.png


