function [output_dataset] = missing_meanmode_replacer(input_dataset,mean_f,mode_f)
%missing_meanmode_replacecer replace input dataset NaN values with mean and mode 
%   NaN values of mean_f features are replaced with mean of the data, otherwise  
%   NaN values of mode_f features are replaced with mode of the data

for i = mean_f
    idata = input_dataset(:,i);
    idata(find(isnan(idata)==1)) = nanmean(idata);
    input_dataset(:,i) = idata;
end

for i = mode_f
    idata = input_dataset(:,i);
    idata(find(isnan(idata)==1)) = mode(idata);
    input_dataset(:,i) = idata;
end

output_dataset = input_dataset;

end

