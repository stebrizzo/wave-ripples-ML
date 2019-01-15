function [new_dataset] = extreme_data_remover(old_dataset,column,lim)
%extreme_data_remover Removes strange outliers
%   Given a dataset (old_dataset) and the column of the feature you want 
%   to limit (column) and the limit (lim) it delate all the row with values
%   outside the vector lim (exp: lim = [0 2])
 new_dataset= old_dataset(find(old_dataset(:,column)>=lim(1) & old_dataset(:,column)<=lim(2)),:);


end

