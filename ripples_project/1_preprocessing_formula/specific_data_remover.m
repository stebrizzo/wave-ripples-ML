function [new_dataset] = specific_data_remover(old_dataset,column,val)
%extreme_data_remover Removes strange outliers
%   Given a dataset (old_dataset) and the column of the feature you want 
%   to limit (column) and the limit (lim) it delate all the row with values
%   outside the vector lim (exp: lim = [0 2])
 new_dataset= old_dataset(find(old_dataset(:,column)~=val),:);
;

end

