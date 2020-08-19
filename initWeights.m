function initial_thetas_rolled = initWeights(neurons_per_layer)
  
  sum_total_weights = 0;
  for i=1:size(neurons_per_layer, 2)-1
    sum_total_weights += (neurons_per_layer(i)+1) * neurons_per_layer(i+1);
    
  endfor
  initial_thetas_rolled = rand(sum_total_weights, 1);
  
  
endfunction
