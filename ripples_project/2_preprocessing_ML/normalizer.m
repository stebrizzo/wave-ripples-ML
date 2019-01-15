function [normalized_dataset meanv stdv] = normalizer(dataset)
%normalizer scales the dataset in order to have 0 mean and 1 std data
%   it give also means and stds of the data in two vectors
meanv = mean(dataset,1);
stdv = std(dataset,1);

normalized_dataset = dataset-meanv;
normalized_dataset = normalized_dataset./stdv;

end

