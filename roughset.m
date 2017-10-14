function y = roughset(x)    
     
     sz=[1 25];
     a=reshape(x,sz);     
     y=a(13);
     if(y>0)
      count=-1;
      edge=0;
      for i=1:25
          ratio=a(i)/y;
          if(ratio>=0.9 && ratio<=1.1)
              edge=edge+a(i);
              count=count+1;
          end
      end    
     
          if(count<5)
              %noise
             
              total=0;
             
              for i=1:25
                  total=total+a(i);
             
              end
                 
              y=total/25;
          
          else if(count==5)
              d=1
             edge=edge-y;
             y=edge/5;
         end
     end
    
    
        
    
    
end

%============================

