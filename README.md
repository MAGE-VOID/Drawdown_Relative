# Drawdown_Relative

The DD_Relative function calculates the relative profit or loss (drawdown) of the current trading account in percentage. To do this, it uses the Current_LossOrProfit() function to get the current profit or loss of all open positions and then divides it by the current account balance obtained via the AccountInfoDouble(ACCOUNT_BALANCE) function.

After calculating the relative gain or loss in percentage, the function uses the NormalizeDouble() function to round the result to two decimal places, and then displays the result in the chart comment using the Comment() function. Finally, the function returns the result of the relative gain or loss in percentage.

The Current_LossOrProfit() function is used to calculate the current profit or loss of all open positions in the trading account. Loops through all open positions using a for loop, and for each position, checks if its magic number matches the magic number specified in the code (MAGIC) and if the symbol of the position is the same as the current symbol on the chart. If the position meets these criteria, the position's commission, swap, and current profit or loss are added to the Positionsprofit variable.

Once all the profits and losses of the positions have been added up, the function uses the NormalizeDouble() function to round the result to two decimal places, and then returns the value of the current profit or loss.
