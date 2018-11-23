function yn=BDF1(f,timeStep,y,Fo)

yn=y+timeStep.*f(y);

end
