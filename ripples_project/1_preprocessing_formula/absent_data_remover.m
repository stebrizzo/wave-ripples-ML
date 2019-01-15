function [new_dataset] = absent_data_remover(old_dataset,predicted_feature)
%absent_data_remover Removes missing data
%   Given a dataset (old_dataset) and the column of the feature you want 
%   to predict (predicted_feature) it delate all the row with nan in it
new_dataset = old_dataset(isnan(old_dataset(:,predicted_feature))==0,:);
end

