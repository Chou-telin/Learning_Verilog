module clock2 (clk,clr,Hr,Min,Sec);
input clk,clr;
output [7:0]Hr,Min,Sec;
reg [7:0]Hr,Min,Sec; 

always@(posedge clk)
	if(clr)
		begin 
				Hr=0;Min=0;Sec=0;
		end
	else if({Hr,Min,Sec}==24'h235959)
		begin
				{Hr,Min,Sec}=0;
		end
	else if({Hr[3:0],Min,Sec}==20'h95959)
		begin
				{Hr[3:0],Min,Sec}=0;
				Hr[7:4]=Hr[7:4]+1;
		end
	else if({Min,Sec}==16'h5959)
		begin
				Min=0;
				Sec=0;
				Hr[3:0]=Hr[3:0]+1;
		end
	else if({Min[3:0],Sec}==12'h959)
		begin
				Min[3:0]=0;
				Sec=0;
				Min[7:4]=Min[7:4]+1;
		end
	else if(Sec==8'h59)
		begin
				Sec=0;
				Min[3:0]=Min[3:0]+1;
		end
	else if(Sec[3:0]==4'h9)
		begin
				Sec[3:0]=0;
				Sec[7:4]=Sec[7:4]+1;
			
		end
	else
		begin
			Sec[3:0]=Sec[3:0]+1;
		end
		
endmodule
