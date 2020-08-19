clear all;

lambda = 0;
alpha = 0.1;
epochs = 100;
neurons_per_layer = [-1 1 1 -1];

[X y] = getToyData();% getData(100); % getToyData();



[X_train y_train X_test y_test X_validation y_validation] = split_train_test_validation(X, y, 0.3, 0.2);

m = size(X, 1);

number_features = size(X, 2);
number_clases = size(unique(y), 1);
neurons_per_layer(1) = number_features;
neurons_per_layer(end) = number_clases;

neurons_per_layer

thetas_rolled = initWeights(neurons_per_layer);



[Js_train Js_validation] = learningCurves(neurons_per_layer, thetas_rolled, X_train, y_train, X_validation, y_validation, alpha, lambda);

hold on;
plot(1:size(Js_train, 2), Js_train, 'b');
plot(1:size(Js_validation, 2), Js_validation, 'r');
xlabel('m')
ylabel('J')
legend('training', 'validation')
title('Learning Curves')






%{


[new_thetas_rolled Js_train Js_validation] = train(neurons_per_layer, thetas_rolled, epochs, X_train, y_train, X_validation, y_validation, alpha, lambda);

J_test = nnCostFunction(neurons_per_layer, new_thetas_rolled, X_test, y_test, lambda);
disp(sprintf('Error final de test: %.2f', J_test));

hold on;
plot(1:size(Js_train, 2), Js_train, 'b');
plot(1:size(Js_validation, 2), Js_validation, 'r');
xlabel('iterations')
ylabel('Cost')
legend('training', 'validation')
title('Cost by iteration')

predictions_train = predict(neurons_per_layer, new_thetas_rolled, X_train);
predictions_test = predict(neurons_per_layer, new_thetas_rolled, X_test);
% displayImageData(X_test(1:10,:));
fprintf('\nTraining Set Accuracy: %f\n', mean(double(predictions_train == y_train)) * 100);
fprintf('\nTest Set Accuracy: %f\n', mean(double(predictions_test == y_test)) * 100);

% displayImageData(X_to_predict);





%}
