data = csvread('handWalkimg40.csv');

x=data(:,5)';

num = 400;
aver_v = averageFilter(data(:,5)',num);
aver_v=[aver_v(1)*ones(1,num-1),aver_v];

num2 = 30;
aver_v2 = averageFilter(data(:,5)',num2);
aver_v2=[aver_v(1)*ones(1,num2-1),aver_v2];
figure,
hold on
plot(data(:,1),aver_v)
hold on
plot(data(:,1),aver_v2)
hold on
plot(data(:,1),data(:,5))


%%%Ëã·¨²¿·Ö%%%%%%%%%%%%%%%%%%%%%%%
v = true;
lastItem = -10;
bottom=aver_v2(1);
bottom_i=0;
top=0;
top_i=0;
step_num = -1;
for i=1:size(aver_v,2)
 delta = (aver_v(i)-aver_v2(i));

    if ne(delta>0, v)
        if((i-lastItem)>=10 || (i-lastItem)<=100)
            v = ~v;
          if(top - bottom>0.8 && abs(top_i - bottom_i)>5 && abs(top_i - bottom_i)<60)
             step_num = step_num+1;
             lastItem = i;
            end
        
        end
    else
        if delta>0 
            top = max(top,delta);
            top_i=i;
        elseif delta<0 
            bottom = min(bottom,-delta);
            bottom_i = i;
        end
    end
end

step_num