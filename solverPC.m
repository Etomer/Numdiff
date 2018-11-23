function y=solverPC(f,timeStep,ToL,y0,ts);
%Ammet f,timeStep,y,Fo,ToL,max
%BDFmet f,timeStep,y,Fo
y=ones(2,ts/timeStep);
Fo=ones(2,ts/timeStep);
Fo(:,1)=f(y0);
y(:,1)=y0;
count=3;

%y(:,2)=y(:,1);
y(:,2)=BDF1(f,timeStep,y(:,1),Fo(:,1:1));
y(:,2)=AM1(f,timeStep,y(:,1),Fo(:,1:1),ToL,1000);
Fo(:,2)=f(y(:,2));

%y(:,3)=y(:,2);
y(:,3)=BDF2(f,timeStep,y(:,2),Fo(:,1:2));
y(:,3)=AM2(f,timeStep,y(:,2),Fo(:,1:2),ToL,1000);
Fo(:,3)=f(y(:,3));

for i=4:ts/timeStep
   %y(:,count+1)=y(:,count);
   y(:,count+1)=BDF3(f,timeStep,y(:,count),Fo(:,count-2:count));
   y(:,count+1)=AM3(f,timeStep,y(:,count),Fo(:,count-2:count),ToL,1000);
   Fo(:,count+1)=f(y(:,count+1));
   count=count+1;
end




end
