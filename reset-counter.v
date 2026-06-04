module reset_counter; 
reg clk;
reg reset;
reg [3:0] counter;
initial begin 
    clk = 0;
    counter = 0; 
end
initial begin
    reset = 1;
    #10 reset = 0;

    #50 reset = 1;
    #10 reset = 0;
end
always #5 clk=~clk;
always @(posedge clk)
begin
    if(reset)
    begin
      counter <= 0;
      //$display("counter=%b", counter);
    end
    else 
    begin
        counter<=counter+1;
    end
end
always @(posedge clk)
begin 
     $display("time=%0t counter=%b reset=%b", $time, counter,reset);
end
initial begin
    #100;
    $finish;
end
endmodule 