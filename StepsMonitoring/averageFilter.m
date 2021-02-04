function out = averageFilter(in,num)
out=zeros(size(in,1),size(in,2)-num+1);
for i =num:size(in,2)
   
    val = sum(in(:,i-num+1:i))/num;
    out(:,i-num+1) = val;
end
end

%**
%d=0.1
%y= (1/(sqrt(2*3.14)*d))* gaussmf(x,[d,5])
%figure,plot(x,y)
%sum(y)