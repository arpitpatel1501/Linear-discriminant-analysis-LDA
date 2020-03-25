function [V,D]= Eigen(A)
    A =[ 0.00117795   0.00035526    0.00039553   0.00011929];
  %disp("A")
  %disp(A)
  B = A;
  B1 = A;
  [row,col] = size(A);
  cnt=1;
  
  for k=1 : 20
    
    [Q,R] = QR(B1);
    B1 = Multiplication(R,Q);
    
  endfor
  %disp("B1")
  %disp(B1);
  for i=1 : row
    for j=1 : col
      if (i==j)
        D(i,j) = B1(i,j);
      else
        D(i,j)=0;
      endif
    endfor
  endfor
  
  %disp("D")
  %disp(D)
  
  for i=1 : row
    C=B;
    %disp("C = B")
    %disp(C)
    for j=1 : col
      C(j,j) = C(j,j) - D(i,i);
    endfor
    %disp("C")
    %disp(C)
    C = RREF(C,0);
    %disp("after RREF C")
    %disp(C)
    result(:,cnt) = EigenVector(C);
    cnt=cnt+1;
  endfor
  
  V = Orthonormal(result);
  %disp("EigenVector");
  %disp(V);
  %disp("Diagonal");
  %disp(D);
endfunction
