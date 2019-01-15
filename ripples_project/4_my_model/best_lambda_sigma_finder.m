function [best_lambda best_sigma] = best_lambda_sigma_finder(Xtr,Ytr,Xts,Yts,sigmav,lambdav)
%best_lambda_sigma_finder find best lambda and sigma for gaussian kernel
%   bla bla bla

kernel = 'gaussian'; disp(['kernel: ' kernel])
% waitbar
n = length(sigmav)* length(lambdav); count = 0; H = waitbar(0,'1','Name','holding out best lambda and sigma...');

for j = 1:length(lambdav)
    for i = 1:length(sigmav)
        sigma = sigmav(i);
        lambda = lambdav(j);
        c = regularizedKernLSTrain(Xtr, Ytr, kernel, sigma, lambda);
        ypred = regularizedKernLSTest(c, Xtr, kernel, sigma, Xts);
        mean_square(i,j) = immse(ypred,Yts);
        
        % waitbar
        count = count + 1; waitbar(count / n, H, sprintf('combination (lambda,sigma) %d of %d', count, n));
        
    end
end

close(H)

[sigmam lambdam] = meshgrid(sigmav,lambdav);
[row col]= find(mean_square==min(mean_square(:)));
best_lambda = lambdam(col,row);
best_sigma = sigmam(col,row);

% figure(1)
% mesh(sigmam,lambdam,mean_square','FaceColor','interp')
% view(2)
% set(gca,'YScale','log'); set(gca,'ZScale','log');
% xlabel('\sigma'); ylabel('\lambda'); zlabel('MSE');
% hold on
% scatter3(best_sigma,best_lambda,min(mean_square(:))+100,'filled','k')
% set(gca,'YScale','log'); set(gca,'ZScale','log')
% colorbar
% grid off
% legend('MSE',['best (\lambda,\sigma)=(' num2str(best_lambda) ',' num2str(best_sigma) ')'],'Location','south')
% title(['min(MSE)=' num2str(min(mean_square(:)))])

end

