function [shuffled_dataset] = shuffler(dataset)
%shuffled_dataset mischia il dataset
%   
[N D] = size(dataset);
shuffled_ind = randperm(N);
shuffled_dataset = dataset(shuffled_ind,:);
end

