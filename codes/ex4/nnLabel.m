function y  = nnLabel(y,K)
  finalY = zeros(size(y),K);
  for i = 1:size(y)
    initialY = zeros(1,K);
    if (y(i)==0)
      initialY(1,K) = 1;
    else
      initialY(1,y(i)) = 1;
    endif
    finalY(i,:) = initialY;
  end
  y = finalY;
end