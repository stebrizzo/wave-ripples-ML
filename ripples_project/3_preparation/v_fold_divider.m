function v_fold_divider(shuffled_dataset,no_div)
%v_fold_divider divide the dataset in no_div parts and create no_div
%datasets structures with training test and val sets
%   

[N D] = size(shuffled_dataset);
n_div = no_div+1;
l_div = floor(N/n_div);

ind_div = 1:l_div:N;
for i = 1:(n_div-1)
    divided_dataset{i} = shuffled_dataset(ind_div(i):ind_div(i+1),:);
end

% definisco 5 divisioni diverse tra train, validation e test
for i = 1:no_div
    ind_sub = i:i+no_div-1;
    
    for j = 1:no_div
        if ind_sub(j) > no_div
            ind_sub(j) = ind_sub(j)-no_div;
        end
    end
    
    
    train_set = [divided_dataset{ind_sub(1)}; divided_dataset{ind_sub(2)}; divided_dataset{ind_sub(3)}];
    validation_set = divided_dataset{ind_sub(4)};
    test_set = divided_dataset{ind_sub(5)};
    
    ready_dataset.train = train_set;
    ready_dataset.validation = validation_set;
    ready_dataset.test = test_set;
    
    save(['./output/' 'dataset' num2str(i) '.mat'], 'ready_dataset');
    
end






end

